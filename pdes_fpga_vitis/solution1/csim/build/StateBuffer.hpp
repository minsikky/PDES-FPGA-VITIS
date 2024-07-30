#ifndef STATE_BUFFER_HPP
#define STATE_BUFFER_HPP

#include <ap_int.h>
#include <hls_stream.h>
#include <iostream>
#include "constants.hpp"

struct LPState
{
    ap_int<16> lp_id;
    ap_int<32> lvt;
    ap_uint<32> rng_state; // State for random number generation
};

struct StateEntry
{
    LPState state;
    ap_int<32> next; // Index of next state for this LP, or -1 if none
};

class StateBuffer
{
public:
    StateEntry buffer[STATE_BUFFER_CAPACITY];
    ap_int<32> lp_heads[NUM_LPS]; // Index of most recent state for each LP
    ap_int<32> lp_sizes[NUM_LPS]; // Number of states for each LP
    ap_int<32> free_list_head;    // Index of first free slot
    ap_int<32> current_gvt;

public:
    StateBuffer()
    {
        free_list_head = 0;
        for (ap_uint<32> i = 0; i < STATE_BUFFER_CAPACITY - 1; ++i)
        {
            buffer[i].next = i + 1;
        }
        buffer[STATE_BUFFER_CAPACITY - 1].next = -1;

        for (ap_uint<16> i = 0; i < NUM_LPS; ++i)
        {
            lp_heads[i] = -1;
            lp_sizes[i] = 0;
        }

        current_gvt = 0;
    }

    bool push(const LPState state)
    {
#pragma HLS INLINE
        ap_int<32> new_head = free_list_head;
        std::cout << "Push: new_head = " << new_head << std::endl;
        if (new_head == -1)
            return false; // Buffer is full

        ap_int<32> next_free = buffer[new_head].next;
        std::cout << "Push: next_free = " << next_free << std::endl;
        buffer[new_head].state = state;

        ap_int<32> old_head = lp_heads[state.lp_id];
        std::cout << "Push: old_head for LP " << state.lp_id << " = " << old_head << std::endl;
        lp_heads[state.lp_id] = new_head;
        buffer[new_head].next = old_head;

        lp_sizes[state.lp_id]++;
        free_list_head = next_free;

        std::cout << "Push: Updated lp_heads[" << state.lp_id << "] = " << lp_heads[state.lp_id] << std::endl;
        std::cout << "Push: Updated lp_sizes[" << state.lp_id << "] = " << lp_sizes[state.lp_id] << std::endl;
        std::cout << "Push: Updated free_list_head = " << free_list_head << std::endl;

        return true;
    }

    bool pop(ap_int<16> lp_id, LPState &result)
    {
#pragma HLS INLINE
        ap_int<32> head = lp_heads[lp_id];
        std::cout << "Pop: head for LP " << lp_id << " = " << head << std::endl;
        if (head == -1)
            return false;

        result = buffer[head].state;
        lp_heads[lp_id] = buffer[head].next;

        buffer[head].next = free_list_head;
        free_list_head = head;

        lp_sizes[lp_id]--;
        std::cout << "Pop: Updated lp_heads[" << lp_id << "] = " << lp_heads[lp_id] << std::endl;
        std::cout << "Pop: Updated lp_sizes[" << lp_id << "] = " << lp_sizes[lp_id] << std::endl;
        std::cout << "Pop: Updated free_list_head = " << free_list_head << std::endl;

        return true;
    }

    bool rollback(ap_int<16> lp_id, ap_int<32> to_time)
    {
#pragma HLS INLINE
        ap_int<32> current = lp_heads[lp_id];
        ap_int<32> removed = 0;

        while (current != -1 && buffer[current].state.lvt > to_time)
        {
            ap_int<32> next = buffer[current].next;

            buffer[current].next = free_list_head;
            free_list_head = current;

            current = next;
            removed++;
        }

        if (removed > 0)
        {
            lp_heads[lp_id] = current;
            lp_sizes[lp_id] -= removed;
            return true;
        }
        return false;
    }

    bool commit(ap_int<32> commit_time)
    {
#pragma HLS INLINE
        std::cout << "Commit called with time: " << commit_time << std::endl;
        current_gvt = commit_time;
        std::cout << "current_gvt updated to: " << current_gvt << std::endl;

        for (ap_uint<16> lp_id = 0; lp_id < NUM_LPS; ++lp_id)
        {
            ap_int<32> current = lp_heads[lp_id];
            ap_int<32> prev = -1;
            ap_int<32> removed = 0;
            bool keep_oldest = true;

#pragma HLS PIPELINE II = 2
            while (current != -1)
            {
                ap_int<32> next = buffer[current].next;

                if (buffer[current].state.lvt <= commit_time)
                {
                    if (keep_oldest)
                    {
                        // Keep the oldest state (first one we encounter)
                        keep_oldest = false;
                        prev = current;
                        current = next;
                    }
                    else
                    {
                        // Remove this state
                        if (prev == -1)
                        {
                            lp_heads[lp_id] = next;
                        }
                        else
                        {
                            buffer[prev].next = next;
                        }

                        buffer[current].next = free_list_head;
                        free_list_head = current;

                        removed++;
                        current = next;
                    }
                }
                else
                {
                    // If we've reached a state with LVT > commit_time, we can stop
                    break;
                }
            }

            lp_sizes[lp_id] -= removed;
        }
        return true; // Commit always succeeds
    }

    bool is_full() const
    {
#pragma HLS INLINE
        return free_list_head == -1;
    }

    ap_int<32> get_gvt() const
    {
#pragma HLS INLINE
        std::cout << "get_gvt called, returning: " << current_gvt << std::endl;
        return current_gvt;
    }

    LPState peek(ap_int<16> lp_id) const
    {
#pragma HLS INLINE
        if (lp_heads[lp_id] == -1)
            return {-1, -1, 0}; // Invalid state
        return buffer[lp_heads[lp_id]].state;
    }
};

struct TestOperation
{
    ap_uint<2> type; // 0: push, 1: rollback, 2: commit
    ap_int<16> lp_id;
    ap_int<32> time;
};

bool operator==(const LPState &lhs, const LPState &rhs);

// Top-level function for HLS synthesis
void state_buffer_kernel(hls::stream<TestOperation> &in_stream, hls::stream<ap_int<32>> &out_stream);

// This function is for simulation purposes only
int simple_test_state_buffer();
int test_state_buffer();

#endif // STATE_BUFFER_HPP