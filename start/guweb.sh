#!/bin/bash

workingDirectory="/home/pinossaur/pinoptserver/scripts/"
pythonDirectory="/home/pinossaur/pinoptserver/guweb/"

nohup python3 "$pythonDirectory"main.py > /dev/null 2>&1 &

cd $workingDirectory
./wait-for-it.sh -h localhost -p 8000 -s -t 3 -q
