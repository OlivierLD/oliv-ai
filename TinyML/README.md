## TinyML
Reading the book TinyML, by Pete Warden & Daniel Situnayake, [published by O'Reilly](http://shop.oreilly.com/product/0636920254508.do).

_Notes and stuff._

### Python IDE
If your machine can take it (it requires some RAM), use PyCharm. 
The best Python IDE, by far.

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
$ pip install tensorflow[==2.2.0 [ -beta0 ]]
```

### Chapter 5
- [The app](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/lite/micro/examples/hello_world)
- [The app README](https://github.com/tensorflow/tensorflow/blob/master/tensorflow/lite/micro/examples/hello_world/README.md)
- [The tests](https://github.com/tensorflow/tensorflow/blob/master/tensorflow/lite/micro/examples/hello_world/hello_world_test.cc_)
---
- [SparkFun Edge Get Started](https://codelabs.developers.google.com/codelabs/sparkfun-tensorflow/#0)
    - In the above, a path like `tensorflow/lite/experimental/micro/tools/make/Makefile` becomes
    `tensorflow/lite/micro/tools/make/Makefile` in the last version of the TensorFlow master branch (May-2020).
    The `experimental` directory is gone.
    - Build the binaries
    ```
    $ make -f tensorflow/lite/micro/tools/make/Makefile TARGET=sparkfun_edge micro_speech_bin
    tensorflow/lite/micro/tools/make/Makefile:2: *** "Requires make version 3.82 or later (current is 3.81)".  Stop.
    ```
    if the above happens, do a `brew install make`. It should work OK after that.
    - The `cp` involves a version that may have changed
    ```
    cp \
    tensorflow/lite/micro/tools/make/downloads/AmbiqSuite-Rel2.2.0/tools/apollo3_scripts/keys_info0.py \
    tensorflow/lite/micro/tools/make/downloads/AmbiqSuite-Rel2.2.0/tools/apollo3_scripts/keys_info.py
    ```
    - Same for the signed binary creation
    ```
    python3 tensorflow/lite/micro/tools/make/downloads/AmbiqSuite-Rel2.2.0/tools/apollo3_scripts/create_cust_image_blob.py \
    --bin tensorflow/lite/micro/tools/make/gen/sparkfun_edge_cortex-m4/bin/micro_speech.bin \
    --load-address 0xC000 \
    --magic-num 0xCB \
    -o main_nonsecure_ota \
    --version 0x0
    ```
    and
    ```
    python3 tensorflow/lite/micro/tools/make/downloads/AmbiqSuite-Rel2.2.0/tools/apollo3_scripts/create_cust_wireupdate_blob.py \
    --load-address 0x20000 \
    --bin main_nonsecure_ota.bin \
    -i 6 \
    -o main_nonsecure_wire \
    --options 0x1
    ```

#### TensorFlow and Keras
- [TensorFlow](https://www.tensorflow.org/api_docs/python/tf)
- [Keras](https://www.tensorflow.org/guide/keras)

---
### Misc Links, from the book
- [TensorFlow](http://tensorflow.org)
- [Keras](https://www.tensorflow.org/guide/keras)
- [TensorFlow Lite](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/lite/micro)
- [Google Colaboratory](https://colab.research.google.com/notebooks/intro.ipynb#recent=true)

### Start Jupyter Notebook
A Jupyter server can run locally on any system (Windows, Mac, Linux)
> _Note_: Some model trainings can be quite demanding. That would be where Google's Colab would make more sense, they
> have some powerful CPUs available. The code you run on Google Colab is executed remotely, all you need is a browser.
> I was able to do it _from a Raspberry Pi_ without any problem.

After installing it:
```
$ jupyter-notebook
```
The Web UI should popup by itself.

> _Note_: It is also easy to download your notebooks from GoogleColab, and run them locally.
