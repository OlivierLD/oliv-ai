#
# The SIMPLEST Neural Network ever.
#
import tensorflow as tf
from tensorflow import keras
import numpy as np

# Single layer model
model = keras.Sequential([
    keras.layers.Dense(units=1, input_shape=[1])
])
model.compile(optimizer='sgd', loss='mean_squared_error')

# Actual function is y = (2x - 1)
xs = np.array([-1.0, 0.0, 1.0, 2.0, 3.0, 4.0], dtype=float)
ys = np.array([-3.0, -1.0, 1.0, 3.0, 5.0, 7.0], dtype=float)

# In english: fit the xs to the ys, and try 500 times
model.fit(xs, ys, epochs=500)

prediction = model.predict([10.0])
print("For value 10, pedict is {}".format(prediction[0][0]))
expected = (2 * 10.0) - 1
error = (expected - prediction[0][0]) / expected
print("Expected {}, error is {:.3f}% ({}%)".format(expected, error * 100, error * 100))
