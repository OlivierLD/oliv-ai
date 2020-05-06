#!/usr/bin/env bash
CP=./build/libs/opencv-1.0-all.jar
CP="$CP:/usr/local/Cellar/opencv/4.1.0_2/share/java/opencv4/opencv-410.jar" # Mac
# CP="$CP:/usr/local/share/java/opencv4/opencv-430.jar" # RPi
JAVA_LIB_PATH="/usr/local/Cellar/opencv/4.1.0_2/share/java/opencv4" # For Mac
# JAVA_LIB_PATH="/usr/local/share/java/opencv4" # RPi
CLASS=oliv.opencv.OpenCVSwingCamera
#
java -cp ${CP} -Djava.library.path=${JAVA_LIB_PATH} ${CLASS}
