// ---- config: choose how your Dense weights are laid out ----
// If you dumped Keras tensors directly (shape [in_dim, out_dim] flattened), USE_KERAS_LAYOUT = 1.
// If you transposed to [out_dim, in_dim], set to 0.
#ifndef USE_KERAS_LAYOUT
#define USE_KERAS_LAYOUT 1
#endif

// #include <math.h>
 #include <stdio.h>
 #include <stdlib.h>
#include "MLP_weightsBN.h"

#define DEBUG_IF_ADDR 0x10008010

// dims
#define INPUT_DIM 122
#define L0_OUT    512
#define L1_OUT    256
#define L2_OUT    128
#define L3_OUT    64
#define L4_OUT    5

// ---- Approximate expf ----
// Maclaurin expansion with 50 terms
float expf_approx(float x) {
    float result = 1.0f;
    float term = 1.0f;
    for (int n = 1; n <= 50; n++) {
        term *= x / n;
        result += term;
    }
    return result;
}

// ---- Approximate sqrtf ----
// Newton–Raphson iteration
  float sqrtf_approx(float x) {
    if (x <= 0.0f) return 0.0f;
    float guess = x > 1.0f ? x : 1.0f;   // initial guess
    for (int i = 0; i < 10; i++) {       // ~10 iterations
        guess = 0.5f * (guess + x / guess);
    }
    return guess;
}


// ---- Dense params (y = W^T x + b if using Keras layout) ----
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

// ---- BatchNorm params for layers AFTER ReLU on layers 0..3 ----
// y = gamma * (x - mean) / sqrt(var + eps) + beta
extern const float bn0_gamma[L0_OUT], bn0_beta[L0_OUT], bn0_mean[L0_OUT], bn0_var[L0_OUT];
extern const float bn1_gamma[L1_OUT], bn1_beta[L1_OUT], bn1_mean[L1_OUT], bn1_var[L1_OUT];
extern const float bn2_gamma[L2_OUT], bn2_beta[L2_OUT], bn2_mean[L2_OUT], bn2_var[L2_OUT];
extern const float bn3_gamma[L3_OUT], bn3_beta[L3_OUT], bn3_mean[L3_OUT], bn3_var[L3_OUT];
// If each BN has its own epsilon, expose them; otherwise use a common 1e-3/1e-5 as trained.
extern const float bn0_eps, bn1_eps, bn2_eps, bn3_eps;

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

 void bn_infer(const float *x, float *y,
                     const float *gamma, const float *beta,
                     const float *mean, const float *var,
                     float eps, int n)
{
    for (int i = 0; i < n; ++i) {
        float invstd = 1.0f / sqrtf_approx(var[i] + eps);
        y[i] = gamma[i] * (x[i] - mean[i]) * invstd + beta[i];
    }
}

 void softmax_stable(const float *x, int n, float *y){
    float m = -__FLT_MAX__;
    for (int i=0;i<n;++i) if (x[i] > m) m = x[i];
    float sum = 0.0f;
    for (int i=0;i<n;++i){ y[i] = expf_approx(x[i]-m); sum += y[i]; }
    float inv = 1.0f / (sum > 0.0f ? sum : 1.0f);
    for (int i=0;i<n;++i) y[i] *= inv;
}

int model_infer(const float *x)
{
    float *addr_ptr = (float*)DEBUG_IF_ADDR;

    float z0[L0_OUT], a0[L0_OUT], y0[L0_OUT];
    float z1[L1_OUT], a1[L1_OUT], y1[L1_OUT];
    float z2[L2_OUT], a2[L2_OUT], y2[L2_OUT];
    float z3[L3_OUT], a3[L3_OUT], y3[L3_OUT];
    float logits[L4_OUT];
    float out_probs[L4_OUT];

    // L0: Dense -> ReLU -> BN -> (Dropout no-op)
    dense_affine(x, INPUT_DIM, layer0_weights, layer0_biases, L0_OUT, z0);
    for (int i=0;i<L0_OUT;++i) a0[i] = relu(z0[i]);
    bn_infer(a0, y0, bn0_gamma, bn0_beta, bn0_mean, bn0_var, bn0_eps, L0_OUT);
    // printf("Layer0 y0[0]: %f \n", y0[0]);
    // *addr_ptr = y0[0];

    // L1
    dense_affine(y0, L0_OUT, layer1_weights, layer1_biases, L1_OUT, z1);
    for (int i=0;i<L1_OUT;++i) a1[i] = relu(z1[i]);
    bn_infer(a1, y1, bn1_gamma, bn1_beta, bn1_mean, bn1_var, bn1_eps, L1_OUT);
    // printf("Layer1 y1[0]: %f \n", y1[0]);
    // *addr_ptr = y1[0];
    

    // L2
    dense_affine(y1, L1_OUT, layer2_weights, layer2_biases, L2_OUT, z2);
    for (int i=0;i<L2_OUT;++i) a2[i] = relu(z2[i]);
    bn_infer(a2, y2, bn2_gamma, bn2_beta, bn2_mean, bn2_var, bn2_eps, L2_OUT);
    // printf("Layer2 y2[0]: %f \n", y2[0]);
    // *addr_ptr = y2[0];

    // L3
    dense_affine(y2, L2_OUT, layer3_weights, layer3_biases, L3_OUT, z3);
    for (int i=0;i<L3_OUT;++i) a3[i] = relu(z3[i]);
    bn_infer(a3, y3, bn3_gamma, bn3_beta, bn3_mean, bn3_var, bn3_eps, L3_OUT);
    // printf("Layer3 y3[0]: %f \n", y3[0]);
    // *addr_ptr = y3[0];

    // L4: Dense -> Softmax
    dense_affine(y3, L3_OUT, layer4_weights, layer4_biases, L4_OUT, logits);
    softmax_stable(logits, L4_OUT, out_probs);
    // printf("Layer4 out_probs[0]: %f \n", out_probs[0]);
    // *addr_ptr = out_probs[0];

    // printf("%f, %f, %f, %f, %f\n", out_probs[0], out_probs[1], out_probs[2], out_probs[3], out_probs[4]);

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

int main() {
    FILE *fin = fopen("inputs.txt", "r");
    FILE *fout = fopen("label_results.txt", "w");
    if (!fin || !fout) {
        printf("Dosya acilamadi!\n");
        return 1;
    }

    float x[INPUT_DIM];
    int sample = 0;

    while (1) {
        // inputs.txt her satır: { ... } formatında
        // Önce "{" atla
        if (fscanf(fin, " {") != 0) {
            break; // dosya sonu
        }

        for (int i = 0; i < INPUT_DIM; i++) {
            if (fscanf(fin, " %ff", &x[i]) != 1) {
                fclose(fin);
                fclose(fout);
                return 0;
            }
            if (i < INPUT_DIM - 1) {
                fscanf(fin, " ,"); // virgülü atla
            }
        }

        // "};" kısmını atla
        fscanf(fin, " };");

        int pred = model_infer(x);
        fprintf(fout, "%d\n", pred);

        sample++;
        if (sample % 1000 == 0) {
            printf("%d örnek işlendi...\n", sample);
        }
    }

    fclose(fin);
    fclose(fout);

    printf("Toplam %d örnek işlendi, sonuçlar label_results.txt dosyasina yazildi.\n", sample);

    return 0;
}

/*
int main(){
    
    
    // Normal Attack --> Expected Result = 4
    const float input_data_normal[122] = {
0.000000f, 1.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 1.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 1.000000f, 0.000000f, -0.109481f, -0.005551f, -0.004919f, -0.014089f, -0.089486f, -0.007736f, -0.095076f, -0.027023f, -0.809262f, -0.011664f, -0.036652f, -0.024437f, -0.012385f, -0.026180f, -0.018610f, -0.041221f, 0.000000f, -0.002817f, -0.097531f, -0.725778f, -0.368110f, -0.637209f, -0.631929f, -0.374362f, -0.374432f, 0.771283f, -0.349683f, -0.374560f, -0.485344f, -0.267863f, 0.197703f, -0.227350f, 1.493939f, -0.111426f, -0.639532f, -0.624871f, -0.387635f, -0.376387f
};
    // DoS Attack --> Expected Result = 0
    const float input_data_DoS[122] = {
0.000000f, 1.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 1.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 1.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, -0.110249f, -0.007762f, -0.004919f, -0.014089f, -0.089486f, -0.007736f, -0.095076f, -0.027023f, -0.809262f, -0.011664f, -0.036652f, -0.024437f, -0.012385f, -0.026180f, -0.018610f, -0.041221f, 0.000000f, -0.002817f, -0.097531f, 1.265346f, -0.244204f, -0.637209f, -0.631929f, 2.746403f, 2.715365f, -1.412415f, -0.016930f, -0.374560f, 0.734343f, -0.954389f, -1.071933f, -0.121485f, -0.480197f, -0.289103f, -0.639532f, -0.624871f, 2.874410f, 2.753914f
};

    // Probe Attack --> Expected Result = 1
    const float input_data_Probe[122] = {
1.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 1.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 1.000000f, 0.000000f, -0.110249f, -0.007759f, -0.004919f, -0.014089f, -0.089486f, -0.007736f, -0.095076f, -0.027023f, -0.809262f, -0.011664f, -0.036652f, -0.024437f, -0.012385f, -0.026180f, -0.018610f, -0.041221f, 0.000000f, -0.002817f, -0.097531f, -0.725778f, 0.513001f, -0.637209f, -0.631929f, -0.374362f, -0.374432f, 0.771283f, -0.349683f, 3.474118f, -1.805831f, -0.529826f, 1.066401f, -0.439078f, 2.756092f, 2.198385f, -0.639532f, -0.624871f, -0.387635f, -0.376387f
};
    // R2L Attack --> Expected Result = 2
    const float input_data_R2L[122] = {
0.000000f, 1.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 1.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 1.000000f, 0.000000f, -0.110249f, -0.007758f, -0.004880f, -0.014089f, -0.089486f, -0.007736f, -0.095076f, 22.077818f, -0.809262f, -0.011664f, -0.036652f, -0.024437f, -0.012385f, -0.026180f, -0.018610f, -0.041221f, 0.000000f, -0.002817f, 10.253156f, -0.725778f, -0.368110f, -0.637209f, -0.631929f, -0.374362f, -0.374432f, 0.771283f, -0.349683f, -0.374560f, -1.090147f, -0.665325f, 0.108606f, -0.174417f, -0.447834f, -0.289103f, -0.639532f, -0.624871f, -0.387635f, -0.376387f
};

    // U2R Attack --> Expected Result = 3
    const float input_data_U2R[122] = {
0.000000f, 1.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 1.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 0.000000f, 1.000000f, 0.000000f, -0.107178f, -0.007725f, -0.004748f, -0.014089f, -0.089486f, -0.007736f, 1.765424f, -0.027023f, 1.235694f, -0.011664f, -0.036652f, -0.024437f, -0.012385f, 8.239424f, -0.018610f, -0.041221f, 0.000000f, -0.002817f, -0.097531f, -0.725778f, -0.368110f, -0.637209f, -0.631929f, -0.374362f, -0.374432f, 0.771283f, -0.349683f, -0.374560f, -1.301828f, -0.800824f, -0.025040f, -0.015621f, -0.415471f, -0.289103f, -0.639532f, -0.624871f, -0.387635f, -0.376387f};
    
    /*
    for(int i=0;i<5;++i) {
        if (output_data[i] > output_data[max]) max = i;
    }
        
    
        volatile int result_normal = model_infer(input_data_normal);
        volatile int result_DoS = model_infer(input_data_DoS);
        volatile int result_Probe = model_infer(input_data_Probe);
        volatile int result_R2L = model_infer(input_data_R2L);
        volatile int result_U2R = model_infer(input_data_U2R);

        printf("Predicted digit for normal: %d\n", result_normal);
        printf("Predicted digit for DoS: %d\n", result_DoS);
        printf("Predicted digit for Probe: %d\n", result_Probe);
        printf("Predicted digit for R2L: %d\n", result_R2L);
        printf("Predicted digit for U2R: %d\n", result_U2R);

     /*   
     char *addr_ptr = (char*)DEBUG_IF_ADDR;
     if (result_normal == 4 && result_DoS == 0 && result_Probe == 1 && result_R2L == 2 && result_U2R == 3) *addr_ptr = 15;
     else *addr_ptr = 255;
    


    // printf("Predicted digit: %d\n", result);
    return 0;
      //*addr_ptr = 1; // output_data[0];
      //   *addr_ptr = output_data[0]; // output_data[0];

       
}
*/

