
#include "gpio.h"
#include <stdint.h>

#define GPIO_REG_INPUT		0
#define GPIO_REG_OUTPUT		1
#define GPIO_REG_DIRECTION	2

void gpio_init(struct gpio * module, volatile void * base_address)
{
	module->registers = base_address;
}

void gpio_set_direction(struct gpio * module, uint32_t dir)
{
	module->registers[GPIO_REG_DIRECTION] = dir;
}

uint32_t gpio_get_input(struct gpio * module)
{
	return module->registers[GPIO_REG_INPUT];
}

void gpio_set_output(struct gpio * module, uint32_t output)
{
	module->registers[GPIO_REG_OUTPUT] = output;
}

void gpio_set_pin(struct gpio * module, uint8_t pin)
{
	module->registers[GPIO_REG_OUTPUT] |= (1 << pin);
}

void gpio_clear_pin(struct gpio * module, uint8_t pin)
{
	module->registers[GPIO_REG_OUTPUT] &= ~(1 << pin);
}

