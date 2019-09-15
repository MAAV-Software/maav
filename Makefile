build:
	mkdir -p /software/build && cd /software/build && cmake .. && make -j

ls: 
	ls /usr/local/lib

run-all:
	./maav-software/bin/maav-exec

apt:
	apt-get search rapidjson

clean:
	rm -r maav-software/bin; rm -r maav-software/lib; cd maav-software/build && make clean

.PHONY: build
.PHONY: run
.PHONY: clean