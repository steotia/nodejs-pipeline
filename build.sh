#!/bin/bash
# Build script
extract () {
    echo $( echo ${1} | jq ".${2}" | sed 's/\"//g')
}

metadata=$(./src/metadata.sh)

author=$(extract "${metadata}" "author")
name=$(extract "${metadata}" "name")
version=$(extract "${metadata}" "version")

docker build -f ./Dockerfile.build -t ${author}/${name}:${version}-build .