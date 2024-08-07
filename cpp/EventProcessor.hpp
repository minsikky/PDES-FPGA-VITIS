#ifndef EVENT_PROCESSOR_HPP
#define EVENT_PROCESSOR_HPP

#include <ap_int.h>
#include "EventQueue.hpp"
#include "StateBuffer.hpp"

class EventProcessor
{
    public:
        EventProcessor() {}

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
            }
        }
};

#endif // EVENT_PROCESSOR_HPP