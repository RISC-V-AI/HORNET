
#include "timer.h"
#include <stdint.h>

#define TIMER_REG_CONTROL	0
#define TIMER_REG_COUNTER	1

#define TIMER_CONTROL_RUN	0
#define TIMER_CONTROL_CLEAR	1

void timer_init(struct timer * module, volatile void * base_address)
{
	module->registers = base_address;
}

void timer_reset(struct timer * module)
{
	module->registers[TIMER_REG_CONTROL] = 1 << TIMER_CONTROL_CLEAR;
}

void timer_start(struct timer * module)
{
	module->registers[TIMER_REG_CONTROL] = 1 << TIMER_CONTROL_RUN;
}

void timer_stop(struct timer * module)
{
	module->registers[TIMER_REG_CONTROL] = 0;
}

void timer_clear(struct timer * module)
{
	module->registers[TIMER_REG_CONTROL] |= 1 << TIMER_CONTROL_CLEAR;
}

uint32_t timer_get_count(struct timer  * module)
{
	return module->registers[TIMER_REG_COUNTER];
}

void timer_set_count(struct timer * module, uint32_t counter)
{
	module->registers[TIMER_REG_COUNTER] = counter;
}

