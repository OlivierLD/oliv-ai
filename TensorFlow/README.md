### TensorFlow
Getting started...

- [TensorFlow](https://www.tensorflow.org/)
- [Install](https://www.tensorflow.org/install/)
- [Install for Java](https://www.tensorflow.org/install/install_java) (May 2020, Java version lagging behind...)
- [Samples](https://github.com/tensorflow/tensorflow/blob/r1.8/tensorflow/java/src/main/java/org/tensorflow/examples/LabelImage.java) (Git Repo)

> _Note_: There are also Docker images available.

I used Gradle, see the `build.gradle` file.

To run the LabelImage sample: 
```sh
$ curl -O https://storage.googleapis.com/download.tensorflow.org/models/inception5h.zip
```
Unzip it, then run
```
$ ./labelimage.sh ./inception5h ./img/mug.jpeg 
```
