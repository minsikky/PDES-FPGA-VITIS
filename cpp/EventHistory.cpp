#include "EventHistory.hpp"
#include <iostream>

void event_history_kernel(ap_uint<2> op, TimeWarpEvent event, TimeWarpEvent &result, bool &success)
{
    #pragma HLS INTERFACE ap_ctrl_hs port=return
    #pragma HLS INTERFACE ap_none port=op
    #pragma HLS INTERFACE ap_none port=event
    #pragma HLS INTERFACE ap_vld port=result
    #pragma HLS INTERFACE ap_vld port=success

    static EventHistory history;
    static EventQueue event_queue;  // You might need to initialize this properly

    switch(op)
    {
        case 0:  // Push operation
            success = history.push(event);
            result = event;
            break;
        case 1:  // Pop operation
            success = history.pop(event.receiver_id, result);
            break;
        case 2:  // Rollback operation
            success = history.rollback(event.receiver_id, event.recv_time, event_queue);
            result = event;
            break;
        case 3:  // Commit operation
            success = history.commit(event.recv_time);
            result.recv_time = history.get_gvt();
            break;
        default:
            success = false;
    }
}

int test_event_history() {
    ap_uint<2> op;
    TimeWarpEvent event, result;
    bool success;

    // Test push operations
    std::cout << "Pushing events:" << std::endl;
    for (int i = 0; i < 20; ++i) {
        op = 0;  // Push
        event.sender_id = i % 8;
        event.receiver_id = i % 4;
        event.send_time = i * 5;
        event.recv_time = i * 10;
        event.data = i * 100;
        event.is_anti_message = (i % 2 == 0) ? 0 : 1;

        event_history_kernel(op, event, result, success);

        if (success) {
            std::cout << "Pushed: LP " << event.receiver_id << ", Send Time " << event.send_time 
                      << ", Recv Time " << event.recv_time << ", Data " << event.data << std::endl;
        } else {
            std::cout << "Push failed for LP " << event.receiver_id << std::endl;
        }
    }

    // Test pop operations
    std::cout << "\nPopping events:" << std::endl;
    for (int lp = 0; lp < 4; ++lp) {
        std::cout << "LP " << lp << ": ";
        op = 1;  // Pop
        event.receiver_id = lp;
        while (true) {
            event_history_kernel(op, event, result, success);
            if (success) {
                std::cout << "(" << result.recv_time << "," << result.data << ") ";
            } else {
                std::cout << "(empty)";
                break;
            }
        }
        std::cout << std::endl;
    }

    // Repush events for rollback and commit tests
    for (int i = 0; i < 20; ++i) {
        op = 0;  // Push
        event.sender_id = i % 8;
        event.receiver_id = i % 4;
        event.send_time = i * 5;
        event.recv_time = i * 10;
        event.data = i * 100;
        event.is_anti_message = (i % 2 == 0) ? 0 : 1;
        event_history_kernel(op, event, result, success);
    }

    // Test rollback operation
    std::cout << "\nRolling back LP 2 to receive time 70:" << std::endl;
    op = 2;  // Rollback
    event.receiver_id = 2;
    event.recv_time = 70;
    event_history_kernel(op, event, result, success);
    if (success) {
        std::cout << "Rollback successful for LP 2 to receive time " << event.recv_time << std::endl;
    } else {
        std::cout << "Rollback failed for LP 2" << std::endl;
    }

    // Test commit operation
    std::cout << "\nCommitting up to receive time 100:" << std::endl;
    op = 3;  // Commit
    event.recv_time = 100;
    event_history_kernel(op, event, result, success);
    if (success) {
        std::cout << "Commit successful, new GVT: " << result.recv_time << std::endl;
    } else {
        std::cout << "Commit failed" << std::endl;
    }

    // Test pop operations to verify the state after rollback and commit
    std::cout << "\nPopping events after rollback and commit:" << std::endl;
    for (int lp = 0; lp < 4; ++lp) {
        std::cout << "LP " << lp << ": ";
        op = 1;  // Pop
        event.receiver_id = lp;
        while (true) {
            event_history_kernel(op, event, result, success);
            if (success) {
                std::cout << "(" << result.recv_time << "," << result.data << ") ";
            } else {
                std::cout << "(empty)";
                break;
            }
        }
        std::cout << std::endl;
    }

    return 0;
}