# RISC-V Edge AI: Lightweight Intrusion Detection System (MLP)

This repository contains the Python scripts and data necessary to train a Multi-Layer Perceptron (MLP) for Intrusion Detection using the NSL-KDD dataset. The primary goal of this project is to extract the resulting trained weights and biases and format them for deployment on a resource-constrained **RISC-V-based hardware platform (HORNET)**.

The entire process, from data loading to parameter extraction, is handled by the `MLP_Focal_Loss.py` script.

---

## 📂 Repository Contents

| File Name | Description | Purpose in Project |
| :--- | :--- | :--- |
| `MLP_Focal_Loss.py` | **Main Python Script.** Handles data preprocessing, model training, evaluation, and C-style parameter extraction. | Model training and preparing data for hardware implementation. |
| `KDDTrain+.csv` | NSL-KDD Training Dataset. | Used for fitting the model and data normalization/scaling. |
| `KDDTest+.csv` | NSL-KDD Testing Dataset. | Used for final model evaluation and generating hardware inputs. |
| `inputs.txt` | **Generated Output.** Contains the entire pre-processed `KDDTest+.csv` dataset formatted as C-style float arrays. | Input test vectors for the RISC-V C simulator or Verilog testbench. |
| `labels.txt` | **Generated Output.** Contains the true numerical class labels for the samples in `inputs.txt`. | Ground truth for checking the accuracy of the hardware/C implementation. |

---

## 🧠 Model & Code Overview (`MLP_Focal_Loss.py`)

The Python script executes a full pipeline necessary for preparing an embedded AI model:

1.  **Data Loading & Label Grouping:** It loads the local `KDDTrain+.csv` and `KDDTest+.csv` files. It then groups the 42 unique network attack labels into 5 manageable categories: `Normal`, `DoS`, `Probe`, `R2L`, and `U2R`.
2.  **Preprocessing (One-Hot Encoding & Scaling):** The network features (e.g., protocol type, service, flag) are **One-Hot Encoded**, and all numerical features are **Standard Scaled** (Z-score normalization). Both the training and testing datasets are converted to dense NumPy arrays.
3.  **MLP Architecture:** A deep Multi-Layer Perceptron (MLP) model is defined using Keras, incorporating **Batch Normalization** and **Dropout** layers for stability and regularization.
4.  **Focal Loss Implementation:** Due to the severe class imbalance in the NSL-KDD dataset (especially the rare R2L and U2R attacks), the script uses a custom-defined **Focal Loss function**. This function focuses the learning process on the minority, hard-to-classify samples.
5.  **Parameter Extraction:** After training for 100 epochs, the script extracts all trained weights, biases, and Batch Normalization parameters (gamma, beta, mean, variance, epsilon). These values are printed to the console in a **C header file format (`const float array_name[] = {...}`)**, making them directly embeddable into the HORNET C implementation.
6.  **Simulation Files:** The script generates `inputs.txt` and `labels.txt` for comprehensive hardware simulation.

---

## ⚙️ Setup and Execution

### Prerequisites

You need Python 3.8+ and the following libraries installed:

```
pip3 install pandas numpy tensorflow matplotlib scikit-learn pydot
```

Download graphviz according to your operating system:
```
https://graphviz.gitlab.io/download/
```

### Running the Script
1. Place all five files (.py and four .csv files) in the same directory.

2. Execute the script from your terminal:

For Linux:
```
python3 ./MLP_Focal_Loss.py
```

For Windows:
```
python ./MLP_Focal_Loss.py
```

## Output
Upon completion, the script will:

- Print the Classification Report and Confusion Matrix.

- Display plots of the Accuracy and Loss history.

- Print a large text block of C-style parameters to the console, ready for inclusion in your RISC-V C or Verilog project headers.

- Generate the `inputs.txt` and `labels.txt` files in the current directory.