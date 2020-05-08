#!/usr/bin/env bash

host=$1

cat ../provision/seed.xml | java -jar jenkins-cli.jar -s http://$host/ -auth "$JENKINS_USER_ID:$JENKINS_USER_PW" create-job seed
