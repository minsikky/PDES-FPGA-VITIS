#ifndef LPSR_PRNG_HPP
#define LPSR_PRNG_HPP

#include <cstdint>
#include <ap_int.h>

class LFSR_PRNG {
private:
    ap_uint<8> state;

public:
    LFSR_PRNG(ap_uint<8> seed = 1) : state(seed) {
        if (seed == 0) state = 1; // Avoid all-zero state
    }

    ap_uint<8> generate() {
        #pragma HLS INLINE
        bool tap = state[7] ^ state[5] ^ state[4] ^ state[3];
        state = (state << 1) | tap;
        return state;
    }
};

class MultiLFSR_PRNG {
private:
    static const int MAX_GENERATORS = 16; // Adjust as needed
    LFSR_PRNG generators[MAX_GENERATORS];
    int num_generators;

public:
    MultiLFSR_PRNG() : num_generators(0) {}

    int add_generator(ap_uint<8> seed) {
        #pragma HLS INLINE
        if (num_generators < MAX_GENERATORS) {
            generators[num_generators] = LFSR_PRNG(seed);
            return num_generators++;
        }
        return -1; // Error: max number of generators reached
    }

    ap_uint<8> generate(int generator_id) {
        #pragma HLS INLINE
        if (generator_id >= 0 && generator_id < num_generators) {
            return generators[generator_id].generate();
        }
        return 0; // Error: invalid generator_id
    }
};

// Global instance of MultiLFSR_PRNG
MultiLFSR_PRNG g_multi_prng;

// Function to add a new PRNG
int add_lfsr_prng(ap_uint<8> seed) {
    #pragma HLS INLINE
    return g_multi_prng.add_generator(seed);
}

// Function to generate a random number from a specific PRNG
ap_uint<8> lfsr_random(int generator_id) {
    #pragma HLS INLINE
    return g_multi_prng.generate(generator_id);
}

#endif // LPSR_PRNG_HPP