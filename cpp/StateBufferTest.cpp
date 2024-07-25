#include "StateBuffer.hpp"
#include <iostream>
#include <vector>
#include <hls_stream.h>

// This function is for simulation purposes only
void simulate_test() {
    hls::stream<TestOperation> in_stream;
    hls::stream<int> out_stream;

    // Prepare test operations
    std::vector<TestOperation> operations = {
        {0, 0, 10}, // Push LP 0, time 10
        {0, 1, 15}, // Push LP 1, time 15
        {0, 0, 20}, // Push LP 0, time 20
		{0, 0, 30}, // Push LP 0, time 30
		{0, 0, 40}, // Push LP 0, time 40
		{0, 0, 50}, // Push LP 0, time 50
		{0, 0, 60}, // Push LP 0, time 60
		{0, 1, 70}, // Push LP 1, time 70
		{0, 1, 80}, // Push LP 1, time 80
		{0, 1, 90}, // Push LP 1, time 90
		{0, 1, 100}, // Push LP 1, time 100
        {1, 0, 15}, // Rollback LP 0 to time 15
        {2, 0, 12}, // Commit to time 12
        {0, 1, 110}, // Push LP 1, time 110
        {2, 0, 16}, // Commit to time 16
    };

    // Write operations to input stream
    for (const auto& op : operations) {
        in_stream.write(op);
    }

    // Call the top-level function
    test_state_buffer(in_stream, out_stream);

    // Process the output
    int gvt = out_stream.read();
    std::cout << "Final GVT: " << gvt << "\n";

    for (int lp_id = 0; lp_id < NUM_LPS; ++lp_id) {
        std::cout << "LP " << lp_id << " states:\n";
        int lvt;
        while ((lvt = out_stream.read()) != -1) {
            std::cout << " LVT: " << lvt << "\n";
        }
    }
}

int main() {
    simulate_test();
    return 0;
}
