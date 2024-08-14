#include "LPMapping.hpp"

namespace LPMapping {

int get_core_id(int dest_lp_id) {
    return dest_lp_id % NUM_LPCORE;
}

int get_idx(int lp_id) {
    return lp_id / NUM_LPCORE;
}

}  // namespace LPMapping