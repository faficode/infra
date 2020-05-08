#!/usr/bin/env bash

machine=$1
user=$2
key=$3

python3 serverDudePlainDocker.py createAndStart jenkins $machine $user $key

ssh -i $key $user@$machine -- "
#cp -r /opt/jenkins-plugins /opt/cd/jenkins/plugins
ls -l /opt/cd/jenkins
ls -l /opt/cd/jenkins/plugins
docker ps
"