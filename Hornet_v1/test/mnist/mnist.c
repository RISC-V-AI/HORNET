#include <stdio.h>
#include <stdint.h>
// #include <math.h> // Good practice to include for floating point math

// --- PROJECT FILES ---
// 1. Your model's weights and biases
#include "mlp_mnist_weights.h"
// 2. The 100 test vectors we generated with the Python script
#include "mnist_test_vectors_100.h"

// NOTE: We do NOT include uart.h or irq.h because we are running on a PC,
// not the RISC-V hardware.

// --- YOUR EXACT MLP IMPLEMENTATION ---
// This code is copied directly from what you provided to ensure we are
// testing the exact same logic that runs on your RISC-V core.

#define INPUT_SIZE 196
#define HIDDEN_SIZE 32
#define OUTPUT_SIZE 10

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

// --- NEW MAIN FUNCTION FOR PC-BASED TESTING ---
int main() {
    printf("Starting local C test of mlp_infer() for 100 MNIST samples...\n\n");
    
    int correct_predictions = 0;
    const int num_samples = 100;

    // Loop through all 100 test images
    for (int i = 0; i < num_samples; ++i) {
        // Run your inference function on the current test image
        int predicted_digit = mlp_infer(test_images[i]);
        
        // Get the correct answer from our generated header file
        int true_digit = true_labels[i];
        
        // Check if the prediction was correct and print the result
        if (predicted_digit == true_digit) {
            correct_predictions++;
            // Optional: Print only fails to keep the output clean
            // printf("[Test %02d] True: %d, Predicted: %d -> PASS ✅\n", i, true_digit, predicted_digit);
        } else {
            printf("[Test %02d] True: %d, Predicted: %d -> FAIL ❌\n", i, true_digit, predicted_digit);
        }
    }

    // --- Print the final summary ---
    printf("\n----------------------\n");
    printf("     Test Summary\n");
    printf("----------------------\n");
    printf("Total Samples:   %d\n", num_samples);
    printf("Correct:         %d\n", correct_predictions);
    printf("Wrong:           %d\n", num_samples - correct_predictions);
    
    float accuracy = (float)correct_predictions / num_samples * 100.0f;
    printf("Accuracy:        %.2f%%\n", accuracy);
    printf("----------------------\n");

    return 0;
}




/*
//#include <stdio.h>
//#include <math.h>
#include "mlp_mnist_weights.h"
#include "input_image.h"
#include "uart.h"
#include "irq.h"
#include <stdint.h>

volatile int count;

typedef union {
    float f;           // 32-bit float
    uint8_t bytes[4];  // 4 individual bytes
} float_bytes_t;

volatile float input_array[196] = {0};
volatile float_bytes_t rx_var;

uart uart0;

#define INPUT_SIZE 196
#define HIDDEN_SIZE 32
#define OUTPUT_SIZE 10
#define DEBUG_IF_ADDR 0x10008010

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
    SET_MTVEC_VECTOR_MODE();
	count = 0;
    uart_init(&uart0,(uint32_t *) 0x10008010);
    volatile int result = mlp_infer(input_image);
    uart_transmit_byte(&uart0, (uint8_t) result);
    

    while(1)
    {
        ENABLE_GLOBAL_IRQ();
        ENABLE_FAST_IRQ(0);
        while(count!=784) continue;
        result = mlp_infer(input_array);
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

    input_array[count/4]=rx_var.f;

    if(count < 784) count++;
    else DISABLE_GLOBAL_IRQ();
}

void fast_irq1_handler() {}

*/