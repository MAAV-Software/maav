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

.PHONY: build
.PHONY: bash
.PHONY: run-all
.PHONY: clean
.PHONY: nuke
