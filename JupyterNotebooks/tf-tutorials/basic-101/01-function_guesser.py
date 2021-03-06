#
# The SIMPLEST Neural Network ever.
#
import tensorflow as tf
from tensorflow import keras
import numpy as np
import json
from tensorflow.keras.utils import plot_model     # Requires pydot and GraphViz

print(f"Using TensorFlow Version {tf.__version__}")

# Single layer model
model = keras.Sequential([
    keras.layers.Dense(units=1, input_shape=[1])
])
model.compile(optimizer='sgd', loss='mean_squared_error')

print("Printing model to 01_01.png")
plot_model(model,
           to_file='01_01.png',
           show_shapes=True,
           show_layer_names=True)

#
# Actual function is y = (2x - 1)
#
xs = np.array([-1.0, 0.0, 1.0, 2.0, 3.0, 4.0], dtype=float)   # in
ys = np.array([-3.0, -1.0, 1.0, 3.0, 5.0, 7.0], dtype=float)  # out, labels.

# Read from File (requires 'import json')
# with open('./linear.regression.data.json') as f:
#   data = json.load(f)

# In english: fit the xs to the ys, and try 500 times
model.fit(xs, ys, epochs=500)

show_details = True
if show_details:  # Display model details
    json_string = model.to_json()
    parsed_json = json.loads(json_string)
    # print("Model, json format:\n{}".format(json.dumps(parsed_json, indent=4)))
    print(f"Model, json format:\n{json.dumps(parsed_json, indent=4)}")
    for layer in model.layers:
        try:
            weights = layer.get_weights()[0]
            biases = layer.get_weights()[1]
            # print("Weights: {}\nBiases: {}".format(weights, biases))
            print(f"Weights: {weights}\nBiases: {biases}")
        except Exception:
            print("Oops")

model.summary()

x = 10.0
prediction = model.predict([x])
# print("For value 10, predict is {}".format(prediction[0][0]))
print(f"For value 10, predict is {prediction[0][0]}")
expected = (2 * x) - 1
error = (expected - prediction[0][0]) / expected
print("Expected {}, error is {:.3f}% ({}%)".format(expected, error * 100, error * 100))
print(f"... Calculated: { weights[0][0] }.x + { biases[0] } = { (weights[0][0] * x) + biases[0] }")
