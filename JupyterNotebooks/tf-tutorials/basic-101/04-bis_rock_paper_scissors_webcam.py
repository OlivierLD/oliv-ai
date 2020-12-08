#!/usr/bin/env python3
#
# Continuous capture, OpenCV
#
# https://pypi.org/project/opencv-python/
#
# pip install opencv-python
#
# About matplotlib: https://stackoverflow.com/questions/28269157/plotting-in-a-non-blocking-way-with-matplotlib
#
import sys
import time
import warnings
import cv2
import tensorflow as tf
import numpy as np
import subprocess as sp
import matplotlib.pyplot as plt
# import matplotlib.image as mpimg
import platform
from keras_preprocessing import image
from PIL import Image

warnings.filterwarnings('ignore')

DEBUG = True

print("Let's go!")

# Usual version yada-yada
print("OpenCV version", cv2.__version__)
print("TensorFlow version", tf.__version__)
print("Keras version", tf.keras.__version__)

print("{} script arguments.".format(len(sys.argv)))

labels = ["Paper", "Rock", "Scissors"]


# A test...
def prepare_image2(img):
    # convert the color from BGR to RGB then convert to PIL array
    cvt_image = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    im_pil = Image.fromarray(cvt_image)

    # resize the array (image) then PIL image
    im_resized = im_pil.resize((224, 224))
    img_array = image.img_to_array(im_resized)
    image_array_expanded = np.expand_dims(img_array, axis=0)
    return tf.keras.applications.mobilenet.preprocess_input(image_array_expanded)


def apply_model(cv2_image, model, show_all_steps=False, kernel_size=15):
    last_image = cv2_image
    last_image = cv2.cvtColor(last_image, cv2.COLOR_BGR2RGB)  # Not mandatory

    # gray = cv2.cvtColor(last_image, cv2.COLOR_BGR2GRAY)
    # if show_all_steps:
    #     cv2.imshow('Grayed', gray)
    # last_image = gray
    #
    # blurred = cv2.GaussianBlur(last_image, (kernel_size, kernel_size), 0)
    # if show_all_steps:
    #     cv2.imshow('Blurred', blurred)
    # last_image = blurred
    #
    # if True:
    #     threshold_value = 127  # 127: dark conditions, 200: good light conditions
    #     _, thresh = cv2.threshold(last_image, threshold_value, 255, THRESHOLD_TYPE["BINARY"])
    #     if show_all_steps:
    #         cv2.imshow('Threshed', thresh)
    #     last_image = thresh
    #
    # reworked = cv2.resize(255 - last_image, (150, 150))
    # reworked = cv2.resize(last_image, (150, 150))
    # last_image = reworked

    # last_image = (last_image[...,::-1].astype(np.float32)) / 255.0
    # prepared_image = prepare_image2(last_image)
    # prepared_image = last_image

    if show_all_steps:
        # Show the image, as it's been transformed to be processed
        cv2.imshow("As transformed for processing", last_image)
        #
        time.sleep(0.5)

    # Save image with OpenCV, read it with Keras (TODO there must be a better way)
    cv2.imwrite('snap.jpg', last_image)

    img = image.load_img('snap.jpg', target_size=(150, 150))
    x = image.img_to_array(img)  # TODO What is that?
    x = np.expand_dims(x, axis=0)

    images = np.vstack([x])
    classes = model.predict(images, batch_size=10)

    # classes = model.predict([ prepared_image ], batch_size=10)
    # print("File {} => {}".format(path, classes))
    result = -1
    for i in range(len(classes[0])):  # Look for the 1.
        if classes[0][i] == 1:
            result = i

    plt.imshow(last_image)
    plt.axis('Off')
    plt.title(labels[result])
    plt.show(block=False)

    message = 'It looks like a {} to me'.format(labels[result])
    print(message)
    if platform.system() == 'Darwin':
        sp.run(['say',
                message])


# Now we start the job
rps_model = None
try:
    print(">> Loading the model...")
    rps_model = tf.keras.models.load_model('rps.h5')
    print(">> Model is now loaded")
except OSError as ose:
    print('>> Model not found?')
    print(ose)
    sys.exit(1)

# The core of the program
camera = cv2.VideoCapture(0)

width =  320  # 640
height = 320  # 640
camera.set(3, width)
camera.set(4, height)

mirror = True
zoom = False
scale = 25  # Zoom scale. Percent of the original (radius). 50 => 100%

print("+----------------------------------------------------+")
print("| Type Q, q or Ctrl+C to exit the loop               |")
print("| > Select the main image before hitting a key... ;) |")
print("+----------------------------------------------------+")
keep_looping = True
show_cropped = False
use_roi = False
original_image = None

while keep_looping:

    _, frame = camera.read()
    time.sleep(0.1)
    try:
        original_image = frame
        if mirror:
            original_image = cv2.flip(original_image, 1)

        if zoom:
            # Zoom on the image, see 'scale' (in %)
            # get the webcam size
            img_height, img_width, channels = original_image.shape
            # prepare the crop
            centerX, centerY = int(img_height / 2), int(img_width / 2)
            radiusX, radiusY = int(scale * img_height / 100), int(scale * img_width / 100)

            minX, maxX = centerX - radiusX, centerX + radiusX
            minY, maxY = centerY - radiusY, centerY + radiusY

            cropped = frame[minX:maxX, minY:maxY]
            original_image = cv2.resize(cropped, (img_width, img_height))

        # Original image
        cv2.imshow('Hit S to take snapshot, Q to quit', original_image)
    except Exception as ex:
        print("Oops! {}".format(ex))

    key = cv2.waitKey(1) & 0xFF
    # print("Key : {}".format(key))
    if key == ord('q'):  # select the image window and hit 'q' to quit
        keep_looping = False
    if key == ord('s'):  # Take snapshot as it is
        print('\t>> Taking snapshot -')  # And invoke model
        if original_image is not None:
            image_to_process = original_image
            if use_roi:
                # Select ROI
                # Nice ROI summary: https://www.learnopencv.com/how-to-select-a-bounding-box-roi-in-opencv-cpp-python/
                roi = cv2.selectROI("Select ROI", original_image, showCrosshair=False,
                                    fromCenter=False)  # Interactive selection TODO: How to force a square?
                if DEBUG:
                    print("ROI: {}".format(roi))
                    print("Selected ROI: {} {} {} {}".format(int(roi[1]), int(roi[1] + roi[3]), int(roi[0]),
                                                             int(roi[0] + roi[2])))
                try:
                    cropped_image = original_image[int(roi[1]):int(roi[1] + roi[3]), int(roi[0]):int(roi[0] + roi[2])]
                    if show_cropped:
                        cv2.imshow('Selected ROI', cropped_image)
                        time.sleep(0.5)
                    image_to_process = cropped_image
                except Exception as ex:  # ROI was canceled?
                    print("Oops! {}".format(ex))
                    print("Ok, canceled.")
            apply_model(image_to_process, rps_model, False)
        else:
            print("No image available yet...")

# Releasing resources
camera.release()
cv2.destroyAllWindows()

print("Bye!")
