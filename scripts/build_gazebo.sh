#!/bin/bash

# Run this command from the container only to build the PX4 firmware.
# This will launch a PX4 shell, so once the command stops running you can
# CTRL+C or exit. To save the build files, docker commit your container
cd /PX4Firmware
num_procs_avail=$(($(grep -c ^processor /proc/cpuinfo)-1))
make posix_sitl_default gazebo -j$((num_procs_avail > 1 ? num_procs_avail : 1))
