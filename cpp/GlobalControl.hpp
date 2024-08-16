#ifndef GLOBAL_CONTROL_HPP
#define GLOBAL_CONTROL_HPP

#include <ap_int.h>
#include <hls_task.h>
#include "constants.hpp"
#include "sys_defs.hpp"

// Event Router
void event_router_top(
    hls::stream<TimeWarpEvent> lpcore_output_event_stream[NUM_LPCORE],
    hls::stream<TimeWarpEvent> lpcore_cancellation_unit_output_stream[NUM_LPCORE],
    hls::stream<TimeWarpEvent> lpcore_enqueue_event_stream[NUM_LPCORE],
    hls::stream<TimeWarpEvent> lpcore_anti_message_stream[NUM_LPCORE]);

// GVT Tracker
ap_int<32> update_min(ap_int<32> lvt_arr[NUM_LPS]);

void gvt_tracker_top(
    hls::stream<LVT> lpcore_lvt_stream[NUM_LPCORE],
    hls::stream<ap_int<32>> gvt_stream);

// Commit Control
void commit_control_top(
    hls::stream<ap_int<32>> gvt_stream,
    hls::stream<bool> lpcore_event_queue_full_stream[NUM_LPCORE],
    hls::stream<ap_int<32>> lpcore_commit_time_stream[NUM_LPCORE]);

#endif // GLOBAL_CONTROL_HPP