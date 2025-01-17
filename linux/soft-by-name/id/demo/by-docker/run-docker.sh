#!/bin/bash

#------------------------------------------------------------------------------

echo ''
echo "$(printf '\x2D%.0s' {1..80})"
echo '------------------ BEG'
echo '-- $0                : '$0
#echo '-- ${BASH_SOURCE[0]} : '${BASH_SOURCE[0]}
echo '-- whoami            : '"$(whoami)"
echo ''

function onExit() {
  echo ''
  echo '-- whoami             : ' "$(whoami)"
  echo '-- $0                 : '$0
#  echo '-- ${BASH_SOURCE[0]}  : '${BASH_SOURCE[0]}
  echo '------------------ END'
  echo "$(printf '\x2D%.0s' {1..80})"
}
trap 'onExit' EXIT

#----------------------------------------------------------------------------

function do_demo() {
  local IMAGE_NAME="$1"
  docker run --rm -it \
    --env IS_DOCKER='T' \
    --env GIT_TOKEN='glpat-*' \
    --env IMAGE_NAME="${IMAGE_NAME}" \
    --volume "$PWD/volume":/volume \
    --workdir "/volume" \
    "${IMAGE_NAME}" \
    bash /volume/in-docker-demo.sh
}

do_demo 'php:8.1-apache'
#do_demo 'ubuntu:latest'
#------------------------------------------------------------------------------
