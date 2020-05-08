#!/usr/bin/env bash

machine=$1
user=$2
key=$3

python3 serverDudePlainDocker.py stop jenkins $machine $user $key

python3 serverDudePlainDocker.py rm jenkins $machine $user $key

ssh -i $key $user@$machine -- "
rm -rf /opt/cd/jenkins/*
ls -l /opt/cd/jenkins
docker ps
"
