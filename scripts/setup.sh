#!/bin/bash

apt-get update -y
apt-get dist-upgrade
DEBIAN_FRONTEND=noninteractive apt-get install \
                git \
                cmake \
                unzip \
                software-properties-common \
                python-software-properties \
                cmake-curses-gui \
                clang-format \
                libyaml-cpp-dev \
                curl \
                wget \
                libcurl4-openssl-dev \
                ffmpeg \
                libglew-dev \
                libboost-test-dev \
                libboost-program-options-dev \
                libev-dev \
                doxygen \
                libgtkmm-3.0-dev \
                libudev-dev \
                libglm-dev \
                libusb-1.0-0-dev \
                libusb-1.0-doc \
                libusb-1.0-0-dbg \
                python3 \
                python3-pip \
                libvtk6-dev \
                libopenni2-dev \
                sl -y # system libraries

# Install custom deps
/scripts/install/install-cmake.sh
/scripts/install/install-g++7.sh
/scripts/install/install-zcm.sh
/scripts/install/install-lcm.sh
/scripts/install/install-eigen.sh
/scripts/install/install-rapidjson.sh
/scripts/install/install-sophus.sh
/scripts/install/install-pangolin.sh
/scripts/install/install-librealsense.sh
/scripts/install/install-pcl.sh
/scripts/install/install-opencv3.sh
/scripts/install/install-apriltag.sh
/scripts/install/install-octomap.sh
/scripts/install/install-qt5.sh
/scripts/setup_sim.sh