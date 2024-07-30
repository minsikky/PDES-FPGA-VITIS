#ifndef STATE_BUFFER_HPP
#define STATE_BUFFER_HPP

#include <ap_int.h>
#include <hls_stream.h>
#include "constants.hpp"

struct LPState
{
    ap_int<16> lp_id;
    ap_int<32> lvt;
    ap_uint<32> rng_state;
};

struct Node
{
    LPState state;
    ap_uint<16> next;
};

class StateBuffer
{
private:
    Node nodes[STATE_BUFFER_CAPACITY];
    ap_uint<16> lp_heads[NUM_LPS];
    ap_uint<16> lp_sizes[NUM_LPS];
    ap_uint<16> free_head;
    ap_uint<16> total_size;
    ap_int<32> current_gvt;

public:
    StateBuffer()
    {
        reset();
    }

    void reset()
    {
        free_head = 0;
        total_size = 0;
        current_gvt = 0;

        for (ap_uint<16> i = 0; i < STATE_BUFFER_CAPACITY - 1; ++i)
        {
            nodes[i].next = i + 1;
        }
        nodes[STATE_BUFFER_CAPACITY - 1].next = 0xFFFF; // End of free list

        for (ap_uint<16> i = 0; i < NUM_LPS; ++i)
        {
            lp_heads[i] = 0xFFFF; // Invalid index
            lp_sizes[i] = 0;
        }
    }

    bool push(const LPState &state)
    {
        if (total_size >= STATE_BUFFER_CAPACITY)
            return false;

        ap_uint<16> new_node = free_head;
        free_head = nodes[new_node].next;

        nodes[new_node].state = state;
        nodes[new_node].next = lp_heads[state.lp_id];
        lp_heads[state.lp_id] = new_node;

        lp_sizes[state.lp_id]++;
        total_size++;
        return true;
    }

    bool pop(ap_int<16> lp_id, LPState &state)
    {
        if (lp_sizes[lp_id] == 0)
            return false;

        ap_uint<16> popped = lp_heads[lp_id];
        state = nodes[popped].state;
        lp_heads[lp_id] = nodes[popped].next;

        nodes[popped].next = free_head;
        free_head = popped;

        lp_sizes[lp_id]--;
        total_size--;
        return true;
    }

    bool commit(ap_int<32> commit_time)
    {
        current_gvt = commit_time;
        ap_uint<16> removed = 0;

        for (ap_uint<16> lp_id = 0; lp_id < NUM_LPS; ++lp_id)
        {
            ap_uint<16> current = lp_heads[lp_id];
            ap_uint<16> prev = 0xFFFF;
            bool keep_next = true;

            while (current != 0xFFFF)
            {
                ap_uint<16> next = nodes[current].next;

                if (nodes[current].state.lvt <= commit_time)
                {
                    if (keep_next)
                    {
                        // This is the first state we encounter that's older than or equal to commit_time
                        // We keep this state
                        keep_next = false;
                        prev = current;
                        current = next;
                    }
                    else
                    {
                        // Remove this state
                        if (prev == 0xFFFF)
                        {
                            lp_heads[lp_id] = next;
                        }
                        else
                        {
                            nodes[prev].next = next;
                        }

                        nodes[current].next = free_head;
                        free_head = current;

                        removed++;
                        lp_sizes[lp_id]--;
                        current = next;
                    }
                }
                else
                {
                    // This state is younger than commit_time, keep it
                    prev = current;
                    current = next;
                }
            }
        }

        total_size -= removed;
        return true;
    }

    bool rollback(ap_int<16> lp_id, ap_int<32> to_time)
    {
        ap_uint<16> current = lp_heads[lp_id];
        ap_uint<16> prev = 0xFFFF;
        ap_uint<16> removed = 0;

        while (current != 0xFFFF && nodes[current].state.lvt > to_time)
        {
            ap_uint<16> next = nodes[current].next;

            // Remove this state
            if (prev == 0xFFFF)
            {
                lp_heads[lp_id] = next;
            }
            else
            {
                nodes[prev].next = next;
            }

            nodes[current].next = free_head;
            free_head = current;

            removed++;
            current = next;
        }

        if (removed > 0)
        {
            lp_sizes[lp_id] -= removed;
            total_size -= removed;
            return true;
        }
        return false;
    }

    ap_uint<16> get_lp_size(ap_int<16> lp_id) const
    {
        return lp_sizes[lp_id];
    }

    ap_uint<16> get_total_size() const
    {
        return total_size;
    }

    ap_int<32> get_gvt() const
    {
        return current_gvt;
    }
};

// Kernel function declaration
void state_buffer_kernel(ap_uint<2> op, LPState state, LPState &result, bool &success);

int test_state_buffer();

#endif // STATE_BUFFER_HPP