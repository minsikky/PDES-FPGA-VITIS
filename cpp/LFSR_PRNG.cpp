#include "LFSR_PRNG.hpp"

LFSR_PRNG::LFSR_PRNG(ap_uint<8> seed) : state(seed) {
    if (seed == 0) state = 1; // Avoid all-zero state
}

ap_uint<8> LFSR_PRNG::generate() {
    bool tap = state[7] ^ state[5] ^ state[4] ^ state[3];
    state = (state << 1) | tap;
    return state;
}

MultiLFSR_PRNG::MultiLFSR_PRNG() : num_generators(0) {}

int MultiLFSR_PRNG::add_generator(ap_uint<8> seed) {
    if (num_generators < MAX_GENERATORS) {
        generators[num_generators] = LFSR_PRNG(seed);
        return num_generators++;
    }
    return -1; // Error: max number of generators reached
}

ap_uint<8> MultiLFSR_PRNG::generate(int generator_id) {
    if (generator_id >= 0 && generator_id < num_generators) {
        return generators[generator_id].generate();
    }
    return 0; // Error: invalid generator_id
}