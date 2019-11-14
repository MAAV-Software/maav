#!/bin/bash

# Get directory of the bash script, which is the MAAV directory
MAAV_DIR=$(dirname "$0")

# Ask for confirmation of uninstallation; make user type "uninstall"
read -p "Are you sure you want to uninstall? Type \"uninstall\": " -r
if [ $REPLY != "uninstall" ]
then
    exit 1
fi

echo "Starting Uninstall"

echo "Deleting Software Folder..."
rm -rf $MAAV_DIR/software/
rm -rf $MAAV_DIR/Software/

echo "Deleting Docker image"
docker image rm maav-software
