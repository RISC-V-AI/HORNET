#!/usr/bin/env python3
import numpy as np
from PIL import Image

# This script generates a C header file with the first 100 MNIST test vectors.

def load_mnist():
    """Returns (x_test, y_test) as numpy arrays."""
    try:
        from tensorflow.keras.datasets import mnist
        (_, _), (x_test, y_test) = mnist.load_data()
        return x_test, y_test
    except Exception as e:
        raise RuntimeError(
            "Failed to load MNIST. Please ensure TensorFlow is installed (`pip install tensorflow`)."
        ) from e

def get_float_vector(img28, normalize=True):
    """
    Processes a 28x28 image and returns a 1D NumPy vector of 196 floats.
    """
    pil_img = Image.fromarray(img28)
    pil_small = pil_img.resize((14, 14), resample=Image.BILINEAR)
    arr = np.asarray(pil_small, dtype=np.float32)
    if normalize:
        arr = arr / 255.0  # Scale to [0,1]
    return arr.reshape(-1).astype('<f4')

def main():
    NUM_SAMPLES = 100
    OUTPUT_FILENAME = "mnist_test_vectors_100.h"

    print("Loading MNIST dataset...")
    x_test, y_test = load_mnist()

    print(f"Generating C header file: {OUTPUT_FILENAME} for {NUM_SAMPLES} samples...")
    with open(OUTPUT_FILENAME, "w") as f:
        f.write("/*\n * MNIST Test Vectors for C (First 100 Samples)\n */\n\n")

        # 1. Write the array of correct labels
        f.write(f"const int true_labels[{NUM_SAMPLES}] = {{")
        labels_str = [str(y_test[i]) for i in range(NUM_SAMPLES)]
        f.write(", ".join(labels_str))
        f.write("};\n\n")

        # 2. Write the 2D array of image data
        f.write(f"const float test_images[{NUM_SAMPLES}][196] = {{\n")
        for i in range(NUM_SAMPLES):
            f.write(f"  // Test Case {i}: True Label = {y_test[i]}\n")
            f.write("  {\n    ")
            
            input_vector = get_float_vector(x_test[i], normalize=True)
            formatted_floats = [f"{val:.8f}f" for val in input_vector]
            f.write(", ".join(formatted_floats))
            
            f.write("\n  }")
            if i < NUM_SAMPLES - 1:
                f.write(",")
            f.write("\n")
        
        f.write("};\n")
    
    print(f"Done! Saved {NUM_SAMPLES} test vectors to {OUTPUT_FILENAME}.")

if __name__ == "__main__":
    main()