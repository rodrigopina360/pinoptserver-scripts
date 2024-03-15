#!/bin/bash

action=""
workingDirectory="/home/pinossaur/pinoptserver/scripts/"

if [ "$1" == "" ]
then
    printf "No argument passed, stopping...\n"
    exit 2
fi


if [ "$1" == "start" ]
then
    cd "$workingDirectory"start
    action="Starting"
fi

if [ "$1" == "stop" ]
then
    cd "$workingDirectory"stop
    action="Stopping"
fi

if [ "$1" == "restart" ]
then
    ./server_manager.sh stop
    printf "\n"
    ./server_manager.sh start
    exit 0
fi

printf "$action bpy and dependencies.\n"

./bpy.sh

if [ "$?" -ne "0" ]
then
    if [ "$1" == "start" ]
    then
        printf "\nbpy failed to launch, stopping...\n"
        cd $workingDirectory
        ./server_manager.sh stop
        exit 1
    fi
fi

printf "\n$action guweb\n"
./guweb.sh

if [ "$?" -ne "0" ]
then
    if [ "$1" == "start" ]
    then
        printf "\nguweb failed to launch, stopping...\n"
        cd $workingDirectory
        ./server_manager.sh stop
        exit 1
    fi
fi

printf "\n$action giuseppe and dependencies.\n"
./giuseppe.sh

if [ "$?" -ne "0" ]
then
    if [ "$1" == "start" ]
    then
        printf "\ngiuseppe failed to launch\n"
        exit 1
    fi
fi

printf "\n$action scripts successful!\n"