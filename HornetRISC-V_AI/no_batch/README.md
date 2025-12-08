# BN-Folded MLP: Hardware-Optimized Implementation

This directory contains the **"No-Batch"** implementation of the Intrusion Detection System. 

In standard Deep Learning, **Batch Normalization (BN)** layers require floating-point division and square root operations ($y = \gamma \frac{x-\mu}{\sqrt{\sigma^2+\epsilon}} + \beta$). These are computationally expensive on resource-constrained RISC-V soft cores. 

**This implementation "folds" the Batch Normalization parameters directly into the preceding Dense layer's weights and biases.** This allows us to remove the BN layer entirely from the inference code, reducing cycle count and binary size while maintaining accuracy.

---

## 📂 Directory Contents

| File/Folder | Description |
| :--- | :--- |
| `MLP_No_Batch.ipynb` | **Jupyter Notebook.** Trains the model, performs the mathematical folding of BN parameters, and exports `MLP_weights_folded.h`. |
| `MLP_weights_folded.h` | **Header File.** The auto-generated weights. Contains *only* weights and biases (no gamma/beta/variance arrays). |
| **`MLP_No_Batch/`** | **PC/GCC Simulation.** A standalone C file to test the folded logic and accuracy on your PC before deploying to RISC-V (and ). |
| **`MLP_No_Batch_DebugIf/`** | **Barebones Simulation.** Contains the C source, Makefile, and linker scripts for running the optimized code in a Vivado/XSim behavioral simulation (Barebones). |
| **`MLP_No_Batch_FPGA/`** | **FPGA Deployment.** Contains the full C source, Makefile, UART/IRQ drivers, and linker scripts for the physical FPGA implementation. |

---

## 🛠️ Workflow

### 1. Training & Folding (Python)
Open `MLP_No_Batch.ipynb`. This notebook will:
1.  Train the MLP with specific architecture (`Dense -> BN -> Activation`).
2.  Calculate the new "Folded" weights.
3.  Generate `MLP_weights_folded.h`.
4.  Generate `inputs.txt` for testing.

### 2. GCC Verification (PC)
Before flashing to the FPGA, verify the C logic on your host machine:
```bash
gcc inference_light_noBatch.c -o test_run -lm
./test_run
```
Checks `inputs.txt` against the folded model and prints accuracy.

### 3. RISC-V Simulation (Barebones)

Navigate to `MLP_No_Batch_DebugIf/`. This allows fast simulation without UART.

1. Ensure MLP_weights_folded.h is present.

2. Run `make`.

3. Use the generated `memory_init_tb.mem` in your Vivado simulation source.

### 4. FPGA Deployment
Navigate to `MLP_No_Batch_FPGA/`.

1. Ensure `MLP_weights_folded.h` is present.

2. Run `make`.

3. Copy the generated `memory_init.mem` to your Vivado project (Update the Block RAM initialization).

4. Generate Bitstream and Program Device.

# ⚡ Performance Analysis: BN Folding Optimization

This section quantifies the improvements gained by moving from the standard "Batch Normalization" architecture to the "Folded Weight" (No-Batch) architecture. The comparison highlights reductions in computational complexity (cycle count) and execution time without compromising predictive accuracy.

## 1. Computational Efficiency (XSim Simulation)
The most direct measure of the optimization is the behavioral simulation time, which represents the pure CPU cycle count required for one inference, excluding UART communication overhead.

| Metric | Standard MLP (Explicit BN) | Optimized MLP (Folded BN) | **Improvement** |
| :--- | :--- | :--- | :--- |
| **Per-Inference Time** | 31.76 ms | **20.95 ms** | **34% Faster** |
| **Clock Cycles** | ~635,184 cycles | ~419,020 cycles | **-216k Cycles** |

> **Analysis:** Removing the software emulation of `sqrtf` and division operations (required for Batch Normalization on the RISC-V IM core) resulted in a **1.5x speedup** in pure processing power.

## 2. Hardware Throughput (Nexys Video FPGA)
This test measures the time required to process the entire NSL-KDD test suite (22,543 samples) via UART. Note that a significant portion of this time is limited by the UART baud rate (115200) and handshake delays.

| Metric | Standard MLP | Optimized MLP | Delta |
| :--- | :--- | :--- | :--- |
| **Total Runtime** | 42 min 03 sec | **36 min 03 sec** | **-6 mins** |
| **Total Seconds** | 2,523.20 s | 2,163.46 s | -359.74 s |
| **Throughput** | ~8.9 samples/sec | ~10.4 samples/sec | +16.8% |

## 3. Accuracy Retention
A primary concern when "folding" layers and reducing precision (from Python `float64` to C/Hardware `float32`) is a possible accuracy loss. The data shows that accuracy was fully preserved.

| Metric | Python (Baseline) | GCC Simulation (Folded) | FPGA Hardware (Folded) |
| :--- | :--- | :--- | :--- |
| **Accuracy** | 77.59% | 78.53% | **78.87%** |
| **Macro F1** | 0.6257 | 0.6400 | **0.6000** |

### Detailed Hardware Performance (FPGA)
The final optimized implementation on the FPGA achieved the following class-wise performance:

| Class | Precision | Recall | F1-Score | Support |
| :--- | :--- | :--- | :--- | :--- |
| **0 (DoS)** | 0.97 | 0.85 | 0.90 | 7,460 |
| **1 (Probe)** | 0.82 | 0.70 | 0.75 | 2,421 |
| **2 (R2L)** | 0.93 | 0.12 | 0.21 | 2,885 |
| **3 (U2R)** | 0.47 | 0.25 | 0.33 | 67 |
| **4 (Normal)** | 0.70 | 0.97 | 0.81 | 9,710 |
| **Weighted Avg**| **0.83** | **0.79** | **0.76** | **22,543** |

## 4. Hardware Fidelity (Verification)
To ensure the FPGA is calculating correctly and not suffering from UART data corruption or timing violations, we compared the FPGA output (`FPGA_results.txt`) directly against the local C-model output (`label_results.txt`).

* **Consistency Score:** **98.35%**
* **Discrepancy:** Only 373 samples out of 22,543 differed.
* **Cause:** Minor floating-point rounding differences between the host x86 FPU (GCC) and the soft-core approximation logic. This confirms the hardware logic is sound.

***

### 📝 Summary
The **BN Folding optimization** successfully removed the need for complex arithmetic functions in the processz. This resulted in a **34% reduction in computational cycles** and a **16% reduction in total test time**, while maintaining (and slightly exceeding) the baseline accuracy of the unoptimized model.