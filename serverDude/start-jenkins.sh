#!/bin/bash

machine=$1
user=$2
key=$3

python3 serverDudePlainDocker.py jenkins $machine $user $key
