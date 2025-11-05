#include "uart.h"
#define MLEN 59
#include "irq.h"
#include "inference_light.h"

#include <stdint.h>
#include <stdio.h>

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
    SET_MTVEC_VECTOR_MODE();
    uart_init(&uart0,(uint32_t *) 0x10008010);
    volatile char *addr_ptr = (char*) 0x10008020;
    float in1[122] = { 0.000000f, 1.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 1.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 1.000000f, 0.000000f, -0.109481f, -0.005551f, -0.004919f, -0.014089f, -0.089486f, -0.007736f, -0.095076f, -0.027023f, -0.809262f, -0.011664f, -0.036652f, -0.024437f, -0.012385f, -0.026180f, -0.018610f, -0.041221f, 0.000000f, -0.002817f, -0.097531f, -0.725778f, -0.368110f, -0.637209f, -0.631929f, -0.374362f, -0.374432f, 0.771283f, -0.349683f, -0.374560f, -0.485344f, -0.267863f, 0.197703f, -0.227350f, 1.493939f, -0.111426f, -0.639532f, -0.624871f, -0.387635f, -0.376387f };
    // EXPECTED OUTPUT: 4
     
    uart_transmit_string(&uart0,"READY", 5);
    volatile uint8_t out1 = (uint8_t) model_infer(in1);

    uart_transmit_string(&uart0, (char*)&out1, 1);
    uart_transmit_byte(&uart0, out1);
    uart_transmit_string(&uart0,"DONE", 4);
}

void mti_handler() {}
void exc_handler() {}
void mei_handler() {}
void msi_handler() {}
void fast_irq0_handler() {}
void fast_irq1_handler() {}
