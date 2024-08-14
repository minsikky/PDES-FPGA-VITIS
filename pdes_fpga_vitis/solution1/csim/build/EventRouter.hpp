#ifndef EVENT_ROUTER_HPP
#define EVENT_ROUTER_HPP

#include <hls_task.h>
#include "sys_defs.hpp"
#include "LPMapping.hpp"

void event_router_top(
    hls::stream<TimeWarpEvent> &event_stream,
    hls::stream<TimeWarpEvent> to_event_queue[NUM_LPCORE]);

#endif // EVENT_ROUTER_HPP