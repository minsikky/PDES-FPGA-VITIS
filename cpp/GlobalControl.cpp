#include "GlobalControl.hpp"
#include "LPMapping.hpp"

// Event Router
void event_router_top(
    hls::stream<TimeWarpEvent> lpcore_output_event_stream[NUM_LPCORE],
    hls::stream<TimeWarpEvent> lpcore_cancellation_unit_output_stream[NUM_LPCORE],
    hls::stream<TimeWarpEvent> lpcore_enqueue_event_stream[NUM_LPCORE],
    hls::stream<TimeWarpEvent> lpcore_anti_message_stream[NUM_LPCORE])
{
    // Route events to the correct LP
    for (int i = 0; i < NUM_LPCORE; i++)
    {
#pragma HLS UNROLL
        if (!lpcore_output_event_stream[i].empty())
        {
            TimeWarpEvent event = lpcore_output_event_stream[i].read();
            int lpcore_idx = LPMapping::get_core_id(event.receiver_id);
            lpcore_enqueue_event_stream[lpcore_idx].write(event);
        }
        if (!lpcore_cancellation_unit_output_stream[i].empty())
        {
            TimeWarpEvent event = lpcore_cancellation_unit_output_stream[i].read();
            int lpcore_idx = LPMapping::get_core_id(event.receiver_id);
            lpcore_anti_message_stream[lpcore_idx].write(event);
        }
    }
}

// GVT Tracker
ap_int<32> update_min(ap_int<32> lvt_arr[NUM_LPS])
{
    ap_int<32> min_val = lvt_arr[0];
    for (int i = 1; i < NUM_LPS; i++)
    {
        if (lvt_arr[i] < min_val)
        {
            min_val = lvt_arr[i];
        }
    }
    return min_val;
}

void gvt_tracker_top(
    hls::stream<LVT> lpcore_lvt_stream[NUM_LPCORE],
    hls::stream<ap_int<32>> &gvt_stream)
{
    static ap_int<32> lvt_arr[NUM_LPS] = {0};
    // #pragma HLS array_partition variable = lvt_arr cyclic factor = NUM_LPCORE
    static ap_int<32> gvt = 0;

    // Update LVTs
    for (int i = 0; i < NUM_LPCORE; i++)
    {
#pragma HLS UNROLL
        if (!lpcore_lvt_stream[i].empty())
        {
            LVT lvt = lpcore_lvt_stream[i].read();
            lvt_arr[lvt.lp_id] = lvt.lvt;
            ap_int<32> tmp = update_min(lvt_arr);
            if (tmp > gvt)
            {
                gvt = tmp;
                gvt_stream.write(gvt);
            }
        }
    }
}

// Commit Control
void commit_control_top(
    hls::stream<ap_int<32>> &gvt_stream,
    hls::stream<bool> lpcore_event_queue_full_stream[NUM_LPCORE],
    hls::stream<ap_int<32>> lpcore_commit_time_stream[NUM_LPCORE])
{
    // Update GVT
    static int gvt = 0;
    if (!gvt_stream.empty())
    {
        gvt = gvt_stream.read();
    }

    // Send commit signal to stalled LPCores
    for (int i = 0; i < NUM_LPCORE; i++)
    {
#pragma HLS UNROLL
        if (!lpcore_event_queue_full_stream[i].empty())
        {
            bool event_queue_full = lpcore_event_queue_full_stream[i].read();
            if (event_queue_full)
            {
                lpcore_commit_time_stream[i].write(gvt);
            }
        }
    }
}

void global_control_top(
    hls::stream<TimeWarpEvent> lpcore_output_event_stream[NUM_LPCORE],
    hls::stream<TimeWarpEvent> lpcore_cancellation_unit_output_stream[NUM_LPCORE],
    hls::stream<TimeWarpEvent> lpcore_enqueue_event_stream[NUM_LPCORE],
    hls::stream<TimeWarpEvent> lpcore_anti_message_stream[NUM_LPCORE],
    hls::stream<LVT> lpcore_lvt_stream[NUM_LPCORE],
    hls::stream<bool> lpcore_event_queue_full_stream[NUM_LPCORE],
    hls::stream<ap_int<32>> lpcore_commit_time_stream[NUM_LPCORE])
{
    hls::stream<ap_int<32>> gvt_stream;
    hls::task event_router_task(event_router_top, lpcore_output_event_stream, lpcore_cancellation_unit_output_stream, lpcore_enqueue_event_stream, lpcore_anti_message_stream);
    hls::task gvt_tracker_task(gvt_tracker_top, lpcore_lvt_stream, gvt_stream);
    hls::task commit_control_task(commit_control_top, gvt_stream, lpcore_event_queue_full_stream, lpcore_commit_time_stream);
}