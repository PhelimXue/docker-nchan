#!/bin/sh

NCHAN_VERSION=1.3.7

docker build -t "phelimxue/nchan:${NCHAN_VERSION}-alpine" .
