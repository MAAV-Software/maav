#!/bin/bash

apt-get install libusb-1.0-0-dev pkg-config -y
apt-get install libglfw3-dev -y

cd /tmp/
git clone -b 'v2.19.0' https://github.com/IntelRealSense/librealsense.git
cd librealsense/

# For people who have built-in cameras on their device
# These three lines must be run first for the kernel patches to
# go through
modprobe -r uvcvideo
modprobe -r videobuf2_core
modprobe -r videodev

cp config/99-realsense-libusb.rules /etc/udev/rules.d/
udevadm control --reload-rules && udevadm trigger
apt-get install libssl-dev -y
./scripts/patch-realsense-ubuntu-lts.sh

mkdir build && cd build
cmake ../

make
make install

echo "YEE. Have a nice day! =)"