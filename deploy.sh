#!/bin/sh
# Build script
# set -o errexit
e () {
    echo $( echo ${1} | jq ".${2}" | sed 's/\"//g')
}
m=$(./src/metadata.sh)

author=$(e "${m}" "author")
name=$(e "${m}" "name")
version=$(e "${m}" "version")

artifactLabel=${ARTIFACT_LABEL:-bronze}
env=${ENV:-null}
hostPort=${HOST_PORT}
containerPort=${CONTAINER_PORT}

echo "artifactLabel:  ${artifactLabel}"
echo "env:            ${env}"
echo "author:         ${author}"
echo "name:           ${name}"
echo "version:        ${version}"

CONTAINER_PORT=${containerPort} APP_PORT=${hostPort} ENV=${env} AUTHOR=${author} NAME=${name} \
TAG=${version}-${artifactLabel} \
docker -H tcp://${MANAGER_IP} stack deploy -c docker-compose.yml ${name}-${env}