#include "../../../lib/uart.h"
#include "../../../test/aes/aes.h"
#define ECB 1
#include "../../../lib/irq.h"
#include "params.h"
#include "poly.h"
#include "params.h"
#include "sign.h"
#include "packing.h"
#include "polyvec.h"
#include "poly.h"
#include "symmetric.h"
#include "fips202.h"
#include <stdint.h>

   volatile uint8_t input_array[16] = {0};
   volatile int count;
   uart uart0;

int main()
{
    char *addr_ptr = (char*) 0x10008020;
    
    SET_MTVEC_VECTOR_MODE();
	count = 0;
	uint8_t key[] = { 0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c };
	struct AES_ctx ctx;
    AES_init_ctx(&ctx, key);
    uart_init(&uart0,(uint32_t *) 0x10008010);

    
    //uart_transmit_string(&uart0, m, 59);
    //crypto_sign(sm, &smlen, m, MLEN, sk);
    //uart_transmit_string(&uart0, m, 59);
    
    //uart_transmit_string(&uart0, sm, 59);
    //uart_transmit_string(&uart0,"GOT HORNET!\n",12);
    *addr_ptr = 1;
    uart_transmit_string(&uart0,"UUUUUUUUUUUU",12);
    while(1)
    {
        //uart_transmit_string(&uart0,"Send 16 bytes of input block!\n",30);
        ENABLE_GLOBAL_IRQ();
        ENABLE_FAST_IRQ(0);
        *addr_ptr = 0;
        while(count < 16) continue;
        //uart_transmit_byte(&uart0, count);
        //uart_transmit_byte(&uart0, count);
        //uart_transmit_byte(&uart0, 'A');
        //uart_transmit_string(&uart0, input_array, 59);
        //*addr_ptr = 1;
        AES_ECB_encrypt(&ctx, input_array);
        //*addr_ptr = 0;
        uart_transmit_string(&uart0, input_array, 16);
        // AES_ECB_encrypt(&ctx, input_array);
        // uart_transmit_string(&uart0, input_array, 16);
        count = 0;
    }
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
    //uart_transmit_byte(&uart0, rx_byte);
    input_array[count]=rx_byte;
    

    if(count<16) count++;
    else DISABLE_GLOBAL_IRQ();
    /*if(count == 59){
      DISABLE_GLOBAL_IRQ();  
    }*/
}

void fast_irq1_handler() {}
