
// ---- config: choose how your Dense weights are laid out ----
#ifndef USE_KERAS_LAYOUT
#define USE_KERAS_LAYOUT 1
#endif

// #include <math.h> /
// #include <stdio.h>
// #include <stdlib.h>
#include "MLP_weightsBN_light.h" // Ağırlıklarınızı içeren dosya
#define DEBUG_IF_ADDR 0x10008010 // Şimdilik kullanmıyorum

#include "uart.h"
#include "irq.h"
#include <stdint.h>

volatile int count;
volatile float input[122]; 


typedef union {
    float f;           // 32-bit float
    uint8_t bytes[4];  // 4 individual bytes
} float_bytes_t;

volatile float input_array[196] = {0};
volatile float_bytes_t rx_var;

uart uart0;

// dims - LIGHTWEIGHT MODEL İÇİN GÜNCELLENDİ
#define INPUT_DIM 122
#define L0_OUT    256 // Eskiden 512
#define L1_OUT    128 // Eskiden 256
#define L2_OUT    64  // Eskiden 128
#define L3_OUT    32  // Yeni ara katman boyutu
#define L4_OUT    5   // Çıkış katmanı boyutu

// ---- Approximate expf ve sqrtf fonksiyonları aynı kalır ----
float expf_approx(float x) {
float result = 1.0f;
float term = 1.0f;
for (int n = 1; n <= 50; n++) {
 term *= x / n;
 result += term;
 }
 return result;
}

float sqrtf_approx(float x) {
if (x <= 0.0f) return 0.0f;
float guess = x > 1.0f ? x : 1.0f; 
for (int i = 0; i < 10; i++) { 
 guess = 0.5f * (guess + x / guess);
 }
return guess;
}

extern const float layer0_weights[INPUT_DIM * L0_OUT];
extern const float layer0_biases[L0_OUT];
extern const float layer1_weights[L0_OUT * L1_OUT];
extern const float layer1_biases[L1_OUT];
extern const float layer2_weights[L1_OUT * L2_OUT];
extern const float layer2_biases[L2_OUT];
extern const float layer3_weights[L2_OUT * L3_OUT];
extern const float layer3_biases[L3_OUT];
extern const float layer4_weights[L3_OUT * L4_OUT];
extern const float layer4_biases[L4_OUT];

// ---- BatchNorm params ----
extern const float bn0_gamma[L0_OUT], bn0_beta[L0_OUT], bn0_mean[L0_OUT], bn0_var[L0_OUT];
extern const float bn1_gamma[L1_OUT], bn1_beta[L1_OUT], bn1_mean[L1_OUT], bn1_var[L1_OUT];
extern const float bn2_gamma[L2_OUT], bn2_beta[L2_OUT], bn2_mean[L2_OUT], bn2_var[L2_OUT];
extern const float bn3_gamma[L3_OUT], bn3_beta[L3_OUT], bn3_mean[L3_OUT], bn3_var[L3_OUT];
extern const float bn0_eps, bn1_eps, bn2_eps, bn3_eps;


// ---- Aktivasyon ve Çekirdek Fonksiyonları aynı kalır ----
float relu(float x){ return x > 0.0f ? x : 0.0f; }
void dense_affine(const float *x, int in_dim,
                         const float *w, const float *b,
                         int out_dim, float *y)
{
#if USE_KERAS_LAYOUT
    // Keras: kernel[in_dim][out_dim]; y[o] = sum_i x[i] * w[i*out_dim + o] + b[o]
    for (int o = 0; o < out_dim; ++o) {
        float acc = b[o];
        for (int i = 0; i < in_dim; ++i)
            acc += x[i] * w[i * out_dim + o];
        y[o] = acc;
    }
#else
    // Transposed layout: w[out_dim][in_dim]; y[o] = sum_i w[o*in_dim + i]*x[i] + b[o]
    for (int o = 0; o < out_dim; ++o) {
        float acc = b[o];
        const float *wrow = &w[o * in_dim];
        for (int i = 0; i < in_dim; ++i)
            acc += wrow[i] * x[i];
        y[o] = acc;
    }
#endif
}
void bn_infer(const float *x, float *y, const float *gamma, const float *beta,
			  const float *mean, const float *var, float eps, int n)
{
	for (int i = 0; i < n; ++i) {
		float std = sqrtf_approx(var[i] + eps);
		y[i] = gamma[i] * ((x[i] - mean[i]) / std) + beta[i];
	}
}
void softmax_stable(const float *x, int n, float *y){
float max_val = x[0];
for (int i = 1; i < n; ++i) {
    if (x[i] > max_val) {
        max_val = x[i];
}
}
float sum = 0.0f;
for (int i = 0; i < n; ++i) {
y[i] = expf_approx(x[i] - max_val);
sum += y[i];
}
for (int i = 0; i < n; ++i) {
y[i] /= sum;
}
}

// -------------------------------------------------------------
// MODEL INFERENCE FUNCTION 
// -------------------------------------------------------------
int model_infer(const float *x)
{
float z0[L0_OUT], a0[L0_OUT], y0[L0_OUT]; // 256
float z1[L1_OUT], a1[L1_OUT], y1[L1_OUT]; // 128
float z2[L2_OUT], a2[L2_OUT], y2[L2_OUT]; // 64
float z3[L3_OUT], a3[L3_OUT], y3[L3_OUT]; // 32 
float logits[L4_OUT];// 5 
float out_probs[L4_OUT];
// L0: Dense (122->256) -> ReLU -> BN
dense_affine(x, INPUT_DIM, layer0_weights, layer0_biases, L0_OUT, z0);
for (int i=0;i<L0_OUT;++i) a0[i] = relu(z0[i]);
bn_infer(a0, y0, bn0_gamma, bn0_beta, bn0_mean, bn0_var, bn0_eps, L0_OUT);

// L1: Dense (256->128) -> ReLU -> BN
dense_affine(y0, L0_OUT, layer1_weights, layer1_biases, L1_OUT, z1);
for (int i=0;i<L1_OUT;++i) a1[i] = relu(z1[i]);
bn_infer(a1, y1, bn1_gamma, bn1_beta, bn1_mean, bn1_var, bn1_eps, L1_OUT);

// L2: Dense (128->64) -> ReLU -> BN
dense_affine(y1, L1_OUT, layer2_weights, layer2_biases, L2_OUT, z2);
for (int i=0;i<L2_OUT;++i) a2[i] = relu(z2[i]);
bn_infer(a2, y2, bn2_gamma, bn2_beta, bn2_mean, bn2_var, bn2_eps, L2_OUT);

// L3: Dense (64->32) -> ReLU -> BN 
dense_affine(y2, L2_OUT, layer3_weights, layer3_biases, L3_OUT, z3);
for (int i=0;i<L3_OUT;++i) a3[i] = relu(z3[i]);
bn_infer(a3, y3, bn3_gamma, bn3_beta, bn3_mean, bn3_var, bn3_eps, L3_OUT);

// L4: Dense (32->5) -> Softmax 
dense_affine(y3, L3_OUT, layer4_weights, layer4_biases, L4_OUT, logits);
softmax_stable(logits, L4_OUT, out_probs);

// Argmax (Tahmin)
int predicted = 0;
    float max_val = out_probs[0];
    for (int i = 1; i < 5; ++i) {
        if (out_probs[i] > max_val) {
            max_val = out_probs[i];
            predicted = i;
        }
    }

    return predicted;
}
// Total bytes to receive for one inference (122 * 4)
#define TOTAL_BYTES_TO_RECEIVE (INPUT_DIM * 4) // 488

// -------------------------------------------------------------
// MAIN FUNCTION
// -------------------------------------------------------------
int main() {
    // 1. Initialize Interrupts
    SET_MTVEC_VECTOR_MODE();
    count = 0;

    // 2. Define the hardcoded test vector (copied from your example)
    // This is only used for the *first* test run at boot.
    float input[INPUT_DIM] = { 0.000000f, 1.000000f, 0.000000f, 0.000000f, 
        0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 
        0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 
        0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 
        0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 
        0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 
        0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 
        0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 
        0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 
        1.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 
        0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 
        0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 
        0.000000f, 0.000000f, 0.000000f, 0.000000f, 1.000000f, 0.000000f, 
        0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 
        0.000000f, 0.000000f, -0.110249f, -0.007762f, -0.004919f, -0.014089f, 
        -0.089486f, -0.007736f, -0.095076f, -0.027023f, -0.809262f, -0.011664f, 
        -0.036652f, -0.024437f, -0.012385f, -0.026180f, -0.018610f, -0.041221f, 
        0.000000f, -0.002817f, -0.097531f, 1.265346f, -0.244204f, -0.637209f, 
        -0.631929f, 2.746403f, 2.715365f, -1.412415f, -0.016930f, -0.374560f, 
        0.734343f, -0.954389f, -1.071933f, -0.121485f, -0.480197f, -0.289103f, 
        -0.639532f, -0.624871f, 2.874410f, 2.753914f };

    
    // 3. Initialize UART
    uart_init(&uart0,(uint32_t *) 0x10008010);
    
    // 4. Run one inference on the hardcoded test vector and send the result
    volatile int result = model_infer(input);
    uart_transmit_byte(&uart0, (uint8_t) result);
    

    // 5. Enter the main loop to wait for data from Python
    while(1)
    {
        ENABLE_GLOBAL_IRQ();
        ENABLE_FAST_IRQ(0); // Enable UART interrupt
        
        // Wait until the ISR has received all 488 bytes
        while(count != TOTAL_BYTES_TO_RECEIVE) {
            continue;
        }
        
        // At this point, IRQ is disabled (by the ISR) and count is 488
        
        // *** FIX: Run inference on the 'input_array' (filled by ISR) ***
        result = model_infer(input_array);
        
        // Send the 1-byte prediction result back to Python
        uart_transmit_byte(&uart0, (uint8_t) result);
        
        // Reset the byte counter for the next image
        count = 0;
    }
    
    return 0;
}

// -------------------------------------------------------------
// INTERRUPT HANDLERS
// -------------------------------------------------------------

void mti_handler() {}
void exc_handler() {}
void mei_handler() {}
void msi_handler() {}

/**
 This ISR is called for every byte received from the UART.
 */
void fast_irq0_handler()
{
    // Read the byte from the UART's receive register
    char *rx_ptr = (char*)(uart0.base_addr) + UART_RX_ADDR_OFFSET;
    char rx_byte = *rx_ptr;
    
    // Reconstruct the float, byte by byte
    rx_var.bytes[count % 4] = rx_byte;

    // Write the float to the global array
    // (This writes 4 times, but the last write on bytes 3, 7, 11... is correct)
    input_array[count / 4] = rx_var.f;

    // Check if we are done
    if(count < TOTAL_BYTES_TO_RECEIVE) {
        // Not done, increment byte counter
        count++;
    } else {
        // This was the last byte (488th byte, count was 487).
        // count is now 488. Disable interrupts and return.
        // The main loop's `while(count != 488)` will now exit.
        DISABLE_GLOBAL_IRQ();
    }
}

void fast_irq1_handler() {}