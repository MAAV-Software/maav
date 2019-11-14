#!/bin/bash

# Set command requested; "help" by default
CMD=${1:-help}

# Set argument for command; for now, "build" and "run" use an argument
ARG=$2

# TODO: read this from ~/.maavrc
# Set the directory of the MAAV repository on this machine
# Note: this will be the directory of this script
MAAV_DIR=$(dirname "$0")

# Run the built MAAV code
function run() {
    # Change to the MAAV directory
    cd $MAAV_DIR

    # Get the action we are running; docker-compose by default
    ACTION=${1:-docker-compose run --rm maav-run}

    # TODO Run action
}

# Delete the following folders:
# * software/bin   - Contains executable files built from source
# * software/lib   - Contains MAAV libraries, not third party libraries
# * software/build - Contains build data
function nuke() {
    echo "Removing $MAAV_DIR/software/bin"
    rm -rf $MAAV_DIR/software/bin
    echo "Removing $MAAV_DIR/software/lib"
    rm -rf $MAAV_DIR/software/lib
    echo "Removing $MAAV_DIR/software/build"
    rm -rf $MAAV_DIR/software/build
}

# Print script usage
function print_help() {
    echo "Usage: maav [command]"
    echo -e "Commands:"
    echo -e "\thelp\t\tPrint this help text"
    echo -e "\twhere\t\tDisplay location of maav directory"
    echo -e "\tbuild\t\tBuild maav software"
    echo -e "\tclean\t\tRun make clean"
    echo -e "\tnuke\t\tDelete build directories"
    echo -e "\trun [exe]\tRun a compiled executable"
}

# Print the location of the MAAV directory
function print_where() {
    echo $MAAV_DIR
}

# Read command, and call appropriate function
if [ $CMD == "where" ]; then
    print_where
elif [ $CMD == "build" ]; then
    run build $ARG
elif [ $CMD == "clean" ]; then
    run clean
elif [ $CMD == "nuke" ]; then
    nuke
elif [ $CMD == "run" ]; then
    run $ARG
else
    print_help
fi
