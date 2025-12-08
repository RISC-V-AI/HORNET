# HornetRISC-V AI: Edge Intelligence on FPGA

This repository hosts the complete ecosystem for deploying Neural Networks on the **HORNET RISC-V** soft-core processor. It covers the full lifecycle of Edge AI development: from training models in Python to simulating firmware in C, and finally deploying hardware-accelerated inference on Xilinx FPGAs.

## 📂 Repository Structure

The repository is organized into four main modules. Please refer to the specific **README** inside each folder for detailed usage instructions.

| Directory | Description |
| :--- | :--- |
| **`Python_Codes/`** | **Model Training & Extraction.** Contains scripts to train the MLP on the NSL-KDD dataset using TensorFlow/Keras. Includes logic to extract weights and generate C headers for the standard implementation. |
| **`no_batch/`** | **🚀 Optimized Hardware Implementation.** A specialized directory for "Batch Normalization Folding." It contains the Jupyter Notebooks, C firmware, and FPGA build systems for the optimized, lightweight version of the model that removes the need for complex hardware math (sqrt/div). |
| **`source/`** | **Standard Firmware & RTL.** The baseline C source code, linker scripts, and Makefiles for building the RISC-V firmware (ELF/BIN) and generating memory initialization files. Includes both Barebones (Simulation) and FPGA-Ready (UART/IRQ) workflows. |
| **`test/`** | **Hardware-in-the-Loop (HIL) Suite.** Python scripts for verifying the FPGA deployment. Sends test vectors via UART, captures FPGA predictions, and verifies accuracy against ground truth. |

---

## 🚀 Quick Start Guide

1.  **Train:** Go to `Python_Codes/` or `no_batch/` to train your model and generate the `weights.h` header file. (This part is not necessary unless you want to implement your own model)
2.  **Build Firmware:** Use the Makefiles in `source/` (or `no_batch/MLP_No_Batch_FPGA`, and `no_batch/MLP_No_Batch_DebugIf` ) to compile your C code into a `.mem` file.
3.  **Synthesize:** Use the generated `.mem` file in your Vivado project to initialize the Hornet BRAM.
4.  **Test:** Use the scripts in `test/` to stream data to the running FPGA and validate performance.