#!/bin/bash
# Build script
e () {
    echo $( echo ${1} | jq ".${2}" | sed 's/\"//g')
}

m=$(./src/metadata.sh)

author=$(e "${m}" "author")
name=$(e "${m}" "name")
version=$(e "${m}" "version")

docker build -f ./Dockerfile.build -t ${author}/${name}:${version}-build .