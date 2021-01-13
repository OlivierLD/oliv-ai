#
# Regression Problem, more complex than 01-function_guesser.py
# read data from a file (json)
#
import sys
# import time
#
import tensorflow as tf
from tensorflow import keras
#
import numpy as np
import json
import matplotlib.pyplot as plt
# from tensorflow.keras.utils import plot_model     # Requires pydot and GraphViz

print("Python version {}".format(sys.version))
print("TensorFlow version {}".format(tf.__version__))
print("Keras version {}".format(keras.__version__))


def float_range(start, stop, step):
    i = start
    while i < stop:
        yield i
        i += step


# Model definitions (globals)
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


def do_it(model, show_details):
    # Read from File (requires 'import json'). Training data.
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

    print("X in [{}, {}]".format(np.min(xs), np.max(xs)))
    print("Y in [{}, {}]".format(np.min(ys), np.max(ys)))

    # Display original data
    if show_details:
        print("Displaying raw data")
        plt.plot(xs, ys)
        plt.legend(["Training data"])
        plt.show()
        # time.sleep(0.5)   # Give time to close the window?

    # model.compile(optimizer='sgd', loss='mean_squared_error')
    model.compile(optimizer='adam', loss='mean_squared_error', metrics=['mse', 'mae'])

    # plot_model(model,
    #            to_file='01_02.png',
    #            show_shapes=True,
    #            show_layer_names=True)

    # In english: fit the xs to the ys, and try X(epochs) times
    # model.fit(xs, ys, epochs=500)
    model.fit(xs, ys, epochs=20, verbose=(1 if show_details else 0))

    if show_details:  # Display model details
        json_string = model.to_json()
        parsed_json = json.loads(json_string)
        print("Model, json format:\n{}".format(json.dumps(parsed_json, indent=4)))
        for layer in model.layers:
            try:
                weights = layer.get_weights()[0]
                biases = layer.get_weights()[1]
                print("Weights: {}\nBiases: {}".format(weights, biases))
            except Exception as ex:
                print("Oops {}".format(ex))
        model.summary()

    new_x = []
    new_y = []
    print("Calculating predictions...")
    # Wider range than the training data.
    for x in float_range(1.5 * np.min(xs), 1.5 * np.max(xs), 0.1):
        new_x.append(x)
        y = model.predict([x])
        new_y.append(y[0][0])
    pred_xs = np.array(new_x, dtype=float)
    pred_ys = np.array(new_y, dtype=float)

    print("Displaying raw and predicted data")
    plt.plot(xs, ys)             # Raw data
    plt.plot(pred_xs, pred_ys)   # Predicted
    plt.legend(["Raw", "Predictions"])
    plt.show()


MODEL_PRM_PREFIX = "--model:"
SHOW_DETAILS_PRM_PREFIX = "--show-details:"


def main(argv):
    # Try the different models here... ;)
    model = model_4
    show_details = False
    if len(argv) != 0:
        print(argv)
    for arg in argv:
        if arg[:len(MODEL_PRM_PREFIX)] == MODEL_PRM_PREFIX:
            try:
                model_num = int(arg[len(MODEL_PRM_PREFIX):])
                if model_num == 1:
                    model = model_1
                elif model_num == 2:
                    model = model_2
                elif model_num == 3:
                    model = model_3
                elif model_num == 4:
                    model = model_4
                else:
                    print("{} not there yet, using default (4)".format(model_num))
            except Exception as ex:
                print(str(ex))
        elif arg[:len(SHOW_DETAILS_PRM_PREFIX)] == SHOW_DETAILS_PRM_PREFIX:
            show_details = (arg[len(SHOW_DETAILS_PRM_PREFIX):] == "true")
    do_it(model, show_details)


# print("__name__: {}".format(__name__))

if __name__ == '__main__':
    print("Running as main")
    print("Usage is:")
    print("  python3 {} --model:[1..4]".format(__file__))
    print("  python3 {} --show-details:true|false".format(__file__))
    main(sys.argv)
    print("Done!")
