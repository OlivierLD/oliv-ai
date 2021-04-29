#!/usr/bin/env bash
CP=./build/libs/opencv-1.0-all.jar
JAVA_LIB_PATH=
DARWIN=$(uname -a | grep Darwin)  # Mac ?
SUDO=
# Paths can be different...
if [[ "$DARWIN" != "" ]]
then
  echo -e "Running on MacOS: ${DARWIN}"
  echo -e "+------------------------------------------------------------------+"
  echo -e "| Note: If this does not work, try '../gradlew runOlivSwingCamera' |"
  echo -e "+------------------------------------------------------------------+"
  echo -en "Hit [return] > "
  read a
  # SUDO="sudo "
  # export JAVA_HOME=$(/usr/libexec/java_home -v 11.0.7)
  CP="$CP:/usr/local/share/java/opencv4/opencv-450.jar" # Mac
  JAVA_LIB_PATH="/usr/local/share/java/opencv4/"        # For Mac
else  # Assume Raspberry Pi
  SUDO="sudo "
  CP="$CP:/usr/local/share/java/opencv4/opencv-450.jar" # RPi
  JAVA_LIB_PATH="/usr/local/share/java/opencv4"         # RPi
fi
#CP="$CP:/usr/local/Cellar/opencv/4.3.0_5/share/java/opencv4/opencv-430.jar" # Mac
## CP="$CP:/usr/local/share/java/opencv4/opencv-430.jar" # RPi
#JAVA_LIB_PATH="/usr/local/Cellar/opencv/4.3.0_5/share/java/opencv4" # For Mac
## JAVA_LIB_PATH="/usr/local/share/java/opencv4" # RPi
#
CLASS=docai.opencv.OpenCVSwingCamera
#
# For MacOS Catalina, does not work from the CLI :(
# JAVA_OPTS="-DOPENCV_AVFOUNDATION_SKIP_AUTH=1"
export OPENCV_AVFOUNDATION_SKIP_AUTH=1
#
JAVA_OPTS="-Dinput.source=CAMERA"
# JAVA_OPTS="-Dinput.source=file:///Users/olivierlediouris/repos/oliv-ai/opencv/images/birds/puffin.3.jpg"
# JAVA_OPTS="$JAVA_OPTS -Dcamera.id=0"
#
REMOTE_DEBUG_FLAGS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
#
# JAVA_OPTS="${JAVA_OPTS} ${REMOTE_DEBUG_FLAGS}"
COMMAND="${SUDO}java -cp ${CP} -Djava.library.path=${JAVA_LIB_PATH} ${JAVA_OPTS} ${CLASS}"
echo -e "Running ${COMMAND}"
${COMMAND}

