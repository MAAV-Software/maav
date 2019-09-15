#!/bin/bash

# Install Eigen header library

apt-get install wget unzip libblas-dev

# Download Eigen release 3.3.7
wget https://github.com/eigenteam/eigen-git-mirror/archive/3.3.7.zip -O eigen.zip
unzip eigen.zip
rm eigen.zip
cd eigen-git-mirror-3.3.7

# Insall
mkdir build
cd build
cmake ..
make install