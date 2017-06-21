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
replicas=${REPLICAS:-0}

echo "ARTIFACT_LABEL: ${artifactLabel}"

REPLICAS=${replicas} ENV=${env} AUTHOR=${author} NAME=${name} \
TAG=${version}-${artifactLabel} \
ssh -A read@swarmm-master-12315180-0 "docker stack deploy -c docker-compose.yml ${name}-${env}"