//#include <stdio.h>
//#include <math.h>
#include "mlp_mnist_weights.h"
#include "input_image.h"

#define INPUT_SIZE 196
#define HIDDEN_SIZE 32
#define OUTPUT_SIZE 10
#define DEBUG_IF_ADDR 0x00008010

float expf_approx(float x) {
    float result = 1.0f;
    float term = 1.0f;
    int n;

    for (n = 1; n <= 50; n++) {
        term *= x / n;
        result += term;
    }

    return result;
}

float relu(float x) {
    return x > 0 ? x : 0;
}

void softmax(const float* input, float* output, int size) {
    float max_val = input[0];
    for (int i = 1; i < size; ++i) {
        if (input[i] > max_val) max_val = input[i];
    }

    float sum = 0.0f;
    for (int i = 0; i < size; ++i) {
        output[i] = expf_approx(input[i] - max_val);
        sum += output[i];
    }
    for (int i = 0; i < size; ++i) {
        output[i] /= sum;
    }
}

void dense_relu(const float* input, float* output,
                const float weights[][HIDDEN_SIZE], const float* biases,
                int in_size, int out_size) {
    for (int i = 0; i < out_size; ++i) {
        float acc = biases[i];
        for (int j = 0; j < in_size; ++j) {
            acc += input[j] * weights[j][i];
        }
        output[i] = relu(acc);
    }
}

void dense_softmax(const float* input, float* output,
                   const float weights[][OUTPUT_SIZE], const float* biases,
                   int in_size, int out_size) {
    float logits[OUTPUT_SIZE];
    for (int i = 0; i < out_size; ++i) {
        float acc = biases[i];
        for (int j = 0; j < in_size; ++j) {
            acc += input[j] * weights[j][i];
        }
        logits[i] = acc;
    }
    softmax(logits, output, out_size);
}

int mlp_infer(const float input[INPUT_SIZE]) {
    float hidden[HIDDEN_SIZE];
    float output[OUTPUT_SIZE];

    dense_relu(input, hidden, layer0_weights, layer0_biases, INPUT_SIZE, HIDDEN_SIZE);
    dense_softmax(hidden, output, layer1_weights, layer1_biases, HIDDEN_SIZE, OUTPUT_SIZE);

    int predicted = 0;
    float max_val = output[0];
    for (int i = 1; i < OUTPUT_SIZE; ++i) {
        if (output[i] > max_val) {
            max_val = output[i];
            predicted = i;
        }
    }

    return predicted;
}

int main() {
    volatile int result = mlp_infer(input_image);
    char *addr_ptr = (char*)DEBUG_IF_ADDR;
    if (result == label) *addr_ptr = 1;
    else *addr_ptr = 0;
    
    // printf("Predicted digit: %d\n", result);
    return 0;
}
