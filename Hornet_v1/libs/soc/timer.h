
#ifndef TIMER_H
#define TIMER_H

#include <stdint.h>

struct timer
{
	volatile uint32_t * registers;
};

/**
 * Initializes a timer instance.
 * @param module       Pointer to a timer instance structure.
 * @param base_address Base address of the timer hardware module.
 */
void timer_init(struct timer * module, volatile void * base_address);

/**
 * Resets a timer.
 * This stops the timer and resets its counter value to 0.
 * @param module Pointer to a timer instance structure.
 */
void timer_reset(struct timer * module);

/**
 * Starts a timer.
 * @param module Pointer to a timer instance structure.
 */
void timer_start(struct timer * module);

/**
 * Stops a timer.
 * @param module Pointer to a timer instance structure.
 */
void timer_stop(struct timer * module);

/**
 * Clears a timer.
 * @param module Pointer to a timer instance structure.
 */
void timer_clear(struct timer * module);

/**
 * Reads the current value of a timer's counter.
 * @param module Pointer to a timer instance structure.
 * @returns The value of the timer's counter register.
 */
uint32_t timer_get_count(struct timer  * module);

/**
 * Sets the value of a timer's counter register.
 * @param module  Pointer to a timer instance structure.
 * @param counter New value of the timer's counter register.
 * @warning This function should only be used when the timer is stopped to avoid undefined behaviour.
 */
void timer_set_count(struct timer * module, uint32_t counter);

#endif

