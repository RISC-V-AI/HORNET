#ifndef INFERENCE_LIGHT_H
#define INFERENCE_LIGHT_H

// Modelin girdi vektörünün boyutunu tanımlar.
// Bu sayede test verilerini oluşturan kod, doğru boyutta dizi oluşturabilir.
#define INPUT_DIM 122


int model_infer(const float *x);

#endif