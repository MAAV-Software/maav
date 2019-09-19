#!/bin/bash

# Install dependencies

cd /tmp
git clone https://github.com/Tencent/rapidjson.git
git checkout fcec7735dcfa3a1ddf7715b2482587bc706f62cb

cd rapidjson
mkdir build
cd build
cmake ..
make install