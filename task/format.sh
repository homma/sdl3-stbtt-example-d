#!/bin/sh -x

ROOT_DIR=$(dirname $0)/..

cd ${ROOT_DIR}

if [ -z "${1}" ]
  then
    file=$(find . -name '*.d')
  else
    file=${1}
fi

dub run dfmt -- -i ${file}
