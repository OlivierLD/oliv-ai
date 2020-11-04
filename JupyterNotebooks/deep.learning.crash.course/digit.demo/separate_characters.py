#!/usr/bin/env python3
#
# Handwritten figures recognition => classification
# also see https://www.tensorflow.org/api_docs/python/tf/keras and similar pages.
#
# Shows how to split several characters from ONE single image.
# No recognition done here.
#
# Great doc at
# https://medium.com/@ashok.tankala/build-the-mnist-model-with-your-own-handwritten-digits-using-tensorflow-keras-and-python-f8ec9f871fd3
#
# Interactive: https://ashok.tanka.la/assets/examples/mnist/mnist.html
#
# https://pypi.org/project/opencv-python/
#
# pip install opencv-python
#
import sys
import time
import warnings
from imutils import contours
import imutils
import cv2

warnings.filterwarnings('ignore')

print("Let's go!")

print("OpenCV version", cv2.__version__)

print("{} script arguments.".format(len(sys.argv)))

DEBUG = False

THRESHOLD_TYPE = {
    "BINARY": 0,
    "BINARY_INVERTED": 1,
    "TRUNCATED": 2,
    "TO_ZERO": 3,
    "TO_ZERO_INVERTED": 4
}


def process_image(image, show_all_steps=False, kernel_size=15):
    saved_image = image.copy()
    last_image = image
    gray = cv2.cvtColor(last_image, cv2.COLOR_BGR2GRAY)
    if show_all_steps:
        cv2.imshow('Grayed', gray)
    last_image = gray

    blurred = cv2.GaussianBlur(last_image, (kernel_size, kernel_size), 0)
    if show_all_steps:
        cv2.imshow('Blurred', blurred)
    last_image = blurred

    edged = cv2.Canny(last_image, 50, 200, 255)
    last_image = edged

    if show_all_steps:
        cv2.imshow("Edged", edged)

    if True:
        # TODO Make this s runtime parameter
        threshold_value = 60  # 127  # 127: dark conditions, 200: good light conditions
        _, thresh = cv2.threshold(last_image, threshold_value, 255, THRESHOLD_TYPE["BINARY"])
        if show_all_steps:
            cv2.imshow('Threshed', thresh)
        last_image = thresh

    all_contours = cv2.findContours(last_image.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    all_contours = imutils.grab_contours(all_contours)
    print("Found {} contours".format(len(all_contours)))

    if show_all_steps:
        cv2.drawContours(image, all_contours, -1, (0, 255, 0), 3)  # in green
        cv2.imshow('Contours', image)

    digit_contours = []

    # loop over the digit area candidates
    for c in all_contours:
        # compute the bounding box of the contour
        (x, y, w, h) = cv2.boundingRect(c)
        print("Found Contours x:{} y:{} w:{} h:{}".format(x, y, w, h))
        # if the contour is sufficiently large, it must be a digit
        if w >= 15 and h >= 150:  # <= That's the tricky part
            print("\tAdding Contours x:{} y:{} w:{} h:{}".format(x, y, w, h))
            digit_contours.append(c)

    print("Retained {}".format(len(digit_contours)))
    # sort the contours from left-to-right, then initialize the
    # actual digits themselves
    digit_contours = contours.sort_contours(digit_contours,
                                            method="left-to-right")[0]
    # loop over each of the digits
    idx = 0
    padding = 10
    for c in digit_contours:
        idx += 1
        # extract the digit ROI
        (x, y, w, h) = cv2.boundingRect(c)
        #
        roi = thresh[y:y + h, x:x + w]  # <= THIS is the image that will be processed (recognized) later on.
        #
        if show_all_steps:
            cv2.imshow("Digit {}".format(idx), roi)
            # TODO Those images could be sent to the model for recognition
        #
        # cv2.rectangle(saved_image, (x, y), (x + w, y + h), (0, 255, 0), 2)
        cv2.rectangle(saved_image, (x - padding, y - padding), (x + w + (2 * padding), y + h + (2 * padding)),
                      (0, 255, 0), 2)

    cv2.imshow("Recognized characters", saved_image)


# The core of the program
camera = cv2.VideoCapture(0)

width = 640
height = 640
camera.set(3, width)
camera.set(4, height)

mirror = False
zoom = False
scale = 25  # Zoom scale. Percent of the original (radius). 50 => 100%

keepLooping = True
# No ROI selection. Make sure the image is big enough (digits take all the width).
print("+----------------------------------------------------+")
print("| Type Q, q or Ctrl+C to exit the loop               |")
print("| Type S or s to take a snapshot                     |")
print("| > Select the main image before hitting a key... ;) |")
print("+----------------------------------------------------+")
while keepLooping:

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
        cv2.imshow('Original', original_image)
    except Exception as ex:
        print("Oops! {}".format(ex))

    key = cv2.waitKey(1) & 0xFF
    # print("Key : {}".format(key))
    if key == ord('q'):  # select the image window and hit 'q' to quit
        keepLooping = False
    if key == ord('s'):  # Take snapshot
        print('\t>> Taking snapshot -')  # And invoke model?
        process_image(original_image, True)

# Releasing resources
camera.release()
cv2.destroyAllWindows()

print("Bye!")
