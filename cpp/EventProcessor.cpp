#include "EventProcessor.hpp"
#include <iostream>

// EventProcessor::EventProcessor() {
//     simulation = TimeWarpSimulation();
//     lpcore = LPCore();
// }

EventProcessor::EventProcessor(ap_uint<8> lpcore_id) : lpcore_id(lpcore_id)
{
    for (int i = 0; i < NUM_LPS / NUM_LPCORE; ++i)
    {
        int global_lp_id = lpcore_id + NUM_LPCORE * i;
        prng[i] = add_lfsr_prng(global_lp_id + 1);
    }
}

void EventProcessor::process_event(TimeWarpEvent &event, LPState &state,
                                   hls::stream<LPState> &state_buffer_input_stream,
                                   hls::stream<TimeWarpEvent> &output_event_stream,
                                   hls::stream<TimeWarpEvent> &cancellation_unit_input_stream)
{
    // std::vector<TimeWarpEvent> output_events;
    if (event.is_anti_message)
    {
        std::cerr << "Error: Anti-message received in EventProcessor" << std::endl;
    }
    else
    {
        // Process normal message
        std::cout << "Processing message from LP " << event.sender_id << " to LP " << event.receiver_id << " with data " << event.data << std::endl;
        // Update state
        state.lvt = event.recv_time;
        state_buffer_input_stream.write(state);
        // Generate random numbers
        int idx = LPMapping::get_idx(event.receiver_id);
        ap_uint<8> rand_time = lfsr_random(prng[idx]);
        ap_uint<8> rand_lp = lfsr_random(prng[idx]) % NUM_LPS;
        // Send an event to a random LP at random time
        TimeWarpEvent new_event = {state.lvt, state.lvt + rand_time, 0, state.lp_id, rand_lp, false};
        // output_events.emplace_back(new_event);
        output_event_stream.write(new_event);
        cancellation_unit_input_stream.write(new_event);
    }
    return;
}

// template <int ID>
// void event_processor_top(
//     // StateBuffer &state_buffer,
//     hls::stream<EventProcessorInput> &event_processor_input_stream,
//     // hls::stream<TimeWarpEvent> &issued_event_stream,
//     hls::stream<TimeWarpEvent> &output_event_stream,
//     hls::stream<TimeWarpEvent> &cancellation_unit_input_stream)
// {
//     static EventProcessor event_processor(ID);
//     if (!event_processor_input_stream.empty())
//     {
//         EventProcessorInput input = event_processor_input_stream.read();
//         TimeWarpEvent event = input.event;
//         LPState state = input.state;
//         // TimeWarpEvent event = issued_event_stream.read();
//         // LPState state = state_buffer.peek(event.receiver_id);
//         // std::vector<TimeWarpEvent> output_events;
//         event_processor.process_event(event, state, output_event_stream, cancellation_unit_input_stream);
//         // for (auto &output_event : output_events)
//         // {
//         //     output_event_stream.write(output_event);
//         //     cancellation_unit_input_stream.write(output_event);
//         // }
//         // Try routing all output events.
//         // If it fails, stall the event processor.
//     }
// }