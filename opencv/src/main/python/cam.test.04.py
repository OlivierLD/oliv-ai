#
# pip install opencv-python
#
import cv2
import numpy as np

"""
 Processing image from the camera, in real time.
 Color image
 Gray image
 Threshold image
 Contours detection (on a new image)
"""

print('Using OpenCV version', cv2.__version__)
cam = cv2.VideoCapture(0)
w = 512
h = 384
cam.set(3, w)
cam.set(4, h)

verboseContour = False
verbose = False

print('Hit a key to exit the program')

while True:
    ret, image = cam.read()
    if ret:
        cv2.imshow('Original', image)
        # cv2.imwrite('./snap1.jpg', image)

        img_gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        cv2.imshow('Gray', img_gray)

        ret, thresh = cv2.threshold(img_gray, 127, 255, 0)
        height, width = thresh.shape[:2]
        # cv2.imshow('Thresh {}x{}'.format(width, height), thresh)
        cv2.imshow('Thresh', thresh)
        try:
            # Only 2 prms returned!!!
            contours, hierarchy = cv2.findContours(thresh, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
            if verboseContour:
                print("Contours were found!! list of {} elements (ndarrays)".format(len(contours)))
                for i in range(len(contours)):
                    nb_points = len(contours[i])
                    if nb_points > 50:
                        print("Contour {} has {} points".format(i, nb_points))

            # Print contours on original image
            # cv2.drawContours(image, contours, -1, (0, 255, 0), 3)  # in green
            # cv2.imshow('Contours', image)

            # Create blank image, print contours on it
            blank_image = np.zeros((height, width, 3), np.uint8)
            color = (255, 255, 255)   # white
            blank_image[:] = color

            cv2.drawContours(blank_image, contours, -1, (0, 0, 0), 3)  # in black
            cv2.imshow('Contours only', blank_image)

        except ValueError as ve:
            # keep going
            if verbose:
                print(ve)
        finally:
            if verbose:
                print('Moving on')
    else:
        print('Oops! Image was not read.')
    key = cv2.waitKey(1) & 0xFF
    if key != 255:   # ord('q'):
        print("Key {}".format(key))
        break

print('Exiting')
cv2.destroyAllWindows()
cam.release()
