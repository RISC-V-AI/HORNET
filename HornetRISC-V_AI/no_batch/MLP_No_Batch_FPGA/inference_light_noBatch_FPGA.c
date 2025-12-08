// =============================================================================
// RISC-V FPGA INFERENCE (FOLDED / NO-BATCH / NO-SOFTMAX)
// =============================================================================

#ifndef USE_KERAS_LAYOUT
#define USE_KERAS_LAYOUT 1
#endif

// --- CRITICAL: Use the Folded Weights ---
#include "MLP_weights_folded.h" 

#include "uart.h"
#include "irq.h"
#include <stdint.h>

#define DEBUG_IF_ADDR 0x10008010 

// --- Dimensions ---
#define INPUT_DIM 122
#define L0_OUT    256 
#define L1_OUT    128 
#define L2_OUT    64  
#define L3_OUT    32  
#define L4_OUT    5   

// --- UART/Buffer State ---
#define TOTAL_BYTES_TO_RECEIVE (INPUT_DIM * 4) // 122 * 4 = 488 bytes

volatile int count;
volatile float input_array[INPUT_DIM]; // Buffer for UART data

typedef union {
    float f;           
    uint8_t bytes[4];  
} float_bytes_t;

volatile float_bytes_t rx_var;
uart uart0;

// =============================================================================
// LIGHTWEIGHT MATH HELPERS (NO SQRT, NO EXP)
// =============================================================================

float relu(float x){ return x > 0.0f ? x : 0.0f; }

void dense_affine(const float *x, int in_dim,
                  const float *w, const float *b,
                  int out_dim, float *y)
{
#if USE_KERAS_LAYOUT
    // Keras Layout
    for (int o = 0; o < out_dim; ++o) {
        float acc = b[o];
        for (int i = 0; i < in_dim; ++i)
            acc += x[i] * w[i * out_dim + o];
        y[o] = acc;
    }
#else
    // Transposed Layout
    for (int o = 0; o < out_dim; ++o) {
        float acc = b[o];
        const float *wrow = &w[o * in_dim];
        for (int i = 0; i < in_dim; ++i)
            acc += wrow[i] * x[i];
        y[o] = acc;
    }
#endif
}

// =============================================================================
// INFERENCE ENGINE
// =============================================================================
int model_infer(const float *x)
{
    // Define buffers locally (or static if stack is small)
    // Note: If you get stack overflow, move these outside the function.
    float z0[L0_OUT];
    float z1[L1_OUT];
    float z2[L2_OUT];
    float z3[L3_OUT];
    float logits[L4_OUT];
    
    // Layer 0: Folded Dense -> ReLU
    dense_affine(x, INPUT_DIM, layer0_weights, layer0_biases, L0_OUT, z0);
    for (int i=0; i<L0_OUT; ++i) z0[i] = relu(z0[i]);

    // Layer 1: Folded Dense -> ReLU
    dense_affine(z0, L0_OUT, layer1_weights, layer1_biases, L1_OUT, z1);
    for (int i=0; i<L1_OUT; ++i) z1[i] = relu(z1[i]);

    // Layer 2: Folded Dense -> ReLU
    dense_affine(z1, L1_OUT, layer2_weights, layer2_biases, L2_OUT, z2);
    for (int i=0; i<L2_OUT; ++i) z2[i] = relu(z2[i]);

    // Layer 3: Folded Dense -> ReLU
    dense_affine(z2, L2_OUT, layer3_weights, layer3_biases, L3_OUT, z3);
    for (int i=0; i<L3_OUT; ++i) z3[i] = relu(z3[i]);

    // Layer 4: Output (Logits only)
    dense_affine(z3, L3_OUT, layer4_weights, layer4_biases, L4_OUT, logits);

    // Argmax (No Softmax needed)
    int predicted = 0;
    float max_val = logits[0];
    for (int i = 1; i < L4_OUT; ++i) {
        if (logits[i] > max_val) {
            max_val = logits[i];
            predicted = i;
        }
    }

    return predicted;
}

// =============================================================================
// MAIN EXECUTION LOOP
// =============================================================================
int main() {
    // 1. Setup
    SET_MTVEC_VECTOR_MODE();
    count = 0;
    uart_init(&uart0, (uint32_t *) 0x10008010);

    // 2. Hardcoded Test Vector (To verify boot/logic without UART)
    // This ensures your FPGA is alive immediately after bitstream load.
    float test_input[INPUT_DIM] = { 
        0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 
        0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 
        // ... (truncated for brevity, fills zeros) ...
        0.0f // Ensure this array is size 122 or fill it properly
    };
    // Note: The specific values don't matter for the boot test, 
    // just that it runs without crashing.
    
    // Run self-test
    int boot_result = model_infer(test_input);
    uart_transmit_byte(&uart0, (uint8_t) boot_result);

    // 3. Main UART Loop
    while(1)
    {
        // Reset counter and Enable Interrupts to start receiving
        count = 0;
        ENABLE_GLOBAL_IRQ();
        ENABLE_FAST_IRQ(0); 
        
        // Wait until buffer is full (488 bytes)
        // The ISR will disable interrupts when done.
        while(count < TOTAL_BYTES_TO_RECEIVE) {
            // Optional: Toggle an LED here to show "Waiting"
            continue; 
        }
        
        // --- Data Received ---
        // Run Inference
        int result = model_infer((float*)input_array);
        
        // Send Result
        uart_transmit_byte(&uart0, (uint8_t) result);
    }
    
    return 0;
}

// =============================================================================
// INTERRUPT SERVICE ROUTINE
// =============================================================================

void mti_handler() {}
void exc_handler() {}
void mei_handler() {}
void msi_handler() {}

void fast_irq0_handler()
{
    // 1. Read Byte
    char *rx_ptr = (char*)(uart0.base_addr) + UART_RX_ADDR_OFFSET;
    char rx_byte = *rx_ptr;
    
    // 2. Assembly Float
    rx_var.bytes[count % 4] = rx_byte;

    // 3. Store to Array 
    // (We write every byte, but the float is only valid every 4th byte. This is fine.)
    input_array[count / 4] = rx_var.f;

    // 4. Increment & Check
    count++;
    
    if (count >= TOTAL_BYTES_TO_RECEIVE) {
        // Buffer Full: Stop listening to avoid buffer overflow
        DISABLE_GLOBAL_IRQ();
    }
}

void fast_irq1_handler() {}