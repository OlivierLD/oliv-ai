# -*- coding: utf-8 -*-
"""TinyML.Chapter.4

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1Gx5NVHlv4vJsNUGtCAdEHuqzN2mXY-x9

## TinyML, Chapter 4
"""

# Install TensorFLow
# !pip install tensorflow==2.2.0
#
import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt
import math
import time
#

print("TensorFlow version", tf.__version__)

"""## Generating sample data"""

# Generate sample datapoints
SAMPLES = 1000
SEED = 1337

np.random.seed(SEED)
tf.random.set_seed(SEED)

# Generate a uniformly distributed set of random numbers in the range from
# 0 to 2n, wich covers a complete sine wave oscillation
x_values = np.random.uniform(low=0, high=2*math.pi, size=SAMPLES)

# Shuffle the values to garantee they're not in order
np.random.shuffle(x_values)

# Calculate the corresponding sine values
y_values = np.sin(x_values)

# Plot the data, with blue dots.
plt.plot(x_values, y_values, 'b.')
plt.show()

# Add small randomness...
y_values += 0.1 * np.random.randn(*y_values.shape)

# Re-plot (4-10)
plt.plot(x_values, y_values, 'r.')
plt.show()

TRAIN_SPLIT = int(0.6 * SAMPLES)
TEST_SPLIT = int((0.2 * SAMPLES) + TRAIN_SPLIT)

print(TEST_SPLIT)

x_train, x_validate, x_test = np.split(x_values, [TRAIN_SPLIT, TEST_SPLIT])
y_train, y_validate, y_test = np.split(y_values, [TRAIN_SPLIT, TEST_SPLIT])

assert (x_train.size + x_validate.size + x_test.size) == SAMPLES
#
print("Train     : {} element(s)".format(x_train.size))
print("Validation: {} element(s)".format(x_validate.size))
print("Test      : {} element(s)".format(x_test.size))

"""Plot each data in a different color"""

plt.plot(x_train, y_train, 'b.', label="Train")
plt.plot(x_validate, y_validate, 'y.', label="Validate")
plt.plot(x_test, y_test, 'r.', label="Test")
plt.legend()
plt.show()

"""### Now defining a Basic Model"""

# Using Keras
# import tensorflow as tf
print("Reminder TF version:", tf.__version__)
#
from tensorflow.keras import layers
# from tensorflow import keras
print("Keras version:", tf.keras.__version__)
# from keras import layers
model_1 = tf.keras.models.Sequential(name="FirstModel")
#

"""##### First layer takes a scalar input and feeds it into 16 neurons.
Activation is based on **relu** activation function.

Nice Activation Functions summary [here](https://en.wikipedia.org/wiki/Activation_function#Comparison_of_activation_functions).
"""

model_1.add(layers.Dense(16, activation='relu', input_shape=(1,)))

"""Final layer is a single neuron using a standard optimizer and loss function for regression"""

model_1.add(layers.Dense(1))

# Compile
model_1.compile(optimizer='rmsprop', loss='mse', metrics=['mae'])
# Print model's architecture
model_1.summary()
#

"""## Training the Model"""

verb = 0 # 1 is the default. Verbose option takes time.
before = time.time()
history_1 = model_1.fit(x_train, y_train, verbose=verb, epochs=1000, batch_size=16, validation_data=(x_validate, y_validate))
after = time.time()
print("Model fit executed in {:.3f} seconds".format(after - before))

"""### Graphing the History"""

loss = history_1.history['loss']
val_loss = history_1.history['val_loss']
epochs = range(1, len(loss) + 1)

plt.figure(figsize=(10, 7)) # Optional, but can be useful
plt.plot(epochs, loss, 'g.', label='Training loss')
plt.plot(epochs, val_loss, 'b', label='Validation loss')
plt.title('Training and validation loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.legend()
plt.show()

"""## Skipping values"""

# Exclude the first few epochs to have a graph easier to read
SKIP = 100

plt.figure(figsize=(10, 7)) # Optional, but can be useful
plt.plot(epochs[SKIP:], loss[SKIP:], 'g.', label='Training loss')
plt.plot(epochs[SKIP:], val_loss[SKIP:], 'b.', label='Validation loss')
plt.title('Training and validation loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.legend()
plt.show()

"""### Draw graph for Mean Absolute Error (mae)"""

# Another way of measuring the error in the prediction
mae = history_1.history['mae']
val_mae = history_1.history['val_mae']

plt.figure(figsize=(10, 7)) # Optional, but can be useful
plt.plot(epochs[SKIP:], mae[SKIP:], 'g.', label='Training MAE')
plt.plot(epochs[SKIP:], val_mae[SKIP:], 'b.', label='Validation MAE')
plt.title('Training and validation mean absolute error')
plt.xlabel('Epochs')
plt.ylabel('MAE')
plt.legend()
plt.show()

"""### Apply model: Prediction"""

# Use the model, predictions from our validation data
predictions = model_1.predict(x_train)

# Plot predictions along with test data
plt.clf()
plt.title('Training data predicted vs actual values')
plt.plot(x_test, y_test, 'b.', label='Actual')
plt.plot(x_train, predictions, 'r.', label='Predicted')
plt.legend()
plt.show()

"""Sounds like the model is not big enough...

Let's add a second layer
"""

model_2 = tf.keras.models.Sequential(name="SecondModel")
#
model_2.add(layers.Dense(16, activation='relu', input_shape=(1,)))
# A second layer may help the network learn more complex representations
model_2.add(layers.Dense(16, activation='relu'))
# Same last layer
model_2.add(layers.Dense(1))
# Compile
model_2.compile(optimizer='rmsprop', loss='mse', metrics=['mae'])
# Print model's architecture
model_2.summary()
#

# Train again
verb = 0
before = time.time()
history_2 = model_2.fit(x_train, y_train, verbose=verb, epochs=1000, batch_size=16, validation_data=(x_validate, y_validate))
after = time.time()
print("Training of {} executed in {:.3f} seconds".format(model_2.name, (after - before)))

"""## Plot the data, see if there is any change"""

loss = history_2.history['loss']
val_loss = history_2.history['val_loss']
epochs = range(1, len(loss) + 1)

plt.figure(figsize=(10, 7)) # Optional, but can be useful
plt.plot(epochs, loss, 'g.', label='Training loss')
plt.plot(epochs, val_loss, 'b', label='Validation loss')
plt.title('Training and validation loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.legend()
plt.show()

# Exclude the first few epochs to have a graph easier to read
SKIP = 100

plt.figure(figsize=(10, 7)) # Optional, but can be useful
plt.plot(epochs[SKIP:], loss[SKIP:], 'g.', label='Training loss')
plt.plot(epochs[SKIP:], val_loss[SKIP:], 'b.', label='Validation loss')
plt.title('Training and validation loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.legend()
plt.show()

# Another way of measuring the error in the prediction
mae = history_2.history['mae']
val_mae = history_2.history['val_mae']

plt.figure(figsize=(10, 7)) # Optional, but can be useful
plt.plot(epochs[SKIP:], mae[SKIP:], 'g.', label='Training MAE')
plt.plot(epochs[SKIP:], val_mae[SKIP:], 'b.', label='Validation MAE')
plt.title('Training and validation mean absolute error')
plt.xlabel('Epochs')
plt.ylabel('MAE')
plt.legend()
plt.show()

"""### Now re-testing"""

loss = model_2.evaluate(x_test, y_test)
# Use the model, predictions from our test dataset
predictions = model_2.predict(x_test)

plt.figure(figsize=(10, 7)) # Optional, but can be useful
# Plot predictions along with test data
plt.clf()
plt.title('Comparing predictions actual values')
plt.plot(x_test, y_test, 'b.', label='Actual')
plt.plot(x_test, predictions, 'r.', label='Predicted')
plt.legend()
plt.show()

"""Much better!

## Converting for TensorFlow Lite, and storing the model
"""

# Convert the model to TensorFlow Lite format - without quantization
converter = tf.lite.TFLiteConverter.from_keras_model(model_2)
tflite_model = converter.convert()

# Save to disk
open("sine_model.tflite", "wb").write(tflite_model)

# Convert the model to TensorFlow Lite format - with quantization
converter = tf.lite.TFLiteConverter.from_keras_model(model_2)
converter.optimizations = [tf.lite.Optimize.DEFAULT]

# define generator function
def representative_dataset_generator():
  for value in x_test:
    # Each scalar value must be inside a 2D arraythat is wrapped in the list
    yield [np.array(value, dtype=np.float32, ndmin=2)]

converter.representative_dataset = representative_dataset_generator
# Conversion here
tflite_model = converter.convert()

# And finally save to disk
open("sine_model_quantized.tflite", "wb").write(tflite_model)

"""### Predict from the store models"""

# Instantiate an interpreter for each model
sine_model = tf.lite.Interpreter('sine_model.tflite')
sine_model_quantized = tf.lite.Interpreter('sine_model_quantized.tflite')

# Allocate required memory
sine_model.allocate_tensors()
sine_model_quantized.allocate_tensors()

# Get indexes of input nd output tensors
sine_model_input_index = sine_model.get_input_details()[0]["index"]
sine_model_output_index = sine_model.get_output_details()[0]["index"]
#
sine_model_quantized_input_index = sine_model_quantized.get_input_details()[0]["index"]
sine_model_quantized_output_index = sine_model_quantized.get_output_details()[0]["index"]

# Create array to store results
sine_model_predictions = []
sine_model_quantized_predictions = []

# Run each interpreter for each test value and store it in their dedicated array
for x_value in x_test:
  # Create 2D sensor wrapping the current x value
  x_value_tensor = tf.convert_to_tensor([[x_value]], dtype=np.float32)
  # Write value to input tensor
  sine_model.set_tensor(sine_model_input_index, x_value_tensor)
  # Run inference
  sine_model.invoke()
  # Read output, and store it
  sine_model_predictions.append(sine_model.get_tensor(sine_model_output_index)[0])
  # Same for the other model
  sine_model_quantized.set_tensor(sine_model_quantized_input_index, x_value_tensor)
  sine_model_quantized.invoke()
  sine_model_quantized_predictions.append(sine_model_quantized.get_tensor(sine_model_quantized_output_index)[0])

"""#### Plot results for the 2 models"""

plt.figure(figsize=(10, 7)) # Optional, but can be useful
plt.clf()
plt.title('Comparison of various models against actual values')
plt.plot(x_test, y_test, 'bo', label='Actual (test data)')
plt.plot(x_test, predictions, 'ro', label='Original predictions')
plt.plot(x_test, sine_model_predictions, 'rx', label='Lite predictions')
plt.plot(x_test, sine_model_quantized_predictions, 'gx', label='Lite quantized predictions')
#
plt.legend()
plt.show()

"""#### Model size comparison"""

import os

basic_model_size = os.path.getsize("sine_model.tflite")
print("Basic model is %d bytes big" % basic_model_size)

quantized_model_size = os.path.getsize("sine_model_quantized.tflite")
print("Quantized model is %d bytes big" % quantized_model_size)

difference = basic_model_size - quantized_model_size
print("Difference is %d bytes" % difference)

"""### Converting to a C file"""

# Install xxd if not there yet (should be there on a Mac, comment the line)
!apt-get -qq install xxd
# Save the file (the model) as a C file
!xxd -i sine_model_quantized.tflite > sine_model_quantized.cc
# Display the file's content
!cat sine_model_quantized.cc

"""### Done!"""

