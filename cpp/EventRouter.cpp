#include "EventRouter.hpp"

void event_router_top(
    hls::stream<TimeWarpEvent> &event_stream,
    hls::stream<TimeWarpEvent> to_event_queue[NUM_LPCORE])
{
    if (!event_stream.empty())
    {
        TimeWarpEvent event = event_stream.read();
        int core_id = LPMapping::get_core_id(event.receiver_id);
        to_event_queue[core_id].write(event); // Will stall if event queue is full
    }
}
