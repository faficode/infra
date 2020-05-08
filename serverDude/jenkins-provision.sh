#!/usr/bin/env bash

./enableSec.sh

./credentials-import.sh 'system::system::jenkins'

./provisionSeed.sh
