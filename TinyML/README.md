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
    - Requires a USB cable, USB-C on the Arduino side (like Raspberry Pi and others).
    - [Get Started](https://www.arduino.cc/en/Guide/NANO33BLESense#toc6).
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
The code is in the `tensorflow` git repo.
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
  
For Arduino , `make` might be required.
```
brew [re]install make 
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
```
Then we're good to give it a try
```
make -v
GNU Make 4.3
Built for x86_64-apple-darwin18.7.0
Copyright (C) 1988-2020 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
```
```
[~/tensorflow]make -f tensorflow/lite/micro/tools/make/Makefile test_hello_world_test
tensorflow/lite/micro/tools/make/Makefile:283: warning: overriding recipe for target 'tensorflow/lite/micro/tools/make/downloads/ruy'
tensorflow/lite/micro/tools/make/Makefile:283: warning: ignoring old recipe for target 'tensorflow/lite/micro/tools/make/downloads/ruy'

 . . .

ar -r tensorflow/lite/micro/tools/make/gen/osx_x86_64/lib/libtensorflow-microlite.a tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/debug_log.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/memory_helpers.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/micro_allocator.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/micro_error_reporter.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/micro_interpreter.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/micro_optional_debug_tools.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/micro_string.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/micro_time.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/micro_utils.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/simple_memory_allocator.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/test_helpers.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/activations.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/add.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/all_ops_resolver.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/arg_min_max.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/ceil.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/circular_buffer.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/comparisons.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/concatenation.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/conv.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/depthwise_conv.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/dequantize.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/elementwise.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/floor.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/fully_connected.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/l2norm.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/logical.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/logistic.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/maximum_minimum.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/mul.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/neg.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/pack.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/pad.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/pooling.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/prelu.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/quantize.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/reduce.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/reshape.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/resize_nearest_neighbor.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/round.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/softmax.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/split.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/strided_slice.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/sub.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/svdf.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/kernels/unpack.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/memory_planner/greedy_memory_planner.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/memory_planner/linear_memory_planner.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/c/common.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/core/api/error_reporter.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/core/api/flatbuffer_conversions.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/core/api/op_resolver.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/core/api/tensor_utils.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/kernels/internal/quantization_util.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/kernels/kernel_util.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/testing/test_utils.o
ar: creating archive tensorflow/lite/micro/tools/make/gen/osx_x86_64/lib/libtensorflow-microlite.a
g++ -std=c++11 -DTF_LITE_STATIC_MEMORY -DNDEBUG -O3 -DTF_LITE_DISABLE_X86_NEON -DTF_LITE_DISABLE_X86_NEON -I. -Itensorflow/lite/micro/tools/make/downloads/ -Itensorflow/lite/micro/tools/make/downloads/gemmlowp -Itensorflow/lite/micro/tools/make/downloads/flatbuffers/include -Itensorflow/lite/micro/tools/make/downloads/ruy -Itensorflow/lite/micro/tools/make/downloads/kissfft -o tensorflow/lite/micro/tools/make/gen/osx_x86_64/bin/hello_world_test tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/examples/hello_world/hello_world_test.o tensorflow/lite/micro/tools/make/gen/osx_x86_64/obj/tensorflow/lite/micro/examples/hello_world/model.o  tensorflow/lite/micro/tools/make/gen/osx_x86_64/lib/libtensorflow-microlite.a  -lm -framework Foundation -framework AudioToolbox -framework Foundation -framework AudioToolbox
tensorflow/lite/micro/testing/test_linux_binary.sh tensorflow/lite/micro/tools/make/gen/osx_x86_64/bin/hello_world_test '~~~ALL TESTS PASSED~~~'
tensorflow/lite/micro/tools/make/gen/osx_x86_64/bin/hello_world_test: PASS
[~/repos/tensorflow]
```
##### In the Arduino IDE
- Install the `Arduino_TensorFlowLite` library (`Tools` > `Manage Libraries`)
- Open the `Examples` > `Arduino_TensorFlowLite` > `hello_world`
- Compile and deploy to the device

> Note: if stuck, use the `reset` button on the Arduino Nano. 

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
