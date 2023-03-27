#!/bin/sh

NCHAN_VERSION=1.3.6

docker build -t "phelimxue/nchan:${NCHAN_VERSION}-alpine" .
