#include "EventQueue.hpp"
#include <iostream>
#include <random>
#include <algorithm>

// Global EventQueue instance
static EventQueue g_event_queue;

enum class Operation {
    ENQUEUE,
    DEQUEUE,
    ISSUE,
    COMMIT,
    ROLLBACK
};

void event_queue_kernel(
    ap_uint<3> op,
    TimeWarpEvent event,
    ap_int<16> lp_id,
    ap_int<32> time,
    EventQueueEntry &result_entry,
    bool &success
) {
    #pragma HLS INTERFACE ap_ctrl_chain port=return
    #pragma HLS INTERFACE ap_vld port=op
    #pragma HLS INTERFACE ap_vld port=event
    #pragma HLS INTERFACE ap_vld port=lp_id
    #pragma HLS INTERFACE ap_vld port=time
    #pragma HLS INTERFACE ap_vld port=result_entry
    #pragma HLS INTERFACE ap_vld port=success

    static EventQueue g_event_queue;

    switch (op) {
        case 0: // ENQUEUE
            success = g_event_queue.enqueue(event);
            result_entry = EventQueueEntry{TimeWarpEvent(), 0, 0xFFFF}; // Default entry
            break;
        case 1: // DEQUEUE
            result_entry = g_event_queue.dequeue();
            success = (result_entry.event.recv_time != INT32_MAX);
            break;
        case 2: // ISSUE
            success = g_event_queue.issue(result_entry.event);
            break;
        case 3: // COMMIT
            success = g_event_queue.commit(time);
            result_entry = EventQueueEntry{TimeWarpEvent(), 0, 0xFFFF}; // Default entry
            break;
        case 4: // ROLLBACK
            success = g_event_queue.rollback(lp_id, time);
            result_entry = EventQueueEntry{TimeWarpEvent(), 0, 0xFFFF}; // Default entry
            break;
        default:
            success = false;
            result_entry = EventQueueEntry{TimeWarpEvent(), 0, 0xFFFF}; // Default entry
    }
}

int test_event_queue() {
    ap_uint<3> op;
    TimeWarpEvent event;
    EventQueueEntry result_entry;
    ap_int<16> lp_id;
    ap_int<32> time;
    bool success;

    const int NUM_TEST_EVENTS = 16;
    std::vector<TimeWarpEvent> original_events;

    // Helper function to generate a random event
    auto generate_event = [](int i) -> TimeWarpEvent {
        return TimeWarpEvent{
            static_cast<ap_int<32>>(i),                    // send_time
            static_cast<ap_int<32>>(rand() % 10000),       // recv_time
            static_cast<ap_int<32>>(i),                    // data
            static_cast<ap_int<16>>(rand() % 4),           // sender_id
            static_cast<ap_int<16>>(rand() % 4),           // receiver_id
            static_cast<ap_uint<1>>(0)                     // is_anti_message
        };
    };

    // Helper function to enqueue events
    auto enqueue_events = [&]() {
        int enqueued_count = 0;
        original_events.clear();
        for (int i = 0; i < NUM_TEST_EVENTS; ++i) {
            event = generate_event(i);
            original_events.push_back(event);
            op = 0; // ENQUEUE
            event_queue_kernel(op, event, lp_id, time, result_entry, success);
            if (!success) {
                std::cout << "Failed to enqueue event " << i << std::endl;
                return false;
            }
            // g_event_queue.print_event_queue();
            enqueued_count++;
        }
        std::cout << "Enqueued " << enqueued_count << " events." << std::endl;
        // Print all enqueued events
        std::cout << "Enqueued events:" << std::endl;
        for (size_t i = 0; i < original_events.size(); ++i) {
            const auto& entry = original_events[i];
            std::cout << "Event " << i << ": "
                      << "send_time=" << entry.send_time
                      << ", recv_time=" << entry.recv_time
                      << ", data=" << entry.data
                      << ", sender_id=" << entry.sender_id
                      << ", receiver_id=" << entry.receiver_id
                      << ", is_anti_message=" << entry.is_anti_message
                      << std::endl;
        }
        std::cout << std::endl; // Add an extra newline for better readability
        return true;
    };

    // Helper function to issue events
    auto issue_events = [&](int num_to_issue) {
        std::vector<TimeWarpEvent> issued_events;
        int issued_count = 0;
        for (int i = 0; i < num_to_issue; ++i) {
            op = 2; // ISSUE
            event_queue_kernel(op, event, lp_id, time, result_entry, success);
            if (success) {
                // g_event_queue.print_event_queue();
                issued_events.push_back(result_entry.event);
                issued_count++;
            } else {
                break;
            }
        }
        std::cout << "Issued " << issued_count << " events." << std::endl;
        // Print all issued entries
        std::cout << "Issued events:" << std::endl;
        for (size_t i = 0; i < issued_events.size(); ++i) {
            const auto& entry = issued_events[i];
            std::cout << "Event " << i << ": "
                      << "send_time=" << entry.send_time
                      << ", recv_time=" << entry.recv_time
                      << ", data=" << entry.data
                      << ", sender_id=" << entry.sender_id
                      << ", receiver_id=" << entry.receiver_id
                      << ", is_anti_message=" << entry.is_anti_message
                      << std::endl;
        }
        std::cout << std::endl; // Add an extra newline for better readability

        return issued_count;
    };

    // Helper function to dequeue and check events
    auto dequeue_and_check = [&]() {
        std::vector<EventQueueEntry> dequeued_entries;
        while (true) {
            op = 1; // DEQUEUE
            event_queue_kernel(op, event, lp_id, time, result_entry, success);
            if (!success) break;
            dequeued_entries.push_back(result_entry);
        }
        std::cout << "Dequeued " << dequeued_entries.size() << " events." << std::endl;
        
        // Print all dequeued entries
        // print_debug_info(debug_info, "dequeue");
        std::cout << "Dequeued entries:" << std::endl;
        for (size_t i = 0; i < dequeued_entries.size(); ++i) {
            const auto& entry = dequeued_entries[i];
            std::cout << "Entry " << i << ": "
                      << "send_time=" << entry.event.send_time
                      << ", recv_time=" << entry.event.recv_time
                      << ", data=" << entry.event.data
                      << ", sender_id=" << entry.event.sender_id
                      << ", receiver_id=" << entry.event.receiver_id
                      << ", is_anti_message=" << entry.event.is_anti_message
                      << ", is_issued=" << entry.is_issued
                      << ", next=" << entry.next
                      << std::endl;
        }
        std::cout << std::endl; // Add an extra newline for better readability
        
        return dequeued_entries;
    };

    // Test 0: Enqueue, then dequeue all
    if (!enqueue_events()) return 1;
    // g_event_queue.print_event_queue();
    auto dequeued_entries = dequeue_and_check();
    if (dequeued_entries.size() != NUM_TEST_EVENTS) {
        std::cout << "Test 0-0 failed: Unexpected number of events after enqueue." << std::endl;
        return 1;
    }

    // Test 0 again: Enqueue, then dequeue all
    if (!enqueue_events()) return 1;
    dequeued_entries = dequeue_and_check();
    if (dequeued_entries.size() != NUM_TEST_EVENTS) {
        std::cout << "Test 0-1 failed: Unexpected number of events after enqueue." << std::endl;
        return 1;
    }

    // Test 1: Enqueue, issue all, then dequeue all
    if (!enqueue_events()) return 1;
    // g_event_queue.print_event_queue();
    issue_events(NUM_TEST_EVENTS);
    // g_event_queue.print_event_queue();
    dequeued_entries = dequeue_and_check();
    if (dequeued_entries.size() != NUM_TEST_EVENTS) {
        std::cout << "Test 1 failed: Unexpected number of events after issue all." << std::endl;
        return 1;
    }

    // Test 2: Enqueue, issue all, rollback, then dequeue all
    if (!enqueue_events()) return 1;
    int issued_count = issue_events(NUM_TEST_EVENTS);
    
    // Rollback
    op = 4; // ROLLBACK
    lp_id = 0; // Rollback LP 0
    time = 5000; // Rollback to time 5000
    event_queue_kernel(op, event, lp_id, time, result_entry, success);
    std::cout << "Rollback of LP " << lp_id << " to time " << time << (success ? " successful" : "failed") << std::endl;

    dequeued_entries = dequeue_and_check();
    if (dequeued_entries.size() != NUM_TEST_EVENTS) {
        std::cout << "Test 2 failed: Unexpected number of events after rollback." << std::endl;
        return 1;
    }

    // Test 3: Enqueue, issue some, commit, then dequeue all
    if (!enqueue_events()) return 1;
    issued_count = issue_events(NUM_TEST_EVENTS / 2);
    
    // Commit
    op = 3; // COMMIT
    time = 5000; // Commit events up to time 5000
    event_queue_kernel(op, event, lp_id, time, result_entry, success);
    std::cout << "Commit to time " << time << (success ? " successful" : "failed") << std::endl;

    dequeued_entries = dequeue_and_check();
    std::cout << "Events remaining after commit: " << dequeued_entries.size() << std::endl;

    // Check if the remaining events are correct (i.e., those with recv_time > 5000)
    for (const auto& entry : dequeued_entries) {
        if (entry.event.recv_time <= 5000) {
            std::cout << "Test 3 failed: Found event with recv_time <= 5000 after commit." << std::endl;
            return 1;
        }
    }

    std::cout << "All tests passed successfully!" << std::endl;
    return 0;
}

