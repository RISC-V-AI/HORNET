#include "uart.h"
// #include "../../../test/aes/aes.h"
#define MLEN 59
#include "irq.h"
#include <stdint.h>

volatile uint8_t input_array[59] = {0x00,0xff,0x47,0x78,0x69,0xf1,0xbb,0x2d,0x84,0x54,0xa4,0x30,0xa2,0xd8,0x99,0xb5,0x68,0x82,0xf6,0x5f,0x80,0x30,0xcb,0xd1,0xd2,0x5d,0x96,0xff,0xa4,0x55,0x56,0x2e,0xb4,0x55,0x2a,0x79,0x92,0x8c,0xca,0x1d,0xab,0xf6,0x63,0x28,0x06,0x74,0x02,0xce,0x5b,0xb4,0xb8,0x9c,0xe1,0x9b,0x86,0x27,0x8e,0x84,0x6b};
   volatile int count;
   uart uart0;

union four_bytes {
    int32_t word;
    uint8_t byte[4];
} typedef four_bytes; 

union eight_bytes {
    int64_t word;
    uint8_t byte[8];
} typedef eight_bytes; 

volatile four_bytes b;

int main()
{
    volatile char *addr_ptr = (char*) 0x10008020;
  
    volatile four_bytes a;
    volatile eight_bytes c;

    a.word = 0x01020304;

    SET_MTVEC_VECTOR_MODE();
	count = 0;
	// uint8_t key[] = { 0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c };
	// struct AES_ctx ctx;
    // AES_init_ctx(&ctx, key);

    uart_init(&uart0,(uint32_t *) 0x10008010);
    
    //uart_transmit_string(&uart0, m, 59);
    //crypto_sign(sm, &smlen, m, MLEN, sk);
    //uart_transmit_string(&uart0, m, 59);
    
    //uart_transmit_string(&uart0, sm, 59);
    //uart_transmit_string(&uart0,"GOT HORNET!\n",12);
    //*addr_ptr = 1;
    ///uart_transmit_string(&uart0,"UUUUUUUUUUUU",12);
    while(1)
    {
        //uart_transmit_string(&uart0,"Send 16 bytes of input block!\n",30);
        ENABLE_GLOBAL_IRQ();
        ENABLE_FAST_IRQ(0);
        //*addr_ptr = 0;
        while(count < 4) continue;
        //uart_transmit_byte(&uart0, count);
        //uart_transmit_byte(&uart0, count);
        //uart_transmit_byte(&uart0, 'A');
        //uart_transmit_string(&uart0, input_array, 59);
        *addr_ptr = 1;
        *addr_ptr = 0;
        c.word = (int64_t) a.word * b.word;
        uart_transmit_string(&uart0, c.byte, 8);
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
    b.byte[count]=rx_byte;
    

    if(count<4) count++;
    else DISABLE_GLOBAL_IRQ();
    /*if(count == 59){
      DISABLE_GLOBAL_IRQ();  
    }*/
}

void fast_irq1_handler() {}
