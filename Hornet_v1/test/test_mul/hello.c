#include <stdint.h>

#include "../../libs/soc/platform.h"
#include "../../libs/soc/uart.h"

static struct uart uart0;

int main(void) {
	uart_init(&uart0, (volatile void *) PLATFORM_UART_BASE);
	uart_set_baudrate(&uart0, 115200, PLATFORM_CLK_FREQ);
	uart_printf(&uart0, "Hello World!\r\n");
	while (1);
}
