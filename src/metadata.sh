#!/bin/sh
# return version
parent_path=$( cd "$(dirname "$0")" ; pwd -P )
cat ${parent_path}/package.json| jq '{name: .name , version: .version, author: .author}'