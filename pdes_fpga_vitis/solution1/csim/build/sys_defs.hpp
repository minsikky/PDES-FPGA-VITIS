#ifndef SYS_DEFS_HPP
#define SYS_DEFS_HPP

#include <ap_int.h>

// Event
struct TimeWarpEvent
{
    ap_int<32> send_time;
    ap_int<32> recv_time;
    ap_int<32> data;
    ap_int<16> sender_id;
    ap_int<16> receiver_id;
    ap_uint<1> is_anti_message;

    TimeWarpEvent();
    TimeWarpEvent(ap_int<32> st, ap_int<32> rt, ap_int<32> d, ap_int<16> sid, ap_int<16> rid, ap_uint<1> iam);

    bool operator<(const TimeWarpEvent &other) const;
    bool operator==(const TimeWarpEvent &other) const;
    bool operator!=(const TimeWarpEvent &other) const;
    bool is_matching_anti_message(const TimeWarpEvent &other) const;
};

struct EventQueueEntry
{
    TimeWarpEvent event;
    ap_uint<1> is_issued;
    ap_uint<16> next;
};

// Rollback
struct RollbackInfo
{
    ap_int<16> lp_id;
    ap_int<32> to_time;
};

// State Buffer
struct LPState
{
    ap_int<16> lp_id;
    ap_int<32> lvt;
    ap_uint<32> rng_state;
};

struct StateEntry
{
    LPState state;
    ap_uint<16> next;
};

// Event Processor
struct EventProcessorInput {
    TimeWarpEvent event;
    LPState state;
};

#endif // SYS_DEFS_HPP