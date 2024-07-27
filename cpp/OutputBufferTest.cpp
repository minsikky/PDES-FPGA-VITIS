#include "OutputBuffer.hpp"
#include <sycl/sycl.hpp>
#include <vector>
#include <iostream>

using namespace sycl;

struct TestOperation
{
    int type; // 0: push, 1: rollback, 2: commit
    int lp_id;
    int32_t time;
};

bool operator==(const TimeWarpEvent &lhs, const TimeWarpEvent &rhs)
{
    return lhs.send_time == rhs.send_time && lhs.recv_time == rhs.recv_time && lhs.data == rhs.data && lhs.sender_id == rhs.sender_id && lhs.receiver_id == rhs.receiver_id && lhs.is_anti_message == rhs.is_anti_message;
}

class TestOutputBufferKernel;

void test_output_buffer(queue& q, const std::vector<TestOperation>& host_operations) {
    OutputBuffer host_buffer;
    buffer<OutputBuffer> device_buffer(&host_buffer, 1);
    buffer<TestOperation> op_buf(host_operations.data(), host_operations.size());

    q.submit([&](handler& h) {
        auto state_buf = device_buffer.get_access<access::mode::read_write>(h);
        auto ops = op_buf.get_access<access::mode::read>(h);

        h.single_task<TestOutputBufferKernel>([=]() {
            OutputBuffer& buffer = state_buf[0];
            for (size_t i = 0; i < ops.size(); ++i) {
                const auto& op = ops[i];
                switch (op.type) {
                    case 0:  // Push
                        {
                            LPState state{op.lp_id, op.time, 0};  // RNG state set to 0 for simplicity
                            buffer.push(state);
                        }
                        break;
                    case 1:  // Rollback
                        buffer.rollback(op.lp_id, op.time);
                        break;
                    case 2:  // Commit
                        buffer.commit(op.time);
                        break;
                }
            }
        });
    });

    // Verify the results on the host
    host_accessor output_acc(device_buffer, read_only);
    const OutputBuffer& result_buffer = output_acc[0];

    // Print final state
    std::cout << "Final GVT: " << result_buffer.get_gvt() << "\n";
    for (int index = 0; index < (int)(NUM_LPS / NUM_LPCORE); ++index) {
        int current = result_buffer.lp_heads[lp_id];
        while (current != -1) {
            const TimeWarpEvent& event = result_buffer.buffer[current].event;
            std::cout << "LP " << event.sender_id << " outputs:\n";
            std::cout << "  send_time: " << event.send_time << "\n";
            current = result_buffer.buffer[current].next;
        }
    }
}

int main()
{
    #if FPGA_SIMULATOR
    auto selector = sycl::ext::intel::fpga_simulator_selector_v;
    #elif FPGA_HARDWARE
    auto selector = sycl::ext::intel::fpga_selector_v;
    #else // #if FPGA_EMULATOR
    auto selector = sycl::ext::intel::fpga_emulator_selector_v;
    #endif

    // Setup SYCL queue for FPGA
    sycl::queue q(selector, {sycl::property::queue::enable_profiling()});
    std::cout << "Running on device: "
              << q.get_device().get_info<info::device::name>() << std::endl;

    std::vector<TestOperation> operations = {
        {0, 0, 10}, // Push LP 0, time 10
        {0, 1, 15}, // Push LP 1, time 15
        {0, 0, 20}, // Push LP 0, time 20
        {1, 0, 15}, // Rollback LP 0 to time 15
        {2, 0, 12}, // Commit to time 12
        {0, 1, 18}, // Push LP 1, time 18
        {2, 0, 16}, // Commit to time 16
    };

    test_state_buffer(q, operations);

    return 0;
}