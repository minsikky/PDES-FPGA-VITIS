#include "StateBuffer.hpp"
#include <iostream>
#include <vector>
#include <hls_stream.h>

bool operator==(const LPState &lhs, const LPState &rhs) {
    return lhs.lp_id == rhs.lp_id && lhs.lvt == rhs.lvt && lhs.rng_state == rhs.rng_state;
}

// Define a struct for input operations
struct StateBufferInput {
    ap_uint<2> op_type;  // 0: Push, 1: Rollback, 2: Commit
    ap_int<16> lp_id;
    ap_int<32> time;
    ap_uint<32> rng_state;
};

// Global StateBuffer instance
StateBuffer g_state_buffer;

void state_buffer_kernel(
    StateBufferInput& input,
    bool& success
) {
    #pragma HLS INTERFACE ap_ctrl_hs port=return
    #pragma HLS INTERFACE ap_vld port=input
    #pragma HLS INTERFACE ap_vld port=success

    switch (input.op_type) {
        case 0: // Push
        {
            LPState state{input.lp_id, input.time, input.rng_state};
            success = g_state_buffer.push(state);
            break;
        }
        case 1: // Rollback
            success = g_state_buffer.rollback(input.lp_id, input.time);
            break;
        case 2: // Commit
            success = g_state_buffer.commit(input.time);
            break;
        default:
            success = false;  // Invalid operation
    }
}

int test_state_buffer() {
    StateBufferInput input;
    bool success;

    // Prepare test operations
    std::vector<StateBufferInput> operations = {
        {0, 0, 10, 0},  // Push LP 0, time 10
        {0, 1, 15, 0},  // Push LP 1, time 15
        {0, 0, 20, 0},  // Push LP 0, time 20
        {0, 0, 30, 0},  // Push LP 0, time 30
        {0, 0, 40, 0},  // Push LP 0, time 40
        {0, 0, 50, 0},  // Push LP 0, time 50
        {0, 0, 60, 0},  // Push LP 0, time 60
        {0, 1, 70, 0},  // Push LP 1, time 70
        {0, 1, 80, 0},  // Push LP 1, time 80
        {0, 1, 90, 0},  // Push LP 1, time 90
        {0, 1, 100, 0}, // Push LP 1, time 100
        {1, 0, 15, 0},  // Rollback LP 0 to time 15
        {2, 0, 12, 0},  // Commit to time 12
        {0, 1, 110, 0}, // Push LP 1, time 110
        {2, 0, 16, 0},  // Commit to time 16
    };

    // Process operations
    for (const auto& op : operations) {
        state_buffer_kernel(const_cast<StateBufferInput&>(op), success);
        if (!success) {
            std::cout << "Operation failed: type " << op.op_type << ", LP " << op.lp_id << ", time " << op.time << std::endl;
        }
    }

    // Output final state
    int gvt = g_state_buffer.get_gvt();
    std::vector<std::vector<LPState>> lp_states(NUM_LPS);

    for (int lp_id = 0; lp_id < NUM_LPS; ++lp_id) {
        LPState state;
        while (g_state_buffer.pop(lp_id, state)) {
            lp_states[lp_id].push_back(state);
        }
    }

    // Print results
    std::cout << "Final GVT: " << gvt << "\n";
    for (int lp_id = 0; lp_id < NUM_LPS; ++lp_id) {
        std::cout << "LP " << lp_id << " states:\n";
        for (const auto& state : lp_states[lp_id]) {
            std::cout << " LVT: " << state.lvt << ", RNG state: " << state.rng_state << "\n";
        }
    }

    return 0;
}
