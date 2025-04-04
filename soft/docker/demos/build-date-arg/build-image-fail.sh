#!/bin/bash

clear
imageNameFull='local.delme'
docker  --debug build --progress plain --no-cache \
  --tag "${imageNameFull}" \
  ./