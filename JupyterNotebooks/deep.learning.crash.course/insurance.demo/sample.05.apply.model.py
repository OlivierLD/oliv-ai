#
# Uses the previously trained model, insurance.h5
#
import tensorflow as tf
import numpy as np
import sys
#
model_name = 'insurance.h5'
coded_colors = ["red", "green", "yellow"]

print("\t\tLoading model {}".format(model_name))

try:
    model = tf.keras.models.load_model(model_name)
    print(">> Model is now loaded")
except OSError as ose:
    print('Model not found?')
    print(ose)
    sys.exit(1)  # Bam!

# model._make_predict_function()
model.summary()
#
# Let's go
#
speed = 90
age = 40
mpy = 10
#
SPEED_PREFIX = "--speed:"
AGE_PREFIX = "--age:"
KMPY_PREFIX = "--kmpy:"

# Supported parameters
print("===========================================================")
print("Supported parameters {} --speed:xx --age:yy --kmpy:zz".format(sys.argv[0]))
print("===========================================================")

if len(sys.argv) > 0:  # Script name + X args
    for arg in sys.argv:
        if arg[:len(SPEED_PREFIX)] == SPEED_PREFIX:
            speed = int(arg[len(SPEED_PREFIX):])
        if arg[:len(AGE_PREFIX)] == AGE_PREFIX:
            age = int(arg[len(AGE_PREFIX):])
        if arg[:len(KMPY_PREFIX)] == KMPY_PREFIX:
            mpy = int(arg[len(KMPY_PREFIX):])

print("Speed {}, Age {}, Kmpy {}".format(type(speed), type(age), type(mpy)))
print("Speed {}, Age {}, Kmpy {}".format(speed, age, mpy))

# Make prediction below
try:
    input_data = np.array([[speed, age, mpy]])
    print("Input data shape: {}".format(input_data.shape))
    # model.summary()  # Quick sanity check

    prediction = model.predict(input_data)

    print('predictions shape:', prediction.shape)
    print("Prediction {}".format(prediction))
    final_color = None
    probability = 0
    for pred in prediction:
        print("{}, max's index {}, {:0.2f}%".format(pred, np.argmax(pred), pred[np.argmax(pred)] * 100))
        print(
            "Final result: {}, {:0.2f}%".format(coded_colors[np.argmax(pred)], pred[np.argmax(pred)] * 100))
        final_color = coded_colors[np.argmax(pred)]
        probability = pred[np.argmax(pred)] * 100
        print("Predicted result {}, {:0.2f}%".format(final_color, probability))
    final_payload = {"risk": final_color, "probability": probability}
    # self.wfile.write(json.dumps(final_payload).encode())
except Exception as exception:
    error = {"message": "{}".format(exception)}


