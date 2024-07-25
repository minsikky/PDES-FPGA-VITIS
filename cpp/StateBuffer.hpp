#ifndef STATE_BUFFER_HPP
#define STATE_BUFFER_HPP

#include <ap_int.h>
#include <hls_stream.h>
#include "constants.hpp"

struct LPState {
    int lp_id;
    ap_int<32> lvt;
    ap_uint<32> rng_state; // State for random number generation
};

struct StateEntry {
    LPState state;
    int next; // Index of next state for this LP, or -1 if none
};

class StateBuffer {
public:
    StateEntry buffer[STATE_BUFFER_CAPACITY];
    int lp_heads[NUM_LPS]; // Index of most recent state for each LP
    int lp_sizes[NUM_LPS]; // Number of states for each LP
    int free_list_head; // Index of first free slot
    ap_int<32> current_gvt;

public:
    StateBuffer() {
//        #pragma HLS ARRAY_PARTITION variable=buffer complete dim=1
//        #pragma HLS ARRAY_PARTITION variable=lp_heads complete dim=1
//        #pragma HLS ARRAY_PARTITION variable=lp_sizes complete dim=1

        free_list_head = 0;
        for (int i = 0; i < STATE_BUFFER_CAPACITY - 1; ++i) {
            buffer[i].next = i + 1;
        }
        buffer[STATE_BUFFER_CAPACITY - 1].next = -1;

        for (int i = 0; i < NUM_LPS; ++i) {
            lp_heads[i] = -1;
            lp_sizes[i] = 0;
        }
    }

    bool push(const LPState &state) {
        #pragma HLS INLINE
        int new_head = free_list_head;
        if (new_head == -1)
            return false; // Buffer is full

        int next_free = buffer[new_head].next;
        buffer[new_head].state = state;

        int old_head = lp_heads[state.lp_id];
        lp_heads[state.lp_id] = new_head;
        buffer[new_head].next = old_head;

        lp_sizes[state.lp_id]++;
        free_list_head = next_free;

        return true;
    }

    bool pop(int lp_id, LPState &result) {
        #pragma HLS INLINE
        int head = lp_heads[lp_id];
        if (head == -1)
            return false;

        result = buffer[head].state;
        lp_heads[lp_id] = buffer[head].next;

        buffer[head].next = free_list_head;
        free_list_head = head;

        lp_sizes[lp_id]--;
        return true;
    }

    bool rollback(int lp_id, ap_int<32> to_time) {
        #pragma HLS INLINE
        int current = lp_heads[lp_id];
        int removed = 0;

        while (current != -1 && buffer[current].state.lvt > to_time) {
            int next = buffer[current].next;
            
            buffer[current].next = free_list_head;
            free_list_head = current;
            
            current = next;
            removed++;
        }

        if (removed > 0) {
            lp_heads[lp_id] = current;
            lp_sizes[lp_id] -= removed;
            return true;
        }
        return false;
    }

    void commit(ap_int<32> commit_time) {
        #pragma HLS INLINE
        current_gvt = commit_time;

        for (int lp_id = 0; lp_id < NUM_LPS; ++lp_id) {
            #pragma HLS PIPELINE II=1
            int current = lp_heads[lp_id];
            int prev = -1;
            int removed = 0;
            bool keep_oldest = true;

            while (current != -1) {
                int next = buffer[current].next;

                if (buffer[current].state.lvt <= commit_time) {
                    if (keep_oldest) {
                        // Keep the oldest state (first one we encounter)
                        keep_oldest = false;
                        prev = current;
                        current = next;
                    } else {
                        // Remove this state
                        if (prev == -1) {
                            lp_heads[lp_id] = next;
                        } else {
                            buffer[prev].next = next;
                        }

                        buffer[current].next = free_list_head;
                        free_list_head = current;

                        removed++;
                        current = next;
                    }
                } else {
                    // If we've reached a state with LVT > commit_time, we can stop
                    break;
                }
            }

            lp_sizes[lp_id] -= removed;
        }
    }

    bool is_full() const {
        #pragma HLS INLINE
        return free_list_head == -1;
    }

    ap_int<32> get_gvt() const {
        #pragma HLS INLINE
        return current_gvt;
    }

    LPState peek(int lp_id) const {
        #pragma HLS INLINE
        if (lp_heads[lp_id] == -1)
            return {-1, -1, 0}; // Invalid state
        return buffer[lp_heads[lp_id]].state;
    }
};

struct TestOperation {
    int type; // 0: push, 1: rollback, 2: commit
    int lp_id;
    ap_int<32> time;
};

void test_state_buffer(hls::stream<TestOperation>& in_stream, hls::stream<int>& out_stream);

#endif // STATE_BUFFER_HPP
