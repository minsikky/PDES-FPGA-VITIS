#ifndef LPMAPPING_HPP
#define LPMAPPING_HPP

namespace LPMapping{
    int get_core_id(int dest_lp_id) {
        return dest_lp_id % NUM_LPCORE;
    }
}

#endif