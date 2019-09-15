#!/bin/bash
# Installs g++-7 so that std=c++17 things can be used

add-apt-repository ppa:ubuntu-toolchain-r/test -y
apt-get update -y
apt-get install gcc-7 g++-7 -y

update-alternatives --remove-all gcc 
update-alternatives --remove-all g++

update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 1
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 1
update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 2
update-alternatives --set cc /usr/bin/gcc
update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 3
update-alternatives --set c++ /usr/bin/g++