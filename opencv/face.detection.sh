#!/usr/bin/env bash
CP=./build/classes/java/main
CP="$CP:./build/libs/opencv-1.0-all.jar"
#
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
#
# CLASS=oliv.opencv.FaceRecognitionSample
CLASS=docai.opencv.FaceRecognitionSample
#
java -cp ${CP} -Djava.library.path=${JAVA_LIB_PATH} ${CLASS}
