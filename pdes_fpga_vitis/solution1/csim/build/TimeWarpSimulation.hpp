#ifndef TIME_WARP_SIMULATION_HPP
#define TIME_WARP_SIMULATION_HPP

#include <array>
#include <ap_int.h>
#include <utility>
#include "constants.hpp"
#include "LPCore.hpp"
#include <boost/preprocessor/repetition/repeat.hpp>
#include <boost/preprocessor/arithmetic/inc.hpp>
#include <boost/preprocessor/punctuation/comma_if.hpp>

// Macro to declare streams for a single task
#define DECLARE_STREAMS(z, n, unused) \
    hls::stream<TimeWarpEvent> lpcore_init_event_stream##n; \
    hls::stream<bool> lpcore_event_queue_full_stream##n; \
    hls::stream<TimeWarpEvent> lpcore_anti_message_stream##n; \
    hls::stream<TimeWarpEvent> lpcore_enqueue_event_stream##n; \
    hls::stream<TimeWarpEvent> lpcore_output_event_stream##n; \
    hls::stream<TimeWarpEvent> lpcore_cancellation_unit_output_stream##n; \
    hls::stream<ap_int<32>> lpcore_commit_time_stream##n;

// Macro to create a single task
#define CREATE_TASK(z, n, unused) \
    hls::task t_##n(lpcore_kernel<n>, \
        lpcore_init_event_stream##n, \
        lpcore_event_queue_full_stream##n, \
        lpcore_anti_message_stream##n, \
        lpcore_enqueue_event_stream##n, \
        lpcore_output_event_stream##n, \
        lpcore_cancellation_unit_output_stream##n, \
        lpcore_commit_time_stream##n);

void simulation_top();

#endif // TIME_WARP_SIMULATION_HPP