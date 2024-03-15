#!/bin/bash

workingDirectory="/home/pinossaur/pinoptserver/scripts/"
dockerDirectory="/home/pinossaur/pinoptserver/bancho.py/"

docker-compose -f "$dockerDirectory"docker-compose.yml up -d

cd $workingDirectory
./wait-for-it.sh -h localhost -p 10000 -s -t 3 -q