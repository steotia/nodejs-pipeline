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

docker push ${author}/${name}:${version}-release