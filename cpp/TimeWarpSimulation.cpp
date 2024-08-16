#include "TimeWarpSimulation.hpp"

void multi_lpcore_top(
    hls::stream<TimeWarpEvent> lpcore_init_event_stream[NUM_LPCORE],
    hls::stream<bool> lpcore_event_queue_full_stream[NUM_LPCORE],
    hls::stream<TimeWarpEvent> lpcore_anti_message_stream[NUM_LPCORE],
    hls::stream<TimeWarpEvent> lpcore_enqueue_event_stream[NUM_LPCORE],
    hls::stream<LVT> lpcore_lvt_stream[NUM_LPCORE],
    hls::stream<TimeWarpEvent> lpcore_output_event_stream[NUM_LPCORE],
    hls::stream<TimeWarpEvent> lpcore_cancellation_unit_output_stream[NUM_LPCORE],
    hls::stream<ap_int<32>> lpcore_commit_time_stream[NUM_LPCORE])
{
    BOOST_PP_REPEAT(NUM_LPCORE, CREATE_TASK, ~)
}

void simulation_top(
    hls::stream<TimeWarpEvent> lpcore_init_event_stream[NUM_LPCORE])
{
#pragma HLS INTERFACE mode = ap_ctrl_none port = return
#pragma HLS dataflow
    hls::stream<bool> lpcore_event_queue_full_stream[NUM_LPCORE];
    hls::stream<TimeWarpEvent> lpcore_anti_message_stream[NUM_LPCORE];
    hls::stream<TimeWarpEvent> lpcore_enqueue_event_stream[NUM_LPCORE];
    hls::stream<LVT> lpcore_lvt_stream[NUM_LPCORE];
    hls::stream<ap_int<32>> gvt_stream;
    hls::stream<TimeWarpEvent> lpcore_output_event_stream[NUM_LPCORE];
    hls::stream<TimeWarpEvent> lpcore_cancellation_unit_output_stream[NUM_LPCORE];
    hls::stream<ap_int<32>> lpcore_commit_time_stream[NUM_LPCORE];

    // Create GlobalControl tasks
    hls::task event_router_task(event_router_top, lpcore_output_event_stream, lpcore_cancellation_unit_output_stream, lpcore_enqueue_event_stream, lpcore_anti_message_stream);
    hls::task gvt_tracker_task(gvt_tracker_top, lpcore_lvt_stream, gvt_stream);
    hls::task commit_control_task(commit_control_top, gvt_stream, lpcore_event_queue_full_stream, lpcore_commit_time_stream);

    // Create LPCore tasks
    // BOOST_PP_REPEAT(NUM_LPCORE, CREATE_TASK, ~)
    hls::task t_0(lpcore_kernel<0>,
                  lpcore_init_event_stream[0],
                  lpcore_event_queue_full_stream[0],
                  lpcore_anti_message_stream[0],
                  lpcore_enqueue_event_stream[0],
                  lpcore_lvt_stream[0],
                  lpcore_output_event_stream[0],
                  lpcore_cancellation_unit_output_stream[0],
                  lpcore_commit_time_stream[0]);

    hls::task t_1(lpcore_kernel<1>,
                  lpcore_init_event_stream[1],
                  lpcore_event_queue_full_stream[1],
                  lpcore_anti_message_stream[1],
                  lpcore_enqueue_event_stream[1],
                  lpcore_lvt_stream[1],
                  lpcore_output_event_stream[1],
                  lpcore_cancellation_unit_output_stream[1],
                  lpcore_commit_time_stream[1]);
}