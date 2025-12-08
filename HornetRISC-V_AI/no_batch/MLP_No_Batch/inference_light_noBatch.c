#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

// Include the NEW folded header
#include "MLP_weights_folded.h" 

// ==============================================================================
// CONFIGURATION & CONSTANTS
// ==============================================================================
#define INPUT_DIM 122
#define L0_OUT    256 
#define L1_OUT    128 
#define L2_OUT    64  
#define L3_OUT    32  
#define L4_OUT    5   

// Set to 1 to use standard <math.h> (High precision)
// Set to 0 to use your FPGA approximations (Hardware realism)
#define USE_STD_MATH 0 

// ==============================================================================
// MATH FUNCTIONS (HARDWARE APPROXIMATIONS)
// ==============================================================================

// We NO LONGER need sqrtf_approx! BN is gone!

float expf_hard(float x) {
#if USE_STD_MATH
    return expf(x);
#else
    // Your Taylor series approx
    float result = 1.0f;
    float term = 1.0f;
    for (int n = 1; n <= 50; n++) {
        term *= x / n;
        result += term;
    }
    return result;
#endif
}

float relu(float x) { 
    return x > 0.0f ? x : 0.0f; 
}

void dense_affine(const float *x, int in_dim,
                  const float *w, const float *b,
                  int out_dim, float *y) {
    // Standard Matrix Multiplication
    for (int o = 0; o < out_dim; ++o) {
        float acc = b[o];
        for (int i = 0; i < in_dim; ++i) {
            // Note: Assuming Keras Layout (w[i * out_dim + o]) based on your previous code
            acc += x[i] * w[i * out_dim + o];
        }
        y[o] = acc;
    }
}

void softmax_stable(const float *x, int n, float *y) {
    float max_val = x[0];
    for (int i = 1; i < n; ++i) {
        if (x[i] > max_val) max_val = x[i];
    }
    
    float sum = 0.0f;
    for (int i = 0; i < n; ++i) {
        y[i] = expf_hard(x[i] - max_val);
        sum += y[i];
    }
    for (int i = 0; i < n; ++i) {
        y[i] /= sum;
    }
}

// ==============================================================================
// INFERENCE ENGINE (NO BATCH NORM!)
// ==============================================================================
int model_infer(const float *x) {
    // Buffers for intermediate layers
    float z0[L0_OUT];
    float z1[L1_OUT];
    float z2[L2_OUT];
    float z3[L3_OUT];
    float logits[L4_OUT];
    float out_probs[L4_OUT];

    // --- Layer 0: Folded Dense + ReLU ---
    // Notice: bn_infer is GONE.
    dense_affine(x, INPUT_DIM, layer0_weights, layer0_biases, L0_OUT, z0);
    for (int i = 0; i < L0_OUT; ++i) z0[i] = relu(z0[i]);

    // --- Layer 1: Folded Dense + ReLU ---
    dense_affine(z0, L0_OUT, layer1_weights, layer1_biases, L1_OUT, z1);
    for (int i = 0; i < L1_OUT; ++i) z1[i] = relu(z1[i]);

    // --- Layer 2: Folded Dense + ReLU ---
    dense_affine(z1, L1_OUT, layer2_weights, layer2_biases, L2_OUT, z2);
    for (int i = 0; i < L2_OUT; ++i) z2[i] = relu(z2[i]);

    // --- Layer 3: Folded Dense + ReLU ---
    dense_affine(z2, L2_OUT, layer3_weights, layer3_biases, L3_OUT, z3);
    for (int i = 0; i < L3_OUT; ++i) z3[i] = relu(z3[i]);

    // --- Layer 4: Output Dense + Softmax ---
    dense_affine(z3, L3_OUT, layer4_weights, layer4_biases, L4_OUT, logits);
    softmax_stable(logits, L4_OUT, out_probs);

    // Argmax
    int predicted = 0;
    float max_val = out_probs[0];
    for (int i = 1; i < L4_OUT; ++i) {
        if (out_probs[i] > max_val) {
            max_val = out_probs[i];
            predicted = i;
        }
    }
    return predicted;
}

// ==============================================================================
// FILE PARSING & METRICS
// ==============================================================================
void clean_line(char *line) {
    // Replaces '{', '}', ',', 'f', ';' with spaces to make parsing easy
    for (int i = 0; line[i]; i++) {
        if (line[i] == '{' || line[i] == '}' || line[i] == ',' || 
            line[i] == ';' || line[i] == 'f') {
            line[i] = ' ';
        }
    }
}

int main() {
    printf("--- MLP HARDWARE SIMULATION (GCC) ---\n");
    
    FILE *f_in = fopen("inputs.txt", "r");
    FILE *f_lbl = fopen("labels.txt", "r");
    FILE *f_out = fopen("label_results.txt", "w");

    if (!f_in || !f_lbl || !f_out) {
        printf("Error: Could not open input/output files.\n");
        return 1;
    }

    char line_buf[16384]; // Large buffer for one line of text
    float input_vec[INPUT_DIM];
    int total = 0, correct = 0;
    
    // Confusion Matrix [True][Pred]
    int conf_matrix[L4_OUT][L4_OUT] = {0};

    // --- Processing Loop ---
    while (fgets(line_buf, sizeof(line_buf), f_in)) {
        // 1. Parse Input Vector
        clean_line(line_buf);
        char *ptr = line_buf;
        for (int i = 0; i < INPUT_DIM; i++) {
            input_vec[i] = strtof(ptr, &ptr);
        }

        // 2. Parse True Label
        int true_label;
        if (fscanf(f_lbl, "%d", &true_label) != 1) break;

        // 3. Run Inference
        int pred_label = model_infer(input_vec);

        // 4. Save & Track Stats
        fprintf(f_out, "%d\n", pred_label);
        
        if (pred_label == true_label) correct++;
        if (true_label < L4_OUT && pred_label < L4_OUT) {
            conf_matrix[true_label][pred_label]++;
        }
        
        total++;
        if (total % 1000 == 0) printf("Processed %d samples...\r", total);
    }

    printf("\n\n--- RESULTS ---\n");
    printf("Total Samples: %d\n", total);
    printf("Accuracy: %.2f%%\n", (float)correct / total * 100.0f);

    // --- Calculate Macro F1 Score ---
    float macro_f1 = 0.0f;
    printf("\nClass-wise Metrics:\n");
    printf("Class | Precision | Recall | F1-Score\n");
    printf("------+-----------+--------+---------\n");

    for (int c = 0; c < L4_OUT; c++) {
        int TP = conf_matrix[c][c];
        int FP = 0;
        int FN = 0;

        for (int i = 0; i < L4_OUT; i++) {
            if (i != c) {
                FP += conf_matrix[i][c]; // Col sum excluding diag
                FN += conf_matrix[c][i]; // Row sum excluding diag
            }
        }

        float precision = (TP + FP) > 0 ? (float)TP / (TP + FP) : 0.0f;
        float recall = (TP + FN) > 0 ? (float)TP / (TP + FN) : 0.0f;
        float f1 = (precision + recall) > 0 ? 2 * (precision * recall) / (precision + recall) : 0.0f;
        
        macro_f1 += f1;
        printf("  %d   |   %.4f  | %.4f |  %.4f\n", c, precision, recall, f1);
    }

    printf("\nMacro F1 Score: %.4f\n", macro_f1 / L4_OUT);

    fclose(f_in);
    fclose(f_lbl);
    fclose(f_out);
    return 0;
}