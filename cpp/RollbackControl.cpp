#include "RollbackControl.hpp"

void rollback_control_top(
    hls::stream<RollbackInfo> &causality_violation_info_stream,
    hls::stream<RollbackInfo> &event_queue_rollback_info_stream,
    hls::stream<RollbackInfo> &state_buffer_rollback_info_stream,
    hls::stream<RollbackInfo> &cancellation_unit_rollback_info_stream)
{
    RollbackInfo rollback_info = causality_violation_info_stream.read();
    event_queue_rollback_info_stream.write(rollback_info);
    state_buffer_rollback_info_stream.write(rollback_info);
    cancellation_unit_rollback_info_stream.write(rollback_info);
}