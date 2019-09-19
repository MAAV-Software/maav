# maav
Container for all MAAV software

## Install
This repo will set up a software environment for MAAV using docker.

Simply run

````
./maav-init.sh
```

to install docker, pull the software repo, and build the docker image.

Once the MAAV Software repo is pulled you may want to add your fork as
a remote. This can be done using

```
git remote add <remote name> <URL to your fork>
```

For Windows install instructions see [here](https://docs.docker.com/docker-for-windows/install/)

For MacOS install instructions see [here](https://docs.docker.com/docker-for-mac/install/)

## Running
To run a particular command, you may either directly attach a bash terminal
to the docker container using 

```
ACTION=bash docker-compose run --rm maav-run
```

or you can modify the Makefile and run 

```
ACTION=<CMD> docker-compose run --rm maav-run
```

where `<CMD>` is the name of the build rule you specified in the Makefile.
