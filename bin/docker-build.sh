#!/bin/sh
#This script is used to build the project specific image
cd ..
docker build --rm=true -t "my-image"  .
