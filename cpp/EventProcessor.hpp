#ifndef EVENT_PROCESSOR_HPP
#define EVENT_PROCESSOR_HPP

#include <ap_int.h>
#include "EventQueue.hpp"
#include "StateBuffer.hpp"
#include "LFSR_PRNG.hpp"

// Forward declaration
class LPCore;

class EventProcessor
{
public:
    TimeWarpSimulation *simulation;
    LPCore *lpcore;
    int prng[NUM_LPS / NUM_LPCORE];

public:
    EventProcessor();
    EventProcessor(TimeWarpSimulation *simulation, LPCore *lpcore) : simulation(simulation), lpcore(lpcore)
    {
        for (int i = 0; i < NUM_LPS / NUM_LPCORE; ++i)
        {
            int global_lp_id = lpcore->lpcore_id + NUM_LPCORE * i;
            prng[i] = add_lfsr_prng(global_lp_id + 1);
        }
    }

    void process_event(TimeWarpEvent &event, LPState &state)
    {
        if (event.is_anti_message) // Should never happen
        {
            std::cerr << "Error: Anti-message received in EventProcessor" << std::endl;
        }
        else
        {
            // Process normal message
            std::cout << "Processing message from LP " << event.sender_id << " to LP " << event.receiver_id << " with data " << event.data << std::endl;
            // Update state
            state.lvt = event.recv_time;

            // Generate random number
            int idx = (event.receiver_id - lpcore->lpcore_id) / NUM_LPCORE;
            ap_uint<8> rand_time = lfsr_random(prng[idx]);
            ap_uint<8> rand_lp = lfsr_random(prng[idx]) % NUM_LPS;

            // Send an event to a random LP at random time
            TimeWarpEvent new_event = {state.lvt, state.lvt + rand_time, 0, state.lp_id, rand_lp, false};
            if (lpcore->is_assigned_lp(new_event.receiver_id)) {
                // Send to the same LPCore
                lpcore->recv_event(new_event);
            }
            else {
                // Send to a remote LPCore
                simulation->route_event(new_event);
            }
        }
    }
};

#endif // EVENT_PROCESSOR_HPP