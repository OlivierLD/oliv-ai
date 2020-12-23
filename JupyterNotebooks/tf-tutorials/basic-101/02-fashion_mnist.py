# https://www.youtube.com/watch?v=bemDFpNooA8
# https://colab.research.google.com/github/lmoroney/mlday-tokyo/blob/master/Lab2-Computer-Vision.ipynb
# Dataset description at https://keras.io/api/datasets/fashion_mnist/
#
labels = [
    "T-Shirt", "Trouser", "Pullover", "Dress", "Coat", "Sandal", "Shirt", "Sneaker", "Bag", "Ankle boot"
#    0          1          2           3        4       5         6        7          8      9
]

import tensorflow as tf
from tensorflow import keras
import matplotlib.pyplot as plt
import json
from tensorflow.keras.utils import plot_model     # Requires pydot and GraphViz

print("TF Version {}".format(tf.__version__))

fashion_mnist = keras.datasets.fashion_mnist
(train_images, train_labels), (test_images, test_labels) = fashion_mnist.load_data()

model = keras.Sequential([
    keras.layers.Flatten(input_shape=(28, 28)),        # 28x28: size of the images - Input, 28x28 = 784
    keras.layers.Dense(128, activation=tf.nn.relu),    # 128... requires some intuition!
    keras.layers.Dense(10, activation=tf.nn.softmax)   # 10: number of categories  - Output
])

model.compile(optimizer=tf.keras.optimizers.Adam(),
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

plot_model(model,
           to_file='02.png',
           show_shapes=True,
           show_layer_names=True)


model.fit(train_images, train_labels, epochs=5)

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
        except Exception as ex:
            print("Oops {}".format(ex))

model.summary()

test_loss, test_acc = model.evaluate(test_images, test_labels)

# predictions = model.predict(my_images)
classifications = model.predict(test_images)

print("We have {} test images.".format(len(test_images)))

import random

# For fun, display 10 images to test
for akeu in range(10):
    idx = int(random.random() * len(test_images))  # Or whatever you like in the test array...
    digit = test_images[idx]
    print("Test index {} ... image of {} rows of {} bytes.".format(idx, len(digit), len(digit[0])))
    plt.imshow(digit, cmap=plt.cm.binary)
    plt.show()

    print("Softmax prediction: {} (take the biggest number)".format(classifications[idx]))

    max_idx = -1
    max_value = -1
    show_all = False
    for i in range(len(classifications[idx])):
        if classifications[idx][i] > max_value:
            max_value = classifications[idx][i]
            max_idx = i
        if show_all:
            print("{}: {} (idx: {}, value: {})".format(i, classifications[idx][i],max_idx, max_value))

    print(">> SoftMax said: {}, a {} ({:.2f}%)".format(max_idx, labels[max_idx], max_value * 100))
    print(">> Actual Label: {}, a {}".format(test_labels[idx], labels[test_labels[idx]]))
