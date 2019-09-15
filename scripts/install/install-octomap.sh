#!/bin/bash
#
# Install apriltag to third party

apt-get install libqglviewer-dev -y

cd /tmp
git clone https://github.com/OctoMap/octomap.git
cd octomap
git checkout v1.9.0

mkdir -p build
cd build
cmake ..    \
    -DCMAKE_BUILD_TYPE=Release  \
    -DOCTOVIS_QT5=ON    \
    -DOCTOMAP_OMP=ON

# Install
num_procs_avail=$(($(grep -c ^processor /proc/cpuinfo)-1))
make -j$((num_procs_avail > 1 ? num_procs_avail : 1))
make install