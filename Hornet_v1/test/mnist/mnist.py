import numpy as np
import tensorflow as tf
from tensorflow.keras import layers, models
from tensorflow.keras.datasets import mnist
import tensorflow.image as tfi

# Load MNIST dataset and resize images to 14x14 using bilinear interpolation
(x_train, y_train), (x_test, y_test) = mnist.load_data()
x_train = tfi.resize(tf.expand_dims(x_train, -1), [14, 14]).numpy()
x_test = tfi.resize(tf.expand_dims(x_test, -1), [14, 14]).numpy()

# Normalize and flatten
x_train = x_train.astype(np.float32) / 255.0
x_test = x_test.astype(np.float32) / 255.0
x_train = x_train.reshape(-1, 14*14)
x_test = x_test.reshape(-1, 14*14)

# Define the model for detecting numbers
model = models.Sequential([
    layers.Input(shape=(14*14,)),
    layers.Dense(32, activation='relu'),
    layers.Dense(10, activation='softmax')
])

# Compile and train
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

model.fit(x_train, y_train, epochs=10, batch_size=128, validation_split=0.1)

# Evaluate the model
test_loss, test_acc = model.evaluate(x_test, y_test)
print("Test accuracy:", test_acc)

# Export weights to C (The path is with respect to main folder)
def export_to_c(model, filename="test/mnist/mlp_mnist1_weights.h"):
    with open(filename, "w") as f:
        for i, layer in enumerate(model.layers):
            if not layer.get_weights():
                continue
            weights, biases = layer.get_weights()
            f.write(f"// Layer {i} weights {weights.shape}\n")
            f.write(f"const float layer{i}_weights[{weights.shape[0]}][{weights.shape[1]}] = {{\n")
            for row in weights:
                f.write("  {" + ", ".join(f"{v:.8f}f" for v in row) + "},\n")
            f.write("};\n\n")
            f.write(f"const float layer{i}_biases[{biases.shape[0]}] = {{\n")
            f.write("  " + ", ".join(f"{v:.8f}f" for v in biases) + "\n};\n\n")

export_to_c(model)
