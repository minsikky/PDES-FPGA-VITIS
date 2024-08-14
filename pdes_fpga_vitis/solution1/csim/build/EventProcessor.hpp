#ifndef EVENT_PROCESSOR_HPP
#define EVENT_PROCESSOR_HPP

#include <hls_task.h>
#include <ap_int.h>
#include "sys_defs.hpp"
#include "LFSR_PRNG.hpp"
#include "LPMapping.hpp"
#include <vector>

class EventProcessor
{
public:
    ap_uint<8> lpcore_id;
    int prng[NUM_LPS / NUM_LPCORE];

public:
    // EventProcessor();
    EventProcessor(ap_uint<8> lpcore_id);
    void process_event(TimeWarpEvent &event, LPState &state,
                       hls::stream<LPState> &state_buffer_input_stream,
                       hls::stream<TimeWarpEvent> &output_event_stream,
                       hls::stream<TimeWarpEvent> &cancellation_unit_input_stream);
};

template <int ID>
void event_processor_top(
    // StateBuffer &state_buffer,
    hls::stream<EventProcessorInput> &event_processor_input_stream,
    hls::stream<LPState> &state_buffer_input_stream,
    hls::stream<TimeWarpEvent> &output_event_stream,
    hls::stream<TimeWarpEvent> &cancellation_unit_input_stream)
{
    static EventProcessor event_processor(ID);
    if (!event_processor_input_stream.empty())
    {
        EventProcessorInput input = event_processor_input_stream.read();
        TimeWarpEvent event = input.event;
        LPState state = input.state;
        // TimeWarpEvent event = issued_event_stream.read();
        // LPState state = state_buffer.peek(event.receiver_id);
        // std::vector<TimeWarpEvent> output_events;
        event_processor.process_event(event, state, state_buffer_input_stream, output_event_stream, cancellation_unit_input_stream);
        // for (auto &output_event : output_events)
        // {
        //     output_event_stream.write(output_event);
        //     cancellation_unit_input_stream.write(output_event);
        // }
        // Try routing all output events.
        // If it fails, stall the event processor.
    }
}

#endif // EVENT_PROCESSOR_HPP