#include "EventQueue.hpp"
#include "StateBuffer.hpp"

int main() {
    int state_buffer_passed = test_state_buffer();
//    int event_queue_passed = test_event_queue();
    return state_buffer_passed;
}
