#ifndef TIME_WARP_SIMULATION_HPP
#define TIME_WARP_SIMULATION_HPP

#include <array>
#include <ap_int.h>
#include "constants.hpp"
#include "LPCore.hpp"

class TimeWarpSimulation {
public:
    LPCore lpcores[NUM_LPCORE];
    ap_int<32> gvt;
    int stall_count;
    static constexpr int MAX_STALL_COUNT = 1000;

public:
    TimeWarpSimulation();
    bool route_event(const TimeWarpEvent &event);

private:
    void handle_persistent_stall();
};

#endif // TIME_WARP_SIMULATION_HPP