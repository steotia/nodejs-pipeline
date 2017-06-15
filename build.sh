#!/bin/ash
# Build script
# set -o errexit
e () {
    echo $( echo ${1} | jq ".${2}" | sed 's/\"//g')
}

m=$(./src/metadata.sh)

author=$(e "${m}" "author")
name=$(e "${m}" "name")
version=$(e "${m}" "version")

docker build -f ./Dockerfile.build -t ${author}/${name}:${version}-build . && \
docker create --name=${name}-${version}-build ${author}/${name}:${version}-build cat && \
rm -rf ./dist && \
docker cp ${name}-${version}-build:/opt/app/dist ./dist && \
docker rm ${name}-${version}-build