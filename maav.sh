#!/bin/bash

CMD=$1
ARG=$2

# TODO: read this from ~/.maavrc
MAAV_DIR=/home/rpash/maav

function run() {
    cd $MAAV_DIR
    ACTION=$1 docker-compose run --rm maav-run
}

function print_where() {
    echo $MAAV_DIR
}

function nuke() {
    if [ -d "$MAAV_DIR/software/bin" ]; then
        echo "Removing $MAAV_DIR/software/bin"
        rm -r $MAAV_DIR/software/bin
    fi
    if [ -d "$MAAV_DIR/software/lib" ]; then
        echo "Removing $MAAV_DIR/software/lib"
        rm -r $MAAV_DIR/software/lib
    fi
    if [ -d "$MAAV_DIR/software/build" ]; then
        echo "Removing $MAAV_DIR/software/build"
        rm -r $MAAV_DIR/software/build
    fi
}

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

if [ $CMD == "help" ]; then
    print_help
elif [ $CMD == "where" ]; then
    print_where
elif [ $CMD == "build" ]; then
    run build $ARG
elif [ $CMD == "clean" ]; then
    run clean
elif [ $CMD == "nuke" ]; then
    nuke
elif [ $CMD == "run" ]; then
    run $ARG
fi