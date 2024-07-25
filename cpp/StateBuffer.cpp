#include "StateBuffer.hpp"
#include <iostream>
#include <vector>
#include <hls_stream.h>

bool operator==(const LPState &lhs, const LPState &rhs) {
    return lhs.lp_id == rhs.lp_id && lhs.lvt == rhs.lvt && lhs.rng_state == rhs.rng_state;
}

// Top-level function for HLS synthesis
void test_state_buffer(hls::stream<TestOperation>& in_stream, hls::stream<int>& out_stream) {
    #pragma HLS INTERFACE axis port=in_stream
    #pragma HLS INTERFACE axis port=out_stream
    #pragma HLS INTERFACE s_axilite port=return

    StateBuffer buffer;

    TestOperation op;
    while (!in_stream.empty()) {
        #pragma HLS PIPELINE II=1
        in_stream.read(op);

        switch (op.type) {
            case 0: // Push
            {
                LPState state{op.lp_id, op.time, 0}; // RNG state set to 0 for simplicity
                buffer.push(state);
                break;
            }
            case 1: // Rollback
                buffer.rollback(op.lp_id, op.time);
                break;
            case 2: // Commit
                buffer.commit(op.time);
                break;
        }
    }

    // Output final state
    out_stream.write(buffer.get_gvt());
    for (int lp_id = 0; lp_id < NUM_LPS; ++lp_id) {
        int current = buffer.lp_heads[lp_id];
        while (current != -1) {
            const LPState& state = buffer.buffer[current].state;
            out_stream.write(state.lvt);
            current = buffer.buffer[current].next;
        }
        out_stream.write(-1); // Indicate end of LP states
    }
}
