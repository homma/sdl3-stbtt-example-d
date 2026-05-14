#!/bin/sh -x

ROOT_DIR=$(dirname $0)/..

cd ${ROOT_DIR}

export SDL_INC_PATH=$(pkg-config sdl3 --cflags-only-I | sed 's/^-I//')

dub build
