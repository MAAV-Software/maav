build:
	mkdir -p /software/build && cd /software/build && cmake .. && make -j7

bash:
	/bin/bash

run-all:
	./maav-software/bin/maav-exec

clean:
	rm -r /software/bin; rm -r /software/lib; cd /software/build && make clean

nuke:
	cd; rm -r /software/bin; rm -r /software/lib; rm -r /software/build

# Temporary command to build gazebo and px4 firmware until this is in setup_sim.sh
# Only call this from within the docker container - make sure you have the new image
setup-sim:
	pwd
	cd /PX4Firmware
	num_procs_avail=$(($(grep -c ^processor /proc/cpuinfo)-1))
	make posix_sitl_default gazebo -j$((num_procs_avail > 1 ? num_procs_avail : 1))


.PHONY: build
.PHONY: bash
.PHONY: run-all
.PHONY: clean
.PHONY: nuke
.PHONY: setup-sim
