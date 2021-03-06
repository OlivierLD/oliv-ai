#!/usr/bin/env python3
#
# Use OpenCV to isolate the different characters in an image
#
from imutils import contours
import imutils
import cv2

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
        threshold_value = 127  # 127: dark conditions, 200: good light conditions
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
        if w >= 15 and h >= 50:  # <= That's the tricky part
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
        #
        # cv2.rectangle(saved_image, (x, y), (x + w, y + h), (0, 255, 0), 2)
        cv2.rectangle(saved_image, (x - padding, y - padding), (x + w + (2 * padding), y + h + (2 * padding)),
                      (0, 255, 0), 2)
        # TODO Send for identification, and print it on the image
        # cv2.putText(output, str(digit), (x - 10, y - 10),
        #             cv2.FONT_HERSHEY_SIMPLEX, 0.65, (0, 255, 0), 2)
        #
    cv2.imshow("Recognized characters", saved_image)


print("Starting")
original_image = cv2.imread("../digits/ten.digits.jpg")
cv2.imshow('Original', original_image)
# TODO: an ROI?
process_image(original_image, False)

print("Hit [Return] on the image")
cv2.waitKey(0)

cv2.destroyAllWindows()

print("Bye!")
