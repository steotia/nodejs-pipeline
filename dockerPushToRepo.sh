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

docker login -usteotia -p`cat /run/secrets/hub-pass`
docker push ${author}/${name}:${version}-release
docker push ${author}/${name}:${version}-bronze
docker logout