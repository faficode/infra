#!/usr/bin/env bash

host=$1

java -jar jenkins-cli.jar -s http://$host/ \
-auth "$JENKINS_USER_ID:$JENKINS_USER_PW" list-credentials-as-xml $1
