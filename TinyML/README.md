## TinyML
Reading the book TinyML, by Pete Warden & Daniel Situnayake, [published by O'Reilly](http://shop.oreilly.com/product/0636920254508.do).

_Notes and stuff._

### For Python scripts
Use PyCharm. The best Python IDE, by far.

#### Google Colab
Always up-to-date, _nice code-insight features_ and other developer help.
<https://colab.research.google.com/drive/1Gx5NVHlv4vJsNUGtCAdEHuqzN2mXY-x9#scrollTo=pYnBJkhUWTQn>

Not to miss: `File` > `Download .py`

#### Activation Functions
Good summary at <https://en.wikipedia.org/wiki/Activation_function#Comparison_of_activation_functions>. 

#### Hardware, p 29.
- [Arduino Nano 33 BLE Sense](https://store.arduino.cc/usa/nano-33-ble-sense-with-headers)
- [SparkFun Edge](https://www.sparkfun.com/products/15170)
- [ST Microelectronics STM32F746G Discovery kit](https://os.mbed.com/platforms/ST-Discovery-F746NG/)

#### TensorFlow lite repo, p 30.
- [TensorFlow lite](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/lite/micro)
#### Animated gif, p 31 (broken link...)
- [SparkFun Edge](https://github.com/tensorflow/tensorflow/blob/master/tensorflow/lite/micro/examples/hello_world/images/animation_on_sparkfun_edge.gif)

#### Building the Model, p 34.

**_Does not work_**
- [Google colab](https://colab.research.google.com/github/tensorflow/tensorflow/blob/master/tensorflow/lite/micro/examples/hello_world/create_sine_model.ipynb)

```
$ pip install tensorflow==2.0.0 [ -beta0 ]
```
#### Keras
- [Keras](https://www.tensorflow.org/guide/keras)

---
### Misc Links, from the book
- [TensorFlow](http://tensorflow.org)
- [Keras](https://www.tensorflow.org/guide/keras)
- [TensorFlow Lite](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/lite/micro)
- [Google Colaboratory](https://colab.research.google.com/notebooks/intro.ipynb#recent=true)

### Start Jupyter Notebook
A Jupyter server can run locally on any system (Windows, Mac, Linux)
> _Note_: Some model trainings can be demanding. That would be where Google's Colab would make more sense, they
> have some powerful CPUs available. 

After installing it:
```
$ jupyter-notebook
```
The Web UI should popup by itself.

> _Note_: It is also easy to download your notebooks from GoogleColab, and run them locally.
