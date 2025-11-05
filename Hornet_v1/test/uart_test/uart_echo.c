#include "uart.h"
#include "irq.h"
#include <stdint.h>

volatile int count;
volatile int result;
volatile int array[16];

typedef union {
    float f;           // 32-bit float
    uint8_t bytes[4];  // 4 individual bytes
} float_bytes_t;

volatile float input_array[196] = {0};
volatile float_bytes_t rx_var;

uart uart0;


int main() {
    
    
    SET_MTVEC_VECTOR_MODE();
	count = 0;
    result = 4;
    uart_init(&uart0,(uint32_t *) 0x10008010);
    uart_transmit_byte(&uart0, (uint8_t) result);
    

    while(1)
    {
        ENABLE_GLOBAL_IRQ();
        ENABLE_FAST_IRQ(0);
        while(count!=16) continue;
        result = 4;
        uart_transmit_byte(&uart0, (uint8_t) result);
        count = 0;
    }
    // printf("Predicted digit: %d\n", result);
    return 0;
}


void mti_handler() {}
void exc_handler() {}
void mei_handler() {}
void msi_handler() {}
void fast_irq0_handler()
{
    char *rx_ptr = (char*)(uart0.base_addr)+UART_RX_ADDR_OFFSET;
    char rx_byte = *rx_ptr;
    
    rx_var.bytes[count % 4] = rx_byte;

    array[count/4]=rx_var.f;

    if(count < 16) count++;
    else DISABLE_GLOBAL_IRQ();
}

void fast_irq1_handler() {}