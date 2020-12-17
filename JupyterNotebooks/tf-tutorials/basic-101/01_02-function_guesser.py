#
# Regression Problem, more complex than 01-function_guesser.py
# read data from a file (json)
#
import tensorflow as tf
from tensorflow import keras
#
import numpy as np
import json
import matplotlib.pyplot as plt

# Read from File (requires 'import json')
with open('./linear.regression.data.json', mode='r') as f:
    data = json.load(f)
print("Data were read, {} points".format(len(data)))
raw_xs = []
raw_ys = []
for point in data:
    # print("Point {}".format(point))
    raw_xs.append(point['x'])
    raw_ys.append(point['y'])
xs = np.array(raw_xs, dtype=float)
ys = np.array(raw_ys, dtype=float)

print("X between {} and {}".format(np.min(xs), np.max(xs)))
print("Y between {} and {}".format(np.min(ys), np.max(ys)))

# Display original data
if False:
    print("Displaying raw data")
    plt.plot(xs, ys)
    plt.show()

# Model definitions
model_1 = keras.Sequential([
    keras.layers.Dense(units=10, input_shape=[1], kernel_initializer='normal', activation=tf.nn.relu),
    keras.layers.Dense(5, kernel_initializer='normal', activation=tf.nn.relu),
    keras.layers.Dense(1, kernel_initializer='normal', activation=tf.keras.activations.linear)
])
model_2 = keras.Sequential([
    keras.layers.Dense(500, input_dim=1, activation=tf.nn.relu),
    keras.layers.Dense(100, activation=tf.nn.relu),
    keras.layers.Dense(50, activation=tf.nn.relu),
    keras.layers.Dense(1)
])
model_3 = keras.Sequential([
    keras.layers.Dense(500, input_dim=1, activation=tf.nn.relu),
    keras.layers.Dense(50, activation=tf.nn.relu),
    keras.layers.Dense(1)
])
model_4 = keras.Sequential([
    keras.layers.Dense(100, input_dim=1, activation=tf.nn.relu),
    keras.layers.Dense(50, activation=tf.nn.relu),
    keras.layers.Dense(1)
])

# Try the different models here
model = model_4

# model.compile(optimizer='sgd', loss='mean_squared_error')
model.compile(optimizer='adam', loss='mean_squared_error', metrics=['mse','mae'])

# In english: fit the xs to the ys, and try X times
# model.fit(xs, ys, epochs=500)
model.fit(xs, ys, epochs=20)

show_details = True
if show_details:  # Display model details
    json_string = model.to_json()
    parsed_json = json.loads(json_string)
    print("Model, json format:\n{}".format(json.dumps(parsed_json, indent=4)))
    for layer in model.layers:
        try:
            weights = layer.get_weights()[0]
            biases = layer.get_weights()[1]
            print("Weights: {}\nBiases: {}".format(weights, biases))
        except Exception:
            print("Oops")

model.summary()


def frange(start, stop, step):
    i = start
    while i < stop:
        yield i
        i += step


new_x = []
new_y = []
for x in frange(np.min(xs), np.max(xs), 0.1):
    new_x.append(x)
    y = model.predict([x])
    new_y.append(y[0][0])
pred_xs = np.array(new_x, dtype=float)
pred_ys = np.array(new_y, dtype=float)

print("Displaying raw and predicted data")
plt.plot(xs, ys)             # Raw data
plt.plot(pred_xs, pred_ys)   # Predicted
plt.show()

print("Done!")
