#!/bin/bash
NODE_NAME="node-jenkins"
DOCKER_NAME="sbmvt-jenkins"
VOLUME_DATA='/var/lib/boot2docker/docker_data/jenkins'
eval $(docker-machine env $NODE_NAME)
last_id=$(docker ps -l -q)
docker rm -f $last_id
docker run --rm --name $DOCKER_NAME -v "$VOLUME_DATA":/var/jenkins_home -p 8080:8080 -p 50000:50000 -d jenkins/jenkins:2.76-alpine
