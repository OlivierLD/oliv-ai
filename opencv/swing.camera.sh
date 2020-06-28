#!/usr/bin/env bash
CP=./build/libs/opencv-1.0-all.jar
CP="$CP:/usr/local/Cellar/opencv/4.3.0_5/share/java/opencv4/opencv-430.jar" # Mac
# CP="$CP:/usr/local/share/java/opencv4/opencv-430.jar" # RPi
JAVA_LIB_PATH="/usr/local/Cellar/opencv/4.3.0_5/share/java/opencv4" # For Mac
# JAVA_LIB_PATH="/usr/local/share/java/opencv4" # RPi
CLASS=oliv.opencv.OpenCVSwingCamera
#
# For MacOS Catalina, does not work :(
# JAVA_OPTS="-DOPENCV_AVFOUNDATION_SKIP_AUTH=1"
JAVA_OPTS="-Dinput.source=file:///Users/olivierlediouris/repos/oliv-ai/opencv/images/birds/java.sparrows.jpg"
#
java -cp ${CP} -Djava.library.path=${JAVA_LIB_PATH} ${JAVA_OPTS} ${CLASS}
