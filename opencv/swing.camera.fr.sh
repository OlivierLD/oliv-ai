#!/usr/bin/env bash
CP=./build/libs/opencv-1.0-all.jar
JAVA_LIB_PATH=
DARWIN=$(uname -a | grep Darwin)  # Mac ?
#
SUDO=
OPENCV_VERSION=4.5.0
# Paths can be different...
if [[ "$DARWIN" != "" ]]
then
  # SUDO="sudo "
  CP="$CP:/usr/local/share/java/opencv4/opencv-450.jar" # Mac
  JAVA_LIB_PATH="/usr/local/share/java/opencv4/"        # For Mac
else  # Assume Raspberry Pi
  CP="$CP:/usr/local/share/java/opencv4/opencv-450.jar" # RPi
  # JAVA_LIB_PATH="/usr/local/share/java/opencv4"         # RPi
  JAVA_LIB_PATH="/home/pi/opencv-${OPENCV_VERSION}/build/lib"         # RPi
fi
#CP="$CP:/usr/local/Cellar/opencv/4.3.0_5/share/java/opencv4/opencv-430.jar" # Mac
## CP="$CP:/usr/local/share/java/opencv4/opencv-430.jar" # RPi
#JAVA_LIB_PATH="/usr/local/Cellar/opencv/4.3.0_5/share/java/opencv4" # For Mac
## JAVA_LIB_PATH="/usr/local/share/java/opencv4" # RPi
#
CLASS=docai.opencv.OpenCVSwingCameraFaceRecognition
# CLASS=docai.opencv.OpenCVContinuousFaceDetection
#
# For MacOS Catalina, does not work :(
# JAVA_OPTS="-DOPENCV_AVFOUNDATION_SKIP_AUTH=1"
JAVA_OPTS="-Dinput.source=CAMERA"
# JAVA_OPTS="-Dinput.source=file:///Users/olivierlediouris/repos/oliv-ai/opencv/images/birds/puffin.3.jpg"
# JAVA_OPTS="-Dinput.source=file:///Users/olivierlediouris/repos/oliv-ai/opencv/snap_2020-09-13T113608.860.jpg"
# JAVA_OPTS="$JAVA_OPTS -Dfr.verbose=true"
#
REMOTE_DEBUG_FLAGS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
#
# JAVA_OPTS="${JAVA_OPTS} ${REMOTE_DEBUG_FLAGS}"
# export JAVA_HOME=$(/usr/libexec/java_home -v 11.0.7)
COMMAND="${SUDO}java -cp ${CP} -Djava.library.path=${JAVA_LIB_PATH} ${JAVA_OPTS} ${CLASS}"
echo -e "Running $COMMAND"
$COMMAND
