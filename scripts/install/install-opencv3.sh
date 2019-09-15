#!/bin/bash
#
# Install OpenCV 3.3.1 on your machine

apt-get install libcurl4-openssl-dev gcc-5 -y
apt-get install python python-pip -y

# Install numpy
python -m pip install numpy

# Clone OpenCV and the contrib modules
cd /tmp
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git

# Checkout version 3.3.1
cd opencv_contrib
git checkout tags/3.3.1
mv modules/dnn_modern/CMakeLists.txt \
   modules/dnn_modern/CMakeLists.txt.bak
cd ../opencv
git checkout tags/3.3.1

# Build and install - this will take a lot of space and time
mkdir build
cd build

cmake -D BUILD_PNG=ON \
      -D BUILD_JPEG=ON \
      -D BUILD_ZLIB=ON \
      -D OPENCV_CXX11=ON \
      -D OPENCV_EXTRA_MODULES_PATH='/tmp/opencv_contrib/modules' \
      -D CMAKE_BUILD_TYPE='Release' \
      -D BUILD_EXAMPLES=OFF \
      -D BUILD_DOCS=OFF \
      -D BUILD_PERF_TESTS=OFF \
      -D BUILD_TESTS=OFF \
      -D CUDA_HOST_COMPILER:FILEPATH=/usr/bin/gcc-5 \
      ..

num_procs_avail=$(($(grep -c ^processor /proc/cpuinfo)-1))
make -j$((num_procs_avail > 1 ? num_procs_avail : 1))

make install
