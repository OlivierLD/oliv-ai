#
# Intro to Convolutional Neural Networks
#
# Video at https://www.youtube.com/watch?v=x_VrgWTKkiM
# Notebook at https://codelabs.developers.google.com/codelabs/tensorflow-lab3-convolutions/#0
#
# import tensorflow as tf
# import cv2
import numpy as np
from scipy import misc

image = misc.ascent()  # THIS is the image, 2 people ascending a starcase.

import matplotlib.pyplot as plt

plt.grid(False)
plt.gray()
plt.axis('off')
plt.imshow(image)
plt.show()

# Numpy Transformation
transformed_image = np.copy(image)
# Get image size
size_x = transformed_image.shape[0]
size_y = transformed_image.shape[1]

# First, make a convolution matrix (or kernel) as a 3x3 array:
# This filter detects edges nicely
# It creates a filter that only passes through sharp edges and straight lines.
# Experiment with different values for fun effects.
#   filter = [ [0, 1, 0], [1, -4, 1], [0, 1, 0]]
# A couple more filters to try for fun!
filter_1 = [[-1, -2, -1], [0, 0, 0], [1, 2, 1]]
filter_2 = [[-1, 0, 1], [-2, 0, 2], [-1, 0, 1]]
 # If all the digits in the filter don't add up to 0 or 1, you
# should probably do a weight to get it to do so
# so, for example, if your weights are 1,1,1 1,2,1 1,1,1
# They add up to 10, so you would set a weight of .1 if you want to normalize them
weight = 1


# And load the new values into the transformed image
def apply_filter(image, size_x, size_y, filter, weight, transformed_image):
    for x in range(1, size_x - 1):
        for y in range(1, size_y - 1):
            output_pixel = 0.0
            output_pixel = output_pixel + (image[x - 1, y - 1] * filter[0][0])
            output_pixel = output_pixel + (image[x, y - 1] * filter[0][1])
            output_pixel = output_pixel + (image[x + 1, y - 1] * filter[0][2])
            output_pixel = output_pixel + (image[x - 1, y] * filter[1][0])
            output_pixel = output_pixel + (image[x, y] * filter[1][1])
            output_pixel = output_pixel + (image[x + 1, y] * filter[1][2])
            output_pixel = output_pixel + (image[x - 1, y + 1] * filter[2][0])
            output_pixel = output_pixel + (image[x, y + 1] * filter[2][1])
            output_pixel = output_pixel + (image[x + 1, y + 1] * filter[2][2])
            output_pixel = output_pixel * weight
            if (output_pixel < 0):
                output_pixel = 0
            if (output_pixel > 255):
                output_pixel = 255
            transformed_image[x, y] = output_pixel

apply_filter(image, size_x, size_y, filter_1, weight, transformed_image)
# Plot the image. Note the size of the axes -- they are 512 by 512
plt.gray()
plt.grid(False)
plt.imshow(transformed_image)
#plt.axis('off')
plt.show()

apply_filter(image, size_x, size_y, filter_2, weight, transformed_image)
# Plot the image. Note the size of the axes -- they are 512 by 512
plt.gray()
plt.grid(False)
plt.imshow(transformed_image)
#plt.axis('off')
plt.show()

# Pooling
new_x = int(size_x / 2)
new_y = int(size_y / 2)
newImage = np.zeros((new_x, new_y))
for x in range(0, size_x, 2):
    for y in range(0, size_y, 2):
        pixels = []
        pixels.append(transformed_image[x, y])
        pixels.append(transformed_image[x + 1, y])
        pixels.append(transformed_image[x, y + 1])
        pixels.append(transformed_image[x + 1, y + 1])
        pixels.sort(reverse=True)
        newImage[int(x / 2), int(y / 2)] = pixels[0]

# Plot the image. Note the size of the axes -- now 256 pixels instead of 512
plt.gray()
plt.grid(False)
plt.imshow(newImage)
#plt.axis('off')
plt.show()


# Model, for later:
# model = tf.keras.models.Sequential([
#     tf.keras.layers.Conv2D(64,                        # Nb filters
#                            (3, 3),                    # Filters' size
#                            activation=tf.nn.relu,
#                            input_shape=(28, 28, 1)),  # Input shape
#     tf.keras.layers.MaxPooling2D(2, 2),
#     # Stack more CNN, to really break down th image
#     tf.keras.layers.Conv2D(64, (3, 3), activation=tf.nn.relu),
#     tf.keras.layers.MaxPooling2D(2, 2),
#
#     tf.keras.layers.Flatten(),    # No input shape, given by the previous layer(s)
#     tf.keras.layers.Dense(128, activation=tf.nn.relu),
#     tf.keras.layers.Dense(10, activation=tf.nn.softmax)
# ])
