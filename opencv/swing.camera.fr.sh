#!/usr/bin/env bash
CP=./build/libs/opencv-1.0-all.jar
JAVA_LIB_PATH=
DARWIN=$(uname -a | grep Darwin)  # Mac ?
#
if [[ "$DARWIN" != "" ]]
then
  CP="$CP:/usr/local/Cellar/opencv/4.3.0_5/share/java/opencv4/opencv-430.jar" # Mac
  JAVA_LIB_PATH="/usr/local/Cellar/opencv/4.3.0_5/share/java/opencv4"         # For Mac
else  # Assume Raspberry Pi
  CP="$CP:/usr/local/share/java/opencv4/opencv-430.jar" # RPi
  JAVA_LIB_PATH="/usr/local/share/java/opencv4"         # RPi
fi
#CP="$CP:/usr/local/Cellar/opencv/4.3.0_5/share/java/opencv4/opencv-430.jar" # Mac
## CP="$CP:/usr/local/share/java/opencv4/opencv-430.jar" # RPi
#JAVA_LIB_PATH="/usr/local/Cellar/opencv/4.3.0_5/share/java/opencv4" # For Mac
## JAVA_LIB_PATH="/usr/local/share/java/opencv4" # RPi
#
CLASS=oliv.opencv.OpenCVSwingCameraFaceRecognition
#
# For MacOS Catalina, does not work :(
# JAVA_OPTS="-DOPENCV_AVFOUNDATION_SKIP_AUTH=1"
JAVA_OPTS="-Dinput.source=CAMERA"
# JAVA_OPTS="-Dinput.source=file:///Users/olivierlediouris/repos/oliv-ai/opencv/images/birds/puffin.3.jpg"
#
REMOTE_DEBUG_FLAGS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
#
JAVA_OPTS="${JAVA_OPTS} ${REMOTE_DEBUG_FLAGS}"
java -cp ${CP} -Djava.library.path=${JAVA_LIB_PATH} ${JAVA_OPTS} ${CLASS}
