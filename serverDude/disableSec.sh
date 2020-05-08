#!/usr/bin/env bash

host=$1

cat ../vars/disableSec.groovy | java -jar jenkins-cli.jar -s http://$host/ -auth "$JENKINS_USER_ID:$JENKINS_USER_PW" groovy =
