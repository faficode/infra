#!/usr/bin/env bash

host=$1

cat ../vars/enableSec.groovy | java -jar jenkins-cli.jar -s http://$host/ -auth "$JENKINS_USER_ID:$JENKINS_USER_PW" groovy = $JENKINS_USER_PW
