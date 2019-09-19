#!/bin/bash
#
# Install ZCM
# Author: Romario Pashollari (rpash)
#         Cheng Jiang (chengjia)

# Set JAVA_HOME path
grep -q JAVA_HOME ~/.bashrc /etc/environment || \
    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

# Download ZCM
cd /tmp 
git clone https://github.com/ZeroCM/zcm.git zcm
cd zcm
git checkout b1d4d838f7ef990fdeb6d13125fed1f4e61e4adb

# Install ZCM dependencies (their script to do this sucks)
apt-get install wget \
                pkg-config \
                build-essential \
                libzmq3-dev \
                default-jdk \
                default-jre \
                python \
                python-pip \
                libelf-dev \
                libelf1 \
                cxxtest \
                clang -y

# Use pip from python to avoid pip __main__ bug
python -m pip install --upgrade pip
python -m pip install Cython

# Install ZCM
# ./scripts/install-deps.sh
./waf configure --use-java --use-python --use-zmq --use-elf --use-third-party \
    --use-inproc --use-ipc --use-udpm --use-serial
./waf build
./waf install

# Set JAVA_HOME, PATH, LD_LIBRARY_PATH in .bashrc
grep -q JAVA_HOME ~/.bashrc /etc/environment || \
    echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> ~/.bashrc
grep -q 'export PATH=$JAVA_HOME/bin:$PATH' ~/.bashrc /etc/environment || \
    echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc
grep -q 'export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib' ~/.bashrc /etc/environment || \
    echo 'export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib' >> ~/.bashrc
source ~/.bashrc
