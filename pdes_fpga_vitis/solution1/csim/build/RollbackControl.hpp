#ifndef ROLLBACK_CONTROL_HPP
#define ROLLBACK_CONTROL_HPP

#include <hls_task.h>
#include "sys_defs.hpp"
#include "LPMapping.hpp"

void rollback_control_top(
    hls::stream<RollbackInfo> &causality_violation_info_stream,
    hls::stream<RollbackInfo> &event_queue_rollback_info_stream,
    hls::stream<RollbackInfo> &state_buffer_rollback_info_stream,
    hls::stream<RollbackInfo> &cancellation_unit_rollback_info_stream
    );

#endif // ROLLBACK_CONTROL_HPP