#!/bin/bash

echo "Installing Docker"
sudo apt update
sudo apt install docker docker-compose git

sudo systemctl start docker
sudo systemctl enable docker

sudo groupadd docker
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock

echo "Cloning MAAV Software repo"
git clone https://www.github.com/MAAV-Software/software.git

echo "Building Docker image"
docker build -t maav-software .

# TODO:
#
# Make the Makefile in this dir a volume as well so the image does not 
# have to be rebuilt
#
# Fix the CMakeLists [FML FML FML FML FML FML FML FML FML FML]
#
# Create a maav script with the following commands:
# maav help: display help text
# maav build: build maav software in docker
# maav clean: call make clean on docker and remove bin and lib
# maav nuke: nuke build, bin, and lib
# maav run [service]: Run the selected service
#   - Services are specified in the docker-compose.yml file
#   - Users can add new services to that file and run them from `maav`
#
# The docker stuff should be in its own repo
# Users should be able to just clone it, then run make && make install. 
# This will 
#   - Download all dependencies for docker
#   - Clone the software repo
#   - Build the maav-software image
#   - Install the maav script into user specified prefix [/usr/bin]
#   - Install .maav file in home for config (location of software, etc)
# make uninstall will undo all this
#
# By that point, the user can just use the maav [cmd] [arg] commands
# to build and run anything
#
# Init script should work for Debian and Arch based distros at least. 
# Will add MacOS and Winblows as well if it is not too much trouble
# otherise, they will manually have to set up docker on their machine
#
# Consider using supervisord instead of jank Makefile

# maav
#   docker
#       software
#           Dockerfile
#           docker-compose.yml
#           Makefile
#       embedded
#           Dockerfile
#           docker-compose.yml
#           Makefile
#   [software]
#   [embedded]
#   scripts
#       software
#           [Software Setup Scripts]
#       embedded
#           [Embedded Setup Scripts]
#       misc
#           [Setup scripts for this repo]
#   Makefile
#   README.md
#   .gitignore