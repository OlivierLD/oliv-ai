#!/usr/bin/env bash
cwd=$(pwd)
cvVersion=4.1.0
#
# sudo update-alternatives --config java
#
# export JAVA_HOME=/usr/lib/jvm/java-9-openjdk-armhf
export JAVA_HOME=/usr/lib/jvm/jdk-8-oracle-arm32-vfp-hflt
echo JAVA_HOME=${JAVA_HOME}
export PATH=${JAVA_HOME}/bin:$PATH
ant -version
cd opencv-${cvVersion}/build
# cmake -D CMAKE_BUILD_TYPE=RELEASE \
#       -D CMAKE_INSTALL_PREFIX=$cwd/installation/opencv-"$cvVersion" \
#       -D BUILD_SHARED_LIBS=OFF \
#       -D INSTALL_C_EXAMPLES=ON \
#       -D INSTALL_PYTHON_EXAMPLES=ON \
#       -D WITH_TBB=ON \
#       -D WITH_V4L=ON \
#       -D OPENCV_PYTHON3_INSTALL_PATH=$cwd/opencv-$cvVersion-py3/lib/python3.5/site-packages \
#       -D WITH_QT=ON \
#       -D WITH_OPENGL=ON \
#       -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-$cvVersion/modules \
#       -D BUILD_EXAMPLES=ON ..
#
cmake -DBUILD_SHARED_LIBS=OFF ..
#
make -j$(nproc)
make install
#
