#!/bin/bash

# --arg aaa='aaaval' \
  #
docker run --rm -it \
  --env IS_DOCKER='T' \
  --volume "$PWD/volume":/volume \
  --workdir "/volume" \
  ubuntu:latest \
  bash /volume/in-docker-demo.sh

