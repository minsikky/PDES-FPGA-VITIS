#include "StateBuffer.hpp"
#include <iostream>

static StateBuffer state_buffer;

void state_buffer_kernel(ap_uint<2> op, LPState state, LPState& result, bool& success) {
    #pragma HLS INTERFACE ap_ctrl_hs port=return
    #pragma HLS INTERFACE ap_none port=op
    #pragma HLS INTERFACE ap_none port=state
    #pragma HLS INTERFACE ap_vld port=result
    #pragma HLS INTERFACE ap_vld port=success

    switch(op) {
        case 0:  // Push operation
            success = state_buffer.push(state);
            result = state;
            break;
        case 1:  // Pop operation
            success = state_buffer.pop(state.lp_id, result);
            break;
        case 2:  // Commit operation
            success = state_buffer.commit(state.lvt);
            result.lvt = state_buffer.get_gvt();
            break;
        case 3:  // Rollback operation
            success = state_buffer.rollback(state.lp_id, state.lvt);
            result.lvt = state.lvt;
            break;
        default:
            success = false;
    }
}

int test_state_buffer() {
    ap_uint<2> op;
    LPState state, result;
    bool success;

    // Test push operations
    std::cout << "Pushing states:" << std::endl;
    for (int i = 0; i < 20; ++i) {
        op = 0;  // Push
        state.lp_id = i % 4;  // Use 4 different LPs
        state.lvt = i * 10;
        state.rng_state = i * 100;
        state_buffer_kernel(op, state, result, success);
        if (success) {
            std::cout << "Pushed: LP " << state.lp_id << ", LVT " << state.lvt << ", RNG " << state.rng_state << std::endl;
        } else {
            std::cout << "Push failed for LP " << state.lp_id << std::endl;
        }
    }

    // Test rollback operation
    std::cout << "\nRolling back LP 2 to LVT 70:" << std::endl;
    op = 3;  // Rollback
    state.lp_id = 2;
    state.lvt = 70;
    state_buffer_kernel(op, state, result, success);
    if (success) {
        std::cout << "Rollback successful for LP 2 to LVT " << result.lvt << std::endl;
    } else {
        std::cout << "Rollback failed for LP 2" << std::endl;
    }

    // Test commit operation
    std::cout << "\nCommitting up to LVT 100:" << std::endl;
    op = 2;  // Commit
    state.lvt = 100;
    state_buffer_kernel(op, state, result, success);
    if (success) {
        std::cout << "Commit successful, new GVT: " << result.lvt << std::endl;
    } else {
        std::cout << "Commit failed" << std::endl;
    }

    // Test pop operations after rollback and commit
    std::cout << "\nPopping states after rollback and commit:" << std::endl;
    for (int lp = 0; lp < 4; ++lp) {
        std::cout << "LP " << lp << ": ";
        while (true) {
            op = 1;  // Pop
            state.lp_id = lp;
            state_buffer_kernel(op, state, result, success);
            if (success) {
                std::cout << "(" << result.lvt << "," << result.rng_state << ") ";
            } else {
                std::cout << "(empty)";
                break;
            }
        }
        std::cout << std::endl;
    }

    return 0;
}