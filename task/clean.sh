#!/bin/sh -x

ROOT_DIR=$(dirname $0)/..

cd ${ROOT_DIR}

rm sdl3-stbtt-example-d
dub clean
