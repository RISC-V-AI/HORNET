import numpy as np
from tensorflow.keras.datasets import mnist
from PIL import Image
import tensorflow as tf
import tensorflow.image as tfi

(_, _), (x_test, y_test) = mnist.load_data()

# Select one image (you can change index)
index = 4323
label = y_test[index]
image = x_test[index]

# Resize image to 14x14 using bilinear interpolation
image = image.astype(np.float32)
resized = tfi.resize(tf.expand_dims(image, axis=-1), [14, 14]).numpy().squeeze()

# Export as tif file
resized_uint8 = (resized * (255.0 / resized.max())).astype(np.uint8)
img = Image.fromarray(resized_uint8)
img.save("test/mnist/mnist_resized_14x14.tif", format="TIFF")

# Normalize to [0, 1]
resized = resized / 255.0
flattened = resized.flatten().astype(np.float32)

print(label)

# Export to C (The path is with respect to main folder)
with open("test/mnist/input_image.h", "w") as f:
    f.write("#ifndef INPUT_IMAGE_14X14_H\n#define INPUT_IMAGE_14X14_H\n\n")
    f.write("const int label = {};\n".format(label))
    f.write("const float input_image[196] = {\n")
    for i in range(196):
        f.write("  {:.8f}f".format(flattened[i]))
        if i < 195:
            f.write(",")
        if (i + 1) % 14 == 0:
            f.write("\n")
    f.write("};\n\n#endif\n")
