#include "../../../lib/uart.h"
int main()
{
    uart uart0;
    uart_init(&uart0, (uint32_t *)0x00008010);
    while(1)
    {
        uart_transmit_string(&uart0,"Hello world!\n",13);
        //uart_transmit_byte(&uart0,'U');
        for (int i = 0; i < 1000000; i++){} 
    }
}
