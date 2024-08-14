#ifndef LFSR_PRNG_HPP
#define LFSR_PRNG_HPP

#include <cstdint>
#include <ap_int.h>

class LFSR_PRNG {
private:
    ap_uint<8> state;

public:
    LFSR_PRNG(ap_uint<8> seed = 1);
    ap_uint<8> generate();
};

class MultiLFSR_PRNG {
private:
    static const int MAX_GENERATORS = 16; // Adjust as needed
    LFSR_PRNG generators[MAX_GENERATORS];
    int num_generators;

public:
    MultiLFSR_PRNG();
    int add_generator(ap_uint<8> seed);
    ap_uint<8> generate(int generator_id);
};

// Global instance of MultiLFSR_PRNG
extern MultiLFSR_PRNG g_multi_prng;

// Function to add a new PRNG
int add_lfsr_prng(ap_uint<8> seed);

// Function to generate a random number from a specific PRNG
ap_uint<8> lfsr_random(int generator_id);

#endif // LFSR_PRNG_HPP