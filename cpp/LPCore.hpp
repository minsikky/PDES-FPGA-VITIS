#ifndef LPCORE_HPP
#define LPCORE_HPP

#include <hls_task.h>
#include <ap_int.h>
#include <array>
#include "sys_defs.hpp"
#include "VirtualLP.hpp"
#include "EventQueue.hpp"
#include "StateBuffer.hpp"
#include "CancellationUnit.hpp"
#include "EventProcessor.hpp"
#include "LPMapping.hpp"
#include "LPCoreControl.hpp"

// Forward declaration
// class TimeWarpSimulation;

class LPCore
{
public:
    // TimeWarpSimulation &simulation;
    ap_uint<8> lpcore_id;
    VirtualLP virtual_lps[NUM_LPS / NUM_LPCORE];
    // std::array<VirtualLP, (int)(NUM_LPS / NUM_LPCORE)> virtual_lps;
    EventQueue event_queue;
    StateBuffer state_buffer;
    CancellationUnit cancellation_unit;
    EventProcessor event_processor;
    // EventRouter event_router;
    int current_lp_index;
    int total_lps;
    // hls::stream<bool> fossil_signal;
    // hls::stream<bool> stall_signal;

    hls::stream<bool> event_queue_full_stream;
    hls::stream<TimeWarpEvent> anti_message_stream[NUM_LPCORE];
    hls::stream<TimeWarpEvent> enqueue_event_stream[NUM_LPCORE];
    // hls::stream<ap_int<32>> commit_time_stream;
    hls::stream<TimeWarpEvent> issued_event_stream;
    hls::stream<LPState> state_buffer_input_stream;
    hls::stream<EventProcessorInput> event_processor_input_stream;
    hls::stream<RollbackInfo> causality_violation_stream;
    hls::stream<TimeWarpEvent> output_event_stream;
    hls::stream<TimeWarpEvent> cancellation_unit_input_stream;
    hls::stream<TimeWarpEvent> cancellation_unit_output_stream;

    hls::stream<RollbackInfo> event_queue_rollback_info_stream;
    hls::stream<RollbackInfo> state_buffer_rollback_info_stream;
    hls::stream<RollbackInfo> cancellation_unit_rollback_info_stream;

public:
    // LPCore(TimeWarpSimulation &simulation, ap_uint<8> lpcore_id);
    // LPCore();
    LPCore(ap_uint<8> lpcore_id);
    // void init();
    bool recv_event(const TimeWarpEvent &event);
    void trigger_rollback(RollbackInfo &rollback_info);
    bool process_anti_message(const TimeWarpEvent &anti_msg);
    bool enqueue_event(const TimeWarpEvent &event);
    bool is_assigned_lp(ap_uint<16> lp_id) const;
};

template <int ID>
void lpcore_kernel(
    // INITIALIZATION
    hls::stream<TimeWarpEvent> &init_event_stream,
    // TO SIGNAL EVENT QUEUE FULL
    hls::stream<bool> &event_queue_full_stream,
    // INPUTS TO EVENT QUEUE
    hls::stream<TimeWarpEvent> &anti_message_stream,
    hls::stream<TimeWarpEvent> &enqueue_event_stream,
    // OUTPUT OF THE LPCORE
    hls::stream<LVT> &lvt_stream,
    hls::stream<TimeWarpEvent> &output_event_stream,
    hls::stream<TimeWarpEvent> &cancellation_unit_output_stream,
    // COMMIT SIGNAL FROM GLOBAL CONTROLLER
    hls::stream<ap_int<32>> &commit_time_stream)
{
    hls::stream<RollbackInfo> causality_violation_stream;
    hls::stream<TimeWarpEvent> issued_event_stream;
    hls::stream<LPState> state_buffer_input_stream;
    hls::stream<EventProcessorInput> event_processor_input_stream;
    hls::stream<TimeWarpEvent> cancellation_unit_input_stream;

    hls::stream<RollbackInfo> event_queue_rollback_info_stream;
    hls::stream<RollbackInfo> state_buffer_rollback_info_stream;
    hls::stream<RollbackInfo> cancellation_unit_rollback_info_stream;
    hls::stream<ap_int<32>> event_queue_commit_time_stream;
    hls::stream<ap_int<32>> state_buffer_commit_time_stream;
    hls::stream<ap_int<32>> cancellation_unit_commit_time_stream;

    hls::task lpcore_control_task(lpcore_control_top<ID>, causality_violation_stream, event_queue_rollback_info_stream, state_buffer_rollback_info_stream, cancellation_unit_rollback_info_stream, commit_time_stream, event_queue_commit_time_stream, state_buffer_commit_time_stream, cancellation_unit_commit_time_stream);
    hls::task event_queue_task(event_queue_top<ID>, init_event_stream, event_queue_full_stream, event_queue_rollback_info_stream, anti_message_stream, enqueue_event_stream, event_queue_commit_time_stream, issued_event_stream, causality_violation_stream);
    hls::task state_buffer_task(state_buffer_top<ID>, state_buffer_rollback_info_stream, state_buffer_commit_time_stream, state_buffer_input_stream, issued_event_stream, event_processor_input_stream);
    hls::task event_processor_task(event_processor_top<ID>, event_processor_input_stream, state_buffer_input_stream, lvt_stream, output_event_stream, cancellation_unit_input_stream);
    hls::task cancellation_unit_task(cancellation_unit_top<ID>, cancellation_unit_rollback_info_stream, cancellation_unit_commit_time_stream, cancellation_unit_input_stream, cancellation_unit_output_stream);
}

void lpcore_top(
    // INITIALIZATION
    hls::stream<TimeWarpEvent> &init_event_stream,
    // TO SIGNAL EVENT QUEUE FULL
    hls::stream<bool> &event_queue_full_stream,
    // INPUTS TO EVENT QUEUE
    hls::stream<TimeWarpEvent> &anti_message_stream,
    hls::stream<TimeWarpEvent> &enqueue_event_stream,
    // OUTPUT OF THE LPCORE
    hls::stream<LVT> &lvt_stream,
    hls::stream<TimeWarpEvent> &output_event_stream,
    hls::stream<TimeWarpEvent> &cancellation_unit_output_stream,
    // COMMIT SIGNAL FROM GLOBAL CONTROLLER
    hls::stream<ap_int<32>> &commit_time_stream);

void test_lpcore();

#endif // LPCORE_HPP