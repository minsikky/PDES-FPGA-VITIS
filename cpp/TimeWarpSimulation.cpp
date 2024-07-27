#include "TimeWarpSimulation.hpp"

TimeWarpSimulation::TimeWarpSimulation(int num_cores, int virtual_lps_per_core) : gvt(0)
{
    lp_cores.reserve(num_cores);
    for (int i = 0; i < num_cores; ++i)
    {
        lp_cores.emplace_back(virtual_lps_per_core);
    }
}

void TimeWarpSimulation::calculate_gvt()
{
    int32_t min_lvt = INT32_MAX;
    int32_t min_event_time = INT32_MAX;

    for (auto &core : lp_cores)
    {
        for (auto &lp : core.virtual_lps)
        {
            min_lvt = std::min(min_lvt, lp.lvt);
            if (!lp.input_queue.empty())
            {
                min_event_time = std::min(min_event_time, lp.input_queue.front().time);
            }
        }
    }

    gvt = std::min(min_lvt, min_event_time);
}

void TimeWarpSimulation::fossil_collection()
{
    for (auto &core : lp_cores)
    {
        for (auto &lp : core.virtual_lps)
        {
            lp.commit(gvt);
        }
    }
}

void TimeWarpSimulation::balance_load()
{
    // Implement load balancing logic here
    // This could involve moving virtual LPs between cores
}

bool TimeWarpSimulation::is_simulation_complete()
{
    // Check if all event queues are empty and all LPs have reached the end time
    // Return true if simulation is complete, false otherwise
}

struct SimulationStats
{
    int64_t total_events_processed;
    int64_t total_rollbacks;
    int32_t max_gvt;
    // Add more statistics as needed
};

void TimeWarpSimulation::collect_statistics()
{
    // Collect statistics from all LPs and update SimulationStats
}

void TimeWarpSimulation::save_checkpoint()
{
    // Save the state of all LPs and global simulation data
}

void TimeWarpSimulation::load_checkpoint()
{
    // Load the state of all LPs and global simulation data
}

void TimeWarpSimulation::run(queue &q)
{
    while (!is_simulation_complete())
    {
        for (auto &core : lp_cores)
        {
            core.process_events(q);
        }

        if (/* time to calculate GVT */)
        {
            calculate_gvt();
            fossil_collection();
        }

        if (/* time to balance load */)
        {
            balance_load();
        }

        if (/* time to collect statistics */)
        {
            collect_statistics();
        }

        if (/* time to checkpoint */)
        {
            save_checkpoint();
        }
    }

    // Final statistics collection and reporting
    collect_statistics();
    // Report final simulation results
}