#ifndef EVENT_QUEUE_HPP
#define EVENT_QUEUE_HPP

#include <ap_int.h>
#include <hls_task.h>
#include "sys_defs.hpp"
#include "constants.hpp"

class EventQueue
{
public:
    EventQueueEntry buffer[EVENT_QUEUE_CAPACITY];
    ap_uint<16> lp_heads[NUM_LPS];
    ap_uint<16> lp_tails[NUM_LPS];
    ap_uint<16> lp_oldest_unissued[NUM_LPS];
    ap_uint<16> lp_youngest_issued[NUM_LPS];
    ap_int<32> lvt[NUM_LPS];
    ap_uint<16> free_head;
    ap_uint<16> unissued_size;
    ap_uint<16> size;
    ap_int<32> current_gvt;

    EventQueue();
    void reset();
    bool enqueue(const TimeWarpEvent &event, hls::stream<RollbackInfo> &causality_violation_stream);
    EventQueueEntry dequeue();
    bool issue(TimeWarpEvent &event);
    bool commit(ap_int<32> commit_time);
    bool rollback(RollbackInfo &rollback_info);
    bool process_anti_message(const TimeWarpEvent &anti_msg);
    bool is_full();
    ap_uint<16> get_size() const;
    ap_int<32> get_gvt() const;
    void print_event_queue() const;
};

void event_queue_kernel(ap_uint<3> op, TimeWarpEvent event, ap_int<16> lp_id, ap_int<32> time, EventQueueEntry &result_entry, bool &success);

// void event_queue_top(
//     EventQueue &event_queue,
//     hls::stream<bool> &event_queue_full_stream,
//     hls::stream<RollbackInfo> &rollback_info_stream,
//     hls::stream<TimeWarpEvent> &anti_message_stream,
//     hls::stream<TimeWarpEvent> &enqueue_event_stream,
//     hls::stream<ap_int<32>> &commit_time_stream,
//     hls::stream<TimeWarpEvent> &issued_event_stream,
//     hls::stream<RollbackInfo> &causality_violation_stream);

template<int ID>
void event_queue_top(
    hls::stream<TimeWarpEvent> &init_event_stream,
    hls::stream<bool> &event_queue_full_stream,
    hls::stream<RollbackInfo> &rollback_info_stream,
    hls::stream<TimeWarpEvent> &anti_message_stream,
    hls::stream<TimeWarpEvent> &enqueue_event_stream,
    hls::stream<ap_int<32>> &commit_time_stream,
    hls::stream<TimeWarpEvent> &issued_event_stream,
    hls::stream<RollbackInfo> &causality_violation_stream)
{
    static EventQueue event_queue;
    // Priority: init_event > rollback > anti_message > enqueue > issue > commit
    if (!init_event_stream.empty()) {
        TimeWarpEvent init_event = init_event_stream.read();
        event_queue.enqueue(init_event, causality_violation_stream);
        // Shouldn't be full after initialization
    }
    else if (!rollback_info_stream.empty()) // Rollback
    {
        RollbackInfo rollback_info = rollback_info_stream.read();
        event_queue.rollback(rollback_info);
    }
    else if (!anti_message_stream.empty()) // Anti-message
    {
        TimeWarpEvent anti_message = anti_message_stream.read();
        event_queue.process_anti_message(anti_message);
    }
    else if (!enqueue_event_stream.empty() && !event_queue.is_full()) // Enqueue
    {
        TimeWarpEvent event = enqueue_event_stream.read();
        event_queue.enqueue(event, causality_violation_stream);
        if (event_queue.is_full())
        {
            event_queue_full_stream.write(true);
        }
    }
    else if (!issued_event_stream.full()) // Issue
    {
        TimeWarpEvent issued_event;
        if (event_queue.issue(issued_event))
        {
            issued_event_stream.write(issued_event);
        }
    }
    else if (!commit_time_stream.empty()) // Can't enqueue or issue, so try to commit
    {
        ap_int<32> commit_time = commit_time_stream.read();
        event_queue.commit(commit_time);
        if (!event_queue.is_full())
        {
            event_queue_full_stream.write(false);
        }
    }
}

void event_queue_top_test(
    hls::stream<TimeWarpEvent> &init_event_stream,
    hls::stream<bool> &event_queue_full_stream,
    hls::stream<RollbackInfo> &rollback_info_stream,
    hls::stream<TimeWarpEvent> &anti_message_stream,
    hls::stream<TimeWarpEvent> &enqueue_event_stream,
    hls::stream<ap_int<32>> &commit_time_stream,
    hls::stream<TimeWarpEvent> &issued_event_stream,
    hls::stream<RollbackInfo> &causality_violation_stream);

int test_event_queue();

#endif // EVENT_QUEUE_HPP