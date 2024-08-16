#include "LPCoreControl.hpp"

void lpcore_rollback_control(
    hls::stream<RollbackInfo> &causality_violation_stream,
    hls::stream<RollbackInfo> &event_queue_rollback_info_stream,
    hls::stream<RollbackInfo> &state_buffer_rollback_info_stream,
    hls::stream<RollbackInfo> &cancellation_unit_rollback_info_stream)
{
    RollbackInfo rollback_info = causality_violation_stream.read();
    event_queue_rollback_info_stream.write(rollback_info);
    state_buffer_rollback_info_stream.write(rollback_info);
    cancellation_unit_rollback_info_stream.write(rollback_info);
}

void lpcore_commit_control(
    hls::stream<ap_int<32>> &lpcore_commit_time_stream,
    hls::stream<ap_int<32>> &event_queue_commit_time_stream,
    hls::stream<ap_int<32>> &state_buffer_commit_time_stream,
    hls::stream<ap_int<32>> &cancellation_unit_commit_time_stream)
{
    ap_int<32> commit_time = lpcore_commit_time_stream.read();
    event_queue_commit_time_stream.write(commit_time);
    state_buffer_commit_time_stream.write(commit_time);
    cancellation_unit_commit_time_stream.write(commit_time);
}