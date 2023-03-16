#!/bin/sh

docker run \
    -e R_DEST=/mnt/dest \
    -e R_INTERVAL=10 \
    -e R_SRC=/mnt/src \
    -v `pwd`/folder-dest:/mnt/dest \
    -v `pwd`/folder-src:/mnt/src figaw/rsync
