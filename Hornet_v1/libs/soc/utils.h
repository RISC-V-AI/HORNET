
#ifndef UTILS_H
#define UTILS_H

#include <stdint.h>

/**
 * Sleeps for microseconds.
 * @param usec	Sleep time in microseconds.
 * @return		Returns 0 for success.
 */
int usleep(unsigned long usec);

/**
 * Resets the performance counters.
 */
void pcount_reset();

/**
 * Stops clock counter.
 */
void mtime_stop();

/**
 * Starts clock counter.
 */
void mtime_start();

/**
 * Returns lower 32 bits of current clock count.
 * @return Current clock count lower 32 bits.
 */
uint32_t mtime_get32();

/**
 * Returns current clock count.
 * @return Current clock count 64 bits.
 */
uint64_t mtime_get64();

/**
 * Converts clock counts to microseconds.
 * @param clock_cycle	Clock counts.
 * @return				Microseconds.
 */
uint64_t cc2us(uint64_t clock_cycle);

#endif /* UTILS_H */

