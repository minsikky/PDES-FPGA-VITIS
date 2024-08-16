#include "EventProcessor.hpp"
#include <iostream>

EventProcessor::EventProcessor(ap_uint<8> lpcore_id) : lpcore_id(lpcore_id)
{
    for (int i = 0; i < NUM_LPS / NUM_LPCORE; ++i)
    {
        int global_lp_id = lpcore_id + NUM_LPCORE * i;
        prng.add_generator(global_lp_id + 1);
    }
}

void EventProcessor::process_event(TimeWarpEvent &event, LPState &state,
                                   hls::stream<LPState> &state_buffer_input_stream,
                                   hls::stream<LVT> &lvt_stream,
                                   hls::stream<TimeWarpEvent> &output_event_stream,
                                   hls::stream<TimeWarpEvent> &cancellation_unit_input_stream)
{
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
        ap_uint<8> rand_time = prng.generate(idx);
        ap_uint<8> rand_lp = prng.generate(idx) % NUM_LPS;
        // Send an event to a random LP at random time
        TimeWarpEvent new_event = {state.lvt, state.lvt + rand_time, 0, state.lp_id, rand_lp, false};
        lvt_stream.write({state.lp_id, state.lvt});
        output_event_stream.write(new_event);
        /*
        Fun fact: new_event.recv_time > state.lvt.
        For GVT calculation, we can use state.lvt.
        (No need for in-transit event tracking)
        */
        cancellation_unit_input_stream.write(new_event);
    }
}