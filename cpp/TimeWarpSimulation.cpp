#include "TimeWarpSimulation.hpp"

void simulation_top(
    hls::stream<TimeWarpEvent> lpcore_init_event_stream[NUM_LPCORE]
)
{
    hls::stream<bool> lpcore_event_queue_full_stream[NUM_LPCORE];
    hls::stream<TimeWarpEvent> lpcore_anti_message_stream[NUM_LPCORE];
    hls::stream<TimeWarpEvent> lpcore_enqueue_event_stream[NUM_LPCORE];
    hls::stream<LVT> lpcore_lvt_stream[NUM_LPCORE];
    hls::stream<ap_int<32>> gvt_stream;
    hls::stream<TimeWarpEvent> lpcore_output_event_stream[NUM_LPCORE];
    hls::stream<TimeWarpEvent> lpcore_cancellation_unit_output_stream[NUM_LPCORE];
    hls::stream<ap_int<32>> lpcore_commit_time_stream[NUM_LPCORE];

    // Create GlobalControl tasks
    hls_thread_local hls::task event_router_task(event_router_top, lpcore_output_event_stream, lpcore_cancellation_unit_output_stream, lpcore_enqueue_event_stream, lpcore_anti_message_stream);
    hls_thread_local hls::task gvt_tracker_task(gvt_tracker_top, lpcore_lvt_stream, gvt_stream);
    hls_thread_local hls::task commit_control_task(commit_control_top, gvt_stream, lpcore_event_queue_full_stream, lpcore_commit_time_stream);

    // Create LPCore tasks
    BOOST_PP_REPEAT(NUM_LPCORE, CREATE_TASK, ~)
}