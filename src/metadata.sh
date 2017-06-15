#!/bin/ash
# return version
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cat ${parent_path}/package.json| jq '{name: .name , version: .version, author: .author}'