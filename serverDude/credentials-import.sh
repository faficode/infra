#!/usr/bin/env bash

host=$1

cat ../provision/credentials.xml | envsubst '$BITBUCKET_KEY_READ' | java -jar jenkins-cli.jar -s http://$host/ \
-auth "$JENKINS_USER_ID:$JENKINS_USER_PW" import-credentials-as-xml $1
