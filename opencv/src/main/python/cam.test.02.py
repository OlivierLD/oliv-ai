#
# Basic video test
#
# Type [esc] on the image to exit.
#
import cv2

print(f'Using OpenCV version {cv2.__version__}')
cam: cv2.VideoCapture = cv2.VideoCapture(0)
print(f'Default resolution is { str(int(cam.get(3))) }x{ str(int(cam.get(4))) }')
print(f'cam is a {type(cam)}')

w: int = 512   # 1024
h: int = 384   # 768
cam.set(3, w)
cam.set(4, h)
print(f'Resolution is now { str(int(cam.get(3))) }x{ str(int(cam.get(4))) }')
print('Hit [escape] on the image to exit.')

while True:
    # Capture frames one by one
    ret, frame = cam.read()
    # Display
    cv2.imshow('Video Test', frame)
    # Wait for escape key to exit
    if cv2.waitKey(1) == 27:  # 27: Esc
        cv2.imwrite('./snap.snap.jpg', frame)  # Last read image
        break  # Exit loop

print('Done!')
cam.release()
cv2.destroyAllWindows()
