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
