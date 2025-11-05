
#ifndef GPIO_H
#define GPIO_H

#include <stdint.h>

struct gpio
{
	volatile uint32_t * registers;
};

/* 
 * Initializes a GPIO instance.
 * @param module		Pointer to a GPIO instance structure.
 * @param base_address	Pointer to the base address of the GPIO hardware instance.
 */
void gpio_init(struct gpio * module, volatile void * base_address);

/*
 * Sets the GPIO direction register.
 * 1 for output, 0 for input
 * @param module Pointer to a GPIO instance structure.
 * @param dir    Direction bitmask for the GPIO direction register.
 */
void gpio_set_direction(struct gpio * module, uint32_t dir);

uint32_t gpio_get_input(struct gpio * module);

void gpio_set_output(struct gpio * module, uint32_t output);

/*
 * Sets (turns on) the specified GPIO pin.
 * @param module Pointer to the GPIO instance structure.
 * @param pin    Pin number for the pin to turn on.
 */
void gpio_set_pin(struct gpio * module, uint8_t pin);

/*
 * Clears (turns off) the specified GPIO pin.
 * @param module Pointer to the PGIO instance structure.
 * @param pin    Pin number for the pin to turn off.
 */
void gpio_clear_pin(struct gpio * module, uint8_t pin);

#endif /* GPIO_H */

