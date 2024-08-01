#include "EventQueue.hpp"
#include "StateBuffer.hpp"
#include "EventHistory.hpp"

int main() {
//    int state_buffer_passed = test_state_buffer();
//    int event_queue_passed = test_event_queue();
	int event_history_passed = test_event_history();
    return event_history_passed;
}
