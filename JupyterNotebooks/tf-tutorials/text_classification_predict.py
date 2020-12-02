#
# Use a saved model
#
import tensorflow as tf
from tensorflow.keras import layers
from tensorflow.keras import losses

print("Loading existing model")
# model = tf.keras.models.load_model('text_classification_model')  # Folder
model = tf.keras.models.load_model('model_01.h5')  # File
model.summary()

print(">> Now exporting the model, Sigmoid activation function")
export_model = tf.keras.Sequential([
    # vectorize_layer,      # See in text_classification.py
    model,
    layers.Activation('sigmoid')
])

export_model.compile(
    loss=losses.BinaryCrossentropy(from_logits=False), optimizer="adam", metrics=['accuracy']
)

# At work
examples = [
    "The movie was great!",
    "The movie was okay.",
    "The movie was terrible..."
]

# predictions = export_model.predict(examples)
# print("For sentences\n{}\nprediction is \n{}".format(examples, predictions))


print("Hop!")
