#include "EventQueue.hpp"
#include <iostream>
#include <random>
#include <algorithm>

TimeWarpEvent::TimeWarpEvent() : send_time(0), recv_time(INT32_MAX), data(0), sender_id(0), receiver_id(0), is_anti_message(0) {}

TimeWarpEvent::TimeWarpEvent(ap_int<32> st, ap_int<32> rt, ap_int<32> d, ap_int<16> sid, ap_int<16> rid, ap_uint<1> iam)
    : send_time(st), recv_time(rt), data(d), sender_id(sid), receiver_id(rid), is_anti_message(iam) {}

bool TimeWarpEvent::operator<(const TimeWarpEvent &other) const
{
    if (recv_time != other.recv_time)
        return recv_time < other.recv_time;
    if (send_time != other.send_time)
        return send_time < other.send_time;
    if (sender_id != other.sender_id)
        return sender_id < other.sender_id;
    if (receiver_id != other.receiver_id)
        return receiver_id < other.receiver_id;
    if (data != other.data)
        return data < other.data;
    return !is_anti_message && other.is_anti_message;
}

bool TimeWarpEvent::operator==(const TimeWarpEvent &other) const
{
    return (send_time == other.send_time &&
            recv_time == other.recv_time &&
            data == other.data &&
            sender_id == other.sender_id &&
            receiver_id == other.receiver_id &&
            is_anti_message == other.is_anti_message);
}

bool TimeWarpEvent::operator!=(const TimeWarpEvent &other) const
{
    return !(*this == other);
}

bool TimeWarpEvent::is_matching_anti_message(const TimeWarpEvent &other) const
{
    return (send_time == other.recv_time &&
            recv_time == other.send_time &&
            data == other.data &&
            sender_id == other.receiver_id &&
            receiver_id == other.sender_id &&
            is_anti_message != other.is_anti_message);
}

EventQueue::EventQueue() : size(0), unissued_size(0), current_gvt(0), free_head(0)
{
    for (ap_uint<16> i = 0; i < NUM_LPS; ++i)
    {
        lp_heads[i] = 0xFFFF;
        lp_tails[i] = 0xFFFF;
        lp_oldest_unissued[i] = 0xFFFF;
        lp_youngest_issued[i] = 0xFFFF;
    }
    reset();
}

void EventQueue::reset()
{
    size = 0;
    unissued_size = 0;
    current_gvt = 0;
    free_head = 0;

    for (ap_uint<16> i = 0; i < EVENT_QUEUE_CAPACITY - 1; ++i)
    {
        buffer[i].next = i + 1;
    }
    buffer[EVENT_QUEUE_CAPACITY - 1].next = 0xFFFF;

    for (ap_uint<16> i = 0; i < NUM_LPS; ++i)
    {
        lp_heads[i] = 0xFFFF;
        lp_tails[i] = 0xFFFF;
        lp_oldest_unissued[i] = 0xFFFF;
        lp_youngest_issued[i] = 0xFFFF;
        lvt[i] = 0;
    }
}

bool EventQueue::enqueue(const TimeWarpEvent &event, hls::stream<RollbackInfo> &causality_violation_stream)
{
    if (size >= EVENT_QUEUE_CAPACITY)
        return false;

    ap_uint<16> lp_id = event.receiver_id;

    if (event.recv_time < lvt[lp_id]) {
        causality_violation_stream.write(RollbackInfo{lp_id, event.recv_time});
    }

    ap_uint<16> new_entry = free_head;
    free_head = buffer[free_head].next;

    buffer[new_entry].event = event;
    buffer[new_entry].is_issued = 0;
    buffer[new_entry].next = 0xFFFF;

    // ap_uint<16> lp_id = event.receiver_id;

    if (lp_oldest_unissued[lp_id] == 0xFFFF ||
        buffer[new_entry].event.recv_time < buffer[lp_oldest_unissued[lp_id]].event.recv_time)
    {
        lp_oldest_unissued[lp_id] = new_entry;
    }

    if (lp_heads[lp_id] == 0xFFFF)
    {
        lp_heads[lp_id] = new_entry;
        lp_tails[lp_id] = new_entry;
    }
    else
    {
        ap_uint<16> current = lp_heads[lp_id];
        ap_uint<16> prev = 0xFFFF;

        while (current != 0xFFFF && buffer[current].event.recv_time <= event.recv_time)
        {
#pragma HLS PIPELINE off
            prev = current;
            current = buffer[current].next;
        }

        if (prev == 0xFFFF)
        {
            buffer[new_entry].next = lp_heads[lp_id];
            lp_heads[lp_id] = new_entry;
        }
        else
        {
            buffer[new_entry].next = buffer[prev].next;
            buffer[prev].next = new_entry;

            if (prev == lp_tails[lp_id])
            {
                lp_tails[lp_id] = new_entry;
            }
        }
    }

    unissued_size++;
    size++;

    return true;
}

EventQueueEntry EventQueue::dequeue()
{
    if (size == 0)
        return EventQueueEntry{TimeWarpEvent(), 0, 0xFFFF};

    ap_uint<16> earliest_lp = 0;
    ap_int<32> earliest_time = INT32_MAX;

    for (ap_uint<16> i = 0; i < NUM_LPS; ++i)
    {
        if (lp_heads[i] != 0xFFFF && buffer[lp_heads[i]].event.recv_time < earliest_time)
        {
            earliest_lp = i;
            earliest_time = buffer[lp_heads[i]].event.recv_time;
        }
    }

    ap_uint<16> dequeue_entry = lp_heads[earliest_lp];
    EventQueueEntry result = buffer[dequeue_entry];

    lp_heads[earliest_lp] = buffer[dequeue_entry].next;
    if (lp_heads[earliest_lp] == 0xFFFF)
    {
        lp_tails[earliest_lp] = 0xFFFF;
    }

    if (!buffer[dequeue_entry].is_issued)
    {
        lp_oldest_unissued[earliest_lp] = buffer[dequeue_entry].next;
        unissued_size--;
    }

    if (dequeue_entry == lp_youngest_issued[earliest_lp])
    {
        lp_youngest_issued[earliest_lp] = 0xFFFF;
    }

    buffer[dequeue_entry].next = free_head;
    free_head = dequeue_entry;

    size--;

    return result;
}

bool EventQueue::issue(TimeWarpEvent &event)
{
    if (unissued_size == 0)
        return false;

    ap_uint<16> earliest_lp = 0;
    ap_int<32> earliest_time = INT32_MAX;

    for (ap_uint<16> i = 0; i < NUM_LPS; ++i)
    {
        if (lp_oldest_unissued[i] != 0xFFFF)
        {
            if (buffer[lp_oldest_unissued[i]].event.recv_time < earliest_time)
            {
                earliest_lp = i;
                earliest_time = buffer[lp_oldest_unissued[i]].event.recv_time;
            }
        }
    }

    ap_uint<16> issue_entry = lp_oldest_unissued[earliest_lp];
    event = buffer[issue_entry].event;
    buffer[issue_entry].is_issued = 1;

    lp_oldest_unissued[earliest_lp] = buffer[issue_entry].next;
    lp_youngest_issued[earliest_lp] = issue_entry;
    lvt[earliest_lp] = buffer[issue_entry].event.recv_time;

    unissued_size--;

    return true;
}

bool EventQueue::commit(ap_int<32> commit_time)
{
    current_gvt = commit_time;

    for (ap_uint<16> lp_id = 0; lp_id < NUM_LPS; ++lp_id)
    {
#pragma HLS UNROLL
        while (lp_heads[lp_id] != 0xFFFF &&
               buffer[lp_heads[lp_id]].event.recv_time <= commit_time)
        {
            ap_uint<16> commit_entry = lp_heads[lp_id];
            lp_heads[lp_id] = buffer[commit_entry].next;

            buffer[commit_entry].next = free_head;
            free_head = commit_entry;

            if (commit_entry == lp_youngest_issued[lp_id])
            {
                lp_youngest_issued[lp_id] = 0xFFFF;
            }

            if (lp_heads[lp_id] == 0xFFFF)
            {
                lp_tails[lp_id] = 0xFFFF;
            }

            size--;
        }
    }

    return true;
}

bool EventQueue::rollback(RollbackInfo &rollback_info)
{
    ap_uint<16> lp_id = rollback_info.lp_id;
    ap_int<32> to_time = rollback_info.to_time;
    ap_uint<16> current = lp_heads[lp_id];

    lvt[lp_id] = to_time;

    while (current != 0xFFFF)
    {
#pragma HLS DEPENDENCE variable = buffer inter false
        if (buffer[current].event.recv_time > to_time && buffer[current].is_issued)
        {
            buffer[current].is_issued = 0;
            unissued_size++;
            if (lp_oldest_unissued[lp_id] == 0xFFFF || buffer[lp_oldest_unissued[lp_id]].event.recv_time > buffer[current].event.recv_time)
            {
                lp_oldest_unissued[lp_id] = current;
            }
        }
        current = buffer[current].next;
    }

    return true;
}

bool EventQueue::process_anti_message(const TimeWarpEvent &anti_msg)
{
    ap_uint<16> lp_id = anti_msg.receiver_id;
    ap_uint<16> current = lp_oldest_unissued[lp_id];
    ap_uint<16> prev = lp_youngest_issued[lp_id];
    while (current != 0xFFFF)
    {
#pragma HLS PIPELINE off
        if (buffer[current].event.is_matching_anti_message(anti_msg))
        {
            if (prev != 0xFFFF)
            {
                buffer[prev].next = buffer[current].next;
            }
            else
            {
                lp_heads[lp_id] = buffer[current].next;
            }
            if (current == lp_tails[lp_id])
            {
                lp_tails[lp_id] = prev;
            }
            buffer[current].next = free_head;
            free_head = current;
            if (lp_oldest_unissued[lp_id] == current)
            {
                lp_oldest_unissued[lp_id] = buffer[current].next;
            }
            unissued_size--;
            size--;
            return true;
        }
        current = buffer[current].next;
    }
    return false;
}

bool EventQueue::is_full()
{
    return (size == EVENT_QUEUE_CAPACITY);
}

ap_uint<16> EventQueue::get_size() const
{
    return size;
}

ap_int<32> EventQueue::get_gvt() const
{
    return current_gvt;
}

void EventQueue::print_event_queue() const
{
    std::cout << "Event Queue State:" << std::endl;
    std::cout << "Total size: " << size << std::endl;
    std::cout << "Current GVT: " << current_gvt << std::endl;

    for (ap_uint<16> lp = 0; lp < NUM_LPS; ++lp)
    {
        std::cout << "\nLP " << lp << " (Head: " << lp_heads[lp]
                  << ", Tail: " << lp_tails[lp]
                  << ", Oldest Unissued: " << lp_oldest_unissued[lp] << "):" << std::endl;

        if (lp_heads[lp] == 0xFFFF)
        {
            std::cout << "  Empty" << std::endl;
            continue;
        }

        ap_uint<16> current = lp_heads[lp];
        ap_uint<16> count = 0;
        while (current != 0xFFFF)
        {
            const EventQueueEntry &entry = buffer[current];
            std::cout << "  [" << count << "] Index: " << current << "; ";
            std::cout << "      Event: "
                      << "recv_time=" << entry.event.recv_time << ", "
                      << "receiver_id=" << entry.event.receiver_id << "; ";
            std::cout << "      is_issued: " << entry.is_issued << "; ";
            std::cout << "      next: " << entry.next << std::endl;

            current = entry.next;
            count++;
        }
    }

    std::cout << "\nFree list head: " << free_head << std::endl
              << std::endl;
}

// Global EventQueue instance
static EventQueue g_event_queue;

void event_queue_kernel(
    ap_uint<3> op,
    TimeWarpEvent event,
    ap_int<16> lp_id,
    ap_int<32> time,
    EventQueueEntry &result_entry,
    bool &success)
{
#pragma HLS INTERFACE ap_ctrl_chain port = return
#pragma HLS INTERFACE ap_vld port = op
#pragma HLS INTERFACE ap_vld port = event
#pragma HLS INTERFACE ap_vld port = lp_id
#pragma HLS INTERFACE ap_vld port = time
#pragma HLS INTERFACE ap_vld port = result_entry
#pragma HLS INTERFACE ap_vld port = success

    hls::stream<RollbackInfo> causality_violation_stream;
    switch (op)
    {
    case 0: // ENQUEUE
        success = g_event_queue.enqueue(event, causality_violation_stream);
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
    {
        RollbackInfo rollback_info = {lp_id, time};
        success = g_event_queue.rollback(rollback_info);
        result_entry = EventQueueEntry{TimeWarpEvent(), 0, 0xFFFF}; // Default entry
    }
    break;
    default:
        success = false;
        result_entry = EventQueueEntry{TimeWarpEvent(), 0, 0xFFFF}; // Default entry
    }
}

void event_queue_top_test()
{
    hls::stream<TimeWarpEvent> init_event_stream[2];
    hls::stream<bool> event_queue_full_stream[2];
    hls::stream<RollbackInfo> rollback_info_stream[2];
    hls::stream<TimeWarpEvent> anti_message_stream[2];
    hls::stream<TimeWarpEvent> enqueue_event_stream[2];
    hls::stream<ap_int<32>> commit_time_stream[2];
    hls::stream<TimeWarpEvent> issued_event_stream[2];
    hls::stream<RollbackInfo> causality_violation_stream[2];

    hls::task event_queue_task_0(event_queue_top<0>, 
        init_event_stream[0],
        event_queue_full_stream[0],
        rollback_info_stream[0],
        anti_message_stream[0],
        enqueue_event_stream[0],
        commit_time_stream[0],
        issued_event_stream[0],
        causality_violation_stream[0]);
    
    // hls::task event_queue_task_1(event_queue_top, 
    //     init_event_stream[1],
    //     event_queue_full_stream[1],
    //     rollback_info_stream[1],
    //     anti_message_stream[1],
    //     enqueue_event_stream[1],
    //     commit_time_stream[1],
    //     issued_event_stream[1],
    //     causality_violation_stream[1]);

    // Test the event queue
    const int NUM_TEST_EVENTS = 16;
    std::vector<TimeWarpEvent> original_events;

    // Helper function to generate a random event
    auto generate_event = [](int i) -> TimeWarpEvent
    {
        return TimeWarpEvent{
            static_cast<ap_int<32>>(i),              // send_time
            static_cast<ap_int<32>>(rand() % 10000), // recv_time
            static_cast<ap_int<32>>(i),              // data
            static_cast<ap_int<16>>(rand() % 4),     // sender_id
            static_cast<ap_int<16>>(rand() % 4),     // receiver_id
            static_cast<ap_uint<1>>(0)               // is_anti_message
        };
    };

    // Helper function to enqueue events
    auto enqueue_events = [&](int idx)
    {
        int enqueued_count = 0;
        original_events.clear();
        for (int i = 0; i < NUM_TEST_EVENTS; ++i)
        {
            TimeWarpEvent event;
            event = generate_event(i+(idx+1)*NUM_TEST_EVENTS);
            original_events.push_back(event);
            enqueue_event_stream[idx].write(event);
            // g_event_queue.print_event_queue();
            enqueued_count++;
        }
        std::cout << "Enqueued " << enqueued_count << " events." << std::endl;
        // Print all enqueued events
        std::cout << "Enqueued events:" << std::endl;
        for (size_t i = 0; i < original_events.size(); ++i)
        {
            const auto &entry = original_events[i];
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
    auto issue_events = [&](int idx, int num_to_issue)
    {
        std::vector<TimeWarpEvent> issued_events;
        int issued_count = 0;
        for (int i = 0; i < num_to_issue; ++i)
        {
            issued_events.push_back(issued_event_stream[idx].read());
            issued_count++;
        }
        std::cout << "Issued " << issued_count << " events." << std::endl;
        // Print all issued entries
        std::cout << "Issued events:" << std::endl;
        for (size_t i = 0; i < issued_events.size(); ++i)
        {
            const auto &entry = issued_events[i];
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

    enqueue_events(0);
    issue_events(0, NUM_TEST_EVENTS);

    enqueue_events(1);
    issue_events(1, NUM_TEST_EVENTS);
}

int test_event_queue()
{
    ap_uint<3> op;
    TimeWarpEvent event;
    EventQueueEntry result_entry;
    ap_int<16> lp_id;
    ap_int<32> time;
    bool success;

    const int NUM_TEST_EVENTS = 16;
    std::vector<TimeWarpEvent> original_events;

    // Helper function to generate a random event
    auto generate_event = [](int i) -> TimeWarpEvent
    {
        return TimeWarpEvent{
            static_cast<ap_int<32>>(i),              // send_time
            static_cast<ap_int<32>>(rand() % 10000), // recv_time
            static_cast<ap_int<32>>(i),              // data
            static_cast<ap_int<16>>(rand() % 4),     // sender_id
            static_cast<ap_int<16>>(rand() % 4),     // receiver_id
            static_cast<ap_uint<1>>(0)               // is_anti_message
        };
    };

    // Helper function to enqueue events
    auto enqueue_events = [&]()
    {
        int enqueued_count = 0;
        original_events.clear();
        for (int i = 0; i < NUM_TEST_EVENTS; ++i)
        {
            event = generate_event(i);
            original_events.push_back(event);
            op = 0; // ENQUEUE
            event_queue_kernel(op, event, lp_id, time, result_entry, success);
            if (!success)
            {
                std::cout << "Failed to enqueue event " << i << std::endl;
                return false;
            }
            // g_event_queue.print_event_queue();
            enqueued_count++;
        }
        std::cout << "Enqueued " << enqueued_count << " events." << std::endl;
        // Print all enqueued events
        std::cout << "Enqueued events:" << std::endl;
        for (size_t i = 0; i < original_events.size(); ++i)
        {
            const auto &entry = original_events[i];
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
    auto issue_events = [&](int num_to_issue)
    {
        std::vector<TimeWarpEvent> issued_events;
        int issued_count = 0;
        for (int i = 0; i < num_to_issue; ++i)
        {
            op = 2; // ISSUE
            event_queue_kernel(op, event, lp_id, time, result_entry, success);
            if (success)
            {
                // g_event_queue.print_event_queue();
                issued_events.push_back(result_entry.event);
                issued_count++;
            }
            else
            {
                break;
            }
        }
        std::cout << "Issued " << issued_count << " events." << std::endl;
        // Print all issued entries
        std::cout << "Issued events:" << std::endl;
        for (size_t i = 0; i < issued_events.size(); ++i)
        {
            const auto &entry = issued_events[i];
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
    auto dequeue_and_check = [&]()
    {
        std::vector<EventQueueEntry> dequeued_entries;
        while (true)
        {
            op = 1; // DEQUEUE
            event_queue_kernel(op, event, lp_id, time, result_entry, success);
            if (!success)
                break;
            dequeued_entries.push_back(result_entry);
        }
        std::cout << "Dequeued " << dequeued_entries.size() << " events." << std::endl;

        // Print all dequeued entries
        // print_debug_info(debug_info, "dequeue");
        std::cout << "Dequeued entries:" << std::endl;
        for (size_t i = 0; i < dequeued_entries.size(); ++i)
        {
            const auto &entry = dequeued_entries[i];
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
    if (!enqueue_events())
        return 1;
    // g_event_queue.print_event_queue();
    auto dequeued_entries = dequeue_and_check();
    if (dequeued_entries.size() != NUM_TEST_EVENTS)
    {
        std::cout << "Test 0-0 failed: Unexpected number of events after enqueue." << std::endl;
        return 1;
    }

    // Test 0 again: Enqueue, then dequeue all
    if (!enqueue_events())
        return 1;
    dequeued_entries = dequeue_and_check();
    if (dequeued_entries.size() != NUM_TEST_EVENTS)
    {
        std::cout << "Test 0-1 failed: Unexpected number of events after enqueue." << std::endl;
        return 1;
    }

    // Test 1: Enqueue, issue all, then dequeue all
    if (!enqueue_events())
        return 1;
    // g_event_queue.print_event_queue();
    issue_events(NUM_TEST_EVENTS);
    // g_event_queue.print_event_queue();
    dequeued_entries = dequeue_and_check();
    if (dequeued_entries.size() != NUM_TEST_EVENTS)
    {
        std::cout << "Test 1 failed: Unexpected number of events after issue all." << std::endl;
        return 1;
    }

    // Test 2: Enqueue, issue all, rollback, then dequeue all
    if (!enqueue_events())
        return 1;
    int issued_count = issue_events(NUM_TEST_EVENTS);

    // Rollback
    op = 4;      // ROLLBACK
    lp_id = 0;   // Rollback LP 0
    time = 5000; // Rollback to time 5000
    event_queue_kernel(op, event, lp_id, time, result_entry, success);
    std::cout << "Rollback of LP " << lp_id << " to time " << time << (success ? " successful" : "failed") << std::endl;

    dequeued_entries = dequeue_and_check();
    if (dequeued_entries.size() != NUM_TEST_EVENTS)
    {
        std::cout << "Test 2 failed: Unexpected number of events after rollback." << std::endl;
        return 1;
    }

    // Test 3: Enqueue, issue some, commit, then dequeue all
    if (!enqueue_events())
        return 1;
    issued_count = issue_events(NUM_TEST_EVENTS / 2);

    // Commit
    op = 3;      // COMMIT
    time = 5000; // Commit events up to time 5000
    event_queue_kernel(op, event, lp_id, time, result_entry, success);
    std::cout << "Commit to time " << time << (success ? " successful" : "failed") << std::endl;

    dequeued_entries = dequeue_and_check();
    std::cout << "Events remaining after commit: " << dequeued_entries.size() << std::endl;

    // Check if the remaining events are correct (i.e., those with recv_time > 5000)
    for (const auto &entry : dequeued_entries)
    {
        if (entry.event.recv_time <= 5000)
        {
            std::cout << "Test 3 failed: Found event with recv_time <= 5000 after commit." << std::endl;
            return 1;
        }
    }

    std::cout << "All tests passed successfully!" << std::endl;
    return 0;
}