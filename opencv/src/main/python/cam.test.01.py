#
# pip install opencv-python
# sudo apt-get install libcblas-dev
# sudo apt-get install libhdf5-dev
# sudo apt-get install libhdf5-serial-dev
# sudo apt-get install libatlas-base-dev
# sudo apt-get install libjasper-dev
# sudo apt-get install libqtgui4
# sudo apt-get install libqt4-test
#
# pip install -U numpy
#
# Basic sample. Read an image, write it on the file system, display it.
#
import cv2

print(f'Using OpenCV version {cv2.__version__}')

# List available cameras
index = 0
arr = []
while True:
    cap = cv2.VideoCapture(index)
    if not cap.read()[0]:
        break
    else:
        arr.append(index)
    cap.release()
    index += 1
    
print("=================================")    
print(f'There {"are" if len(arr) > 1 else "is"} {len(arr)} camera{"s" if len(arr) > 1 else ""} available.')
print("=================================")    

cam = cv2.VideoCapture(0)  # Open camera #0
ret, image = cam.read()
if ret:
    cv2.imwrite('./snap1.jpg', image)
    try:
        cv2.imshow('Snap', image)
        print("Hit return on the image to close it")
        cv2.waitKey(0)
        cv2.destroyWindow('Snap')
    except Exception as ex:
        print('Exception {}'.format(ex))
    finally:
        print('Bye!')
else:
    print('Oops!')
cam.release()
