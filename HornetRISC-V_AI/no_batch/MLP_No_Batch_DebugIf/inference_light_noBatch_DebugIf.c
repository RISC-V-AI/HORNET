// ---- config: choose how your Dense weights are laid out ----
#ifndef USE_KERAS_LAYOUT
#define USE_KERAS_LAYOUT 1
#endif

// CRITICAL: Include the NEW folded header. 
// This file must be in the same directory.
#include "MLP_weights_folded.h" 

#define DEBUG_IF_ADDR 0x10008010 

// Dimensions
#define INPUT_DIM 122
#define L0_OUT    256 
#define L1_OUT    128 
#define L2_OUT    64  
#define L3_OUT    32  
#define L4_OUT    5   

// Helper: Simple ReLU
float relu(float x){ return x > 0.0f ? x : 0.0f; }

// Helper: Matrix Multiplication (Affine)
void dense_affine(const float *x, int in_dim,
                  const float *w, const float *b,
                  int out_dim, float *y)
{
#if USE_KERAS_LAYOUT
    // Keras Layout: w[in_dim][out_dim]
    // y[o] = sum(x[i] * w[i][o]) + b[o]
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

// -------------------------------------------------------------
// OPTIMIZED INFERENCE FUNCTION 
// (No BN, No Softmax, No Exp/Sqrt/Div)
// -------------------------------------------------------------
int model_infer(const float *x)
{
    // Buffers
    float z0[L0_OUT];
    float z1[L1_OUT];
    float z2[L2_OUT];
    float z3[L3_OUT];
    float logits[L4_OUT];
    
    // --- Layer 0: Folded Dense -> ReLU ---
    dense_affine(x, INPUT_DIM, layer0_weights, layer0_biases, L0_OUT, z0);
    for (int i=0; i<L0_OUT; ++i) z0[i] = relu(z0[i]);

    // --- Layer 1: Folded Dense -> ReLU ---
    dense_affine(z0, L0_OUT, layer1_weights, layer1_biases, L1_OUT, z1);
    for (int i=0; i<L1_OUT; ++i) z1[i] = relu(z1[i]);

    // --- Layer 2: Folded Dense -> ReLU ---
    dense_affine(z1, L1_OUT, layer2_weights, layer2_biases, L2_OUT, z2);
    for (int i=0; i<L2_OUT; ++i) z2[i] = relu(z2[i]);

    // --- Layer 3: Folded Dense -> ReLU ---
    dense_affine(z2, L2_OUT, layer3_weights, layer3_biases, L3_OUT, z3);
    for (int i=0; i<L3_OUT; ++i) z3[i] = relu(z3[i]);

    // --- Layer 4: Output Dense (Logits) ---
    // Note: No ReLU here, No Softmax needed for Argmax
    dense_affine(z3, L3_OUT, layer4_weights, layer4_biases, L4_OUT, logits);

    // --- Argmax ---
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

// -------------------------------------------------------------
// MAIN
// -------------------------------------------------------------
int main() {
    // Hardcoded input for Class 0 (from your previous snippet)
    volatile float input[INPUT_DIM] = { 
        0.000000f, 1.000000f, 0.000000f, 0.000000f, 0.000000f, 
        0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 
        0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 
        0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 
        0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 
        0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 
        0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 1.000000f, 
        0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 
        0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 
        0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 1.000000f, 0.000000f, 0.000000f, 
        0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, -0.110249f, 
        -0.007762f, -0.004919f, -0.014089f, -0.089486f, -0.007736f, -0.095076f, -0.027023f, -0.809262f, 
        -0.011664f, -0.036652f, -0.024437f, -0.012385f, -0.026180f, -0.018610f, -0.041221f, 0.000000f, 
        -0.002817f, -0.097531f, 1.265346f, -0.244204f, -0.637209f, -0.631929f, 2.746403f, 2.715365f, 
        -1.412415f, -0.016930f, -0.374560f, 0.734343f, -0.954389f, -1.071933f, -0.121485f, -0.480197f, 
        -0.289103f, -0.639532f, -0.624871f, 2.874410f, 2.753914f 
    };

    int result;
    result = model_infer(input);    
    
    char *addr_ptr = (char*)DEBUG_IF_ADDR; 
    
    // Class 0 is expected
    if(result == 0) *addr_ptr = 1; // Success
    else *addr_ptr = 31;           // Fail
        
    return 0;
}