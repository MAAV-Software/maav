#!/bin/bash

# Install deps
apt-get install gfortran libc++-dev libgoogle-glog-dev libatlas-base-dev libsuitesparse-dev

cd /tmp
git clone https://ceres-solver.googlesource.com/ceres-solver ceres-solver
cd ceres-solver
git reset --hard afe93546b67cee0ad205fe8044325646ed5deea9
mkdir build
cd build
cmake -DCXX11=On -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DOPENMP=Off ..
make -j3
make install

cd /tmp
git clone https://github.com/strasdat/Sophus.git
cd Sophus 
git checkout 96d109d3079df93cf1561dbcbb551f12e374e149

mkdir build
cd build
cmake ..
make
make install