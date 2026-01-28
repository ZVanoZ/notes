#!/bin/bash

clear
imageNameFull='local.delme'
IMAGE_BUILD_AT="$(date +%Y-%m-%d_%H-%M-%S)"
echo "# IMAGE_BUILD_AT: '${IMAGE_BUILD_AT}'"
docker  --debug build --progress plain --no-cache \
  --build-arg IMAGE_BUILD_AT="${IMAGE_BUILD_AT}" \
  --tag "${imageNameFull}" \
  ./