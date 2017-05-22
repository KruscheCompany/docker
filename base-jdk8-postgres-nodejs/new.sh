#!/bin/bash

IMAGE_NAME="kruschecompany/base-jdk8-postgres-nodejs"

case "${1}" in
        --build | -b ) docker build --no-cache --rm -t ${IMAGE_NAME} .
        ;;
        --run | -r ) docker run -d -P -t ${IMAGE_NAME}
        ;;
        --help | -h ) printf "usage: ${0} [arg]\n--build,-b\tBuild image\n--run,-r\tRun\n--push,-p\n"
                ;;
        * ) printf "Print ${0} --help for help\n"
                ;;
esac