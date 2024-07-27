#ifndef CONSTANTS_HPP
#define CONSTANTS_HPP

// Virtual LP
constexpr int NUM_LPS = 64;

// LPCore
constexpr int NUM_LPCORE = 4;

// EVENT QUEUE
static constexpr int EVENT_QUEUE_CAPACITY = 128;
static constexpr int ANTI_MSG_RESERVE = 16;

// EVENT QUEUE TEST
static constexpr int NUM_EVENTS = 64; // Adjust as needed

// STATE BUFFER
static constexpr int STATE_BUFFER_CAPACITY = 128;

// EVENT HISTORY
static constexpr int EVENT_HISTORY_CAPACITY = 64;

#endif // CONSTANTS_HPP
