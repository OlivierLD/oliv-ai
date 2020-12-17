Code from the TensorFlow tutorial videos at <https://www.tensorflow.org/tutorials>

Full TensorFlow course (~7 hours) <https://www.youtube.com/watch?v=tPYj3fFJGjk>

Installing TF on Debian 10 <https://itnext.io/installing-tensorflow-2-3-0-for-raspberry-pi3-4-debian-buster-11447cb31fc4>

The scripts presented here might require
```
pip3 install tensorflow
pip3 install matplotlib
pip3 install scipy
pip3 install seaborn
pip3 install pandas
```
When OpenCV is needed, you can install it with 
```
pip3 install opencv-python
```

The script `04-bis_rock_paper_scissors_webcam.py` is extension of `04-image_classifier.py`, it uses
- A WebCam
- The model trained in `04-image_classifier.py`
It takes images from the WebCam to recognize `rock`, `paper`, or `scissors`. 

| Rock | Scissors | Paper |
|:-------------------:|:-------------------:|:-------------------:|
| ![Rock](./rock.jpg) | ![Scissors](./scissors.jpg) | ![Paper](./paper.jpg) |

---
