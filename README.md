## Oliv AI
Learning AI, ML, DL, etc.

#### About the Raspberry Pi
Did several tests, specially since RaspiOS 64-bits was released, running TensorFlow - installing it actually - is not always as straigthforward as expected.

Trying the Docker route.

See:
- <https://www.tensorflow.org/install/source_rpi>
- <https://phoenixnap.com/kb/docker-on-raspberry-pi>

### TensorFlow and Docker
Works just fine.

See <https://www.tensorflow.org/install/docker> for instructions.
```
 $ docker pull tensorflow/tensorflow[:latest-py3]
```
See the images
```
 $ docker images
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
tensorflow/tensorflow   latest-py3          53187075965b        4 months ago        2.52GB
hello-world             latest              a29f45ccde2a        4 months ago        9.14kB
 $ 
```
Run a given image
```
 $ docker run -it tensorflow/tensorflow[:latest-py3] bash

________                               _______________                
___  __/__________________________________  ____/__  /________      __
__  /  _  _ \_  __ \_  ___/  __ \_  ___/_  /_   __  /_  __ \_ | /| / /
_  /   /  __/  / / /(__  )/ /_/ /  /   _  __/   _  / / /_/ /_ |/ |/ / 
/_/    \___//_/ /_//____/ \____//_/    /_/      /_/  \____/____/|__/


WARNING: You are running this container as root, which can cause new files in
mounted volumes to be created as the root user on your host machine.

To avoid this, run the container by specifying your user's userid:

$ docker run -u $(id -u):$(id -g) args...

root@4c8d410e8b57:/# python3
Python 3.6.9 (default, Apr 18 2020, 01:56:04) 
[GCC 8.4.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import tensorflow as tf
>>> print("TensorFlow version {}".format(tf.__version__))
TensorFlow version 2.2.0
>>> print("TensorFlow/Keras version {}".format(tf.keras.__version__))
TensorFlow/Keras version 2.3.0-tf
>>> exit()
root@4c8d410e8b57:/# 
```

There you go!

Do also check
```
$ docker run -it -p 8888:8888 tensorflow/tensorflow:nightly-py3-jupyter
```
It comes with cool tutorials and examples.
