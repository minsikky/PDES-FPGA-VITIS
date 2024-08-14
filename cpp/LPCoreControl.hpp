#ifndef LPCORE_CONTROL_HPP
#define LPCORE_CONTROL_HPP

#include <ap_int.h>
#include <hls_task.h>
#include "sys_defs.hpp"
#include "constants.hpp"

// For rollbacks and commits, the rollback stream and commit stream has to be broadcasted to event queue, state buffer, and cancellation unit

void lpcore_rollback_control(
    hls::stream<RollbackInfo> &causality_violation_stream,
    hls::stream<RollbackInfo> &event_queue_rollback_info_stream,
    hls::stream<RollbackInfo> &state_buffer_rollback_info_stream,
    hls::stream<RollbackInfo> &cancellation_unit_rollback_info_stream);

void lpcore_commit_control(
    hls::stream<ap_int<32>> &lpcore_commit_time_stream,
    hls::stream<ap_int<32>> &event_queue_commit_time_stream,
    hls::stream<ap_int<32>> &state_buffer_commit_time_stream,
    hls::stream<ap_int<32>> &cancellation_unit_commit_time_stream);

void lpcore_control_top(
    hls::stream<RollbackInfo> &causality_violation_stream,
    hls::stream<RollbackInfo> &event_queue_rollback_info_stream,
    hls::stream<RollbackInfo> &state_buffer_rollback_info_stream,
    hls::stream<RollbackInfo> &cancellation_unit_rollback_info_stream,
    hls::stream<ap_int<32>> &lpcore_commit_time_stream,
    hls::stream<ap_int<32>> &event_queue_commit_time_stream,
    hls::stream<ap_int<32>> &state_buffer_commit_time_stream,
    hls::stream<ap_int<32>> &cancellation_unit_commit_time_stream);

#endif // LPCORE_CONTROL_HPP