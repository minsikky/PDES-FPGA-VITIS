#ifndef EVENT_PROCESSOR_HPP
#define EVENT_PROCESSOR_HPP

#include <hls_task.h>
#include <ap_int.h>
#include "sys_defs.hpp"
#include "LFSR_PRNG.hpp"
#include "LPMapping.hpp"

class EventProcessor
{
private:
    MultiLFSR_PRNG prng;

public:
    ap_uint<8> lpcore_id;

public:
    EventProcessor(ap_uint<8> lpcore_id);
    void process_event(TimeWarpEvent &event, LPState &state,
                       hls::stream<LPState> &state_buffer_input_stream,
                       hls::stream<LVT> &lvt_stream,
                       hls::stream<TimeWarpEvent> &output_event_stream,
                       hls::stream<TimeWarpEvent> &cancellation_unit_input_stream);
};

template <int ID>
void event_processor_top(
    hls::stream<EventProcessorInput> &event_processor_input_stream,
    hls::stream<LPState> &state_buffer_input_stream,
    hls::stream<LVT> &lvt_stream,
    hls::stream<TimeWarpEvent> &output_event_stream,
    hls::stream<TimeWarpEvent> &cancellation_unit_input_stream)
{
    static EventProcessor event_processor(ID);
    if (!event_processor_input_stream.empty())
    {
        EventProcessorInput input = event_processor_input_stream.read();
        TimeWarpEvent event = input.event;
        LPState state = input.state;
        event_processor.process_event(event, state, state_buffer_input_stream, lvt_stream, output_event_stream, cancellation_unit_input_stream);
    }
}

#endif // EVENT_PROCESSOR_HPP