# Prediction
# Expect parameters:
# --image:XXX
# --model:xxx.h5
#
import sys
import numpy as np
import tensorflow as tf
import cv2

if len(sys.argv) < 3:  # Script name + 4 args
    print("\nUsage is ")
    print(
        '\tpython3 {} --model:path.to.model.h5 --image:path.to.image.jpg"'.format(
            sys.argv[0]))
    print("Try again")
    sys.exit()

image_path = ""
model_path = ""

# Script parameters
IMAGE_PATH_PREFIX = "--image:"
MODEL_PATH_PREFIX = "--model:"

for arg in sys.argv:
    if arg[:len(IMAGE_PATH_PREFIX)] == IMAGE_PATH_PREFIX:
        image_path = arg[len(IMAGE_PATH_PREFIX):]
    elif arg[:len(MODEL_PATH_PREFIX)] == MODEL_PATH_PREFIX:
        model_path = arg[len(MODEL_PATH_PREFIX):]

print("Processing {} with {}".format(image_path, model_path))

model = None
try:
    print("Loading the model...")
    model = tf.keras.models.load_model(model_path)
    print(">> Model is now loaded")
except OSError as ose:
    print('Model not found?')
    print(ose)
    sys.exit(1)

try:
    img = cv2.imread(image_path, cv2.IMREAD_GRAYSCALE)
    img = cv2.resize(255-img, (28, 28))
    #
    im2arr = np.array(img)
    im2arr = im2arr.reshape(1, 28, 28, 1)
    pred = model.predict_classes(im2arr)
    precision = model.predict(im2arr)
    print("Prediction: it looks like a ", str(int(pred[0])), " (", precision[0][np.argmax(precision)] * 100, "% sure ), Nb predictions:", len(precision))
except FileNotFoundError:
    print("File", image_path, "not found...")
