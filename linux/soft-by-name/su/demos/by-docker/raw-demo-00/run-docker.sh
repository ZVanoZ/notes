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

#--entrypoint bash
#--entrypoint sh
function do_demo() {
  local IMAGE_NAME="$1"
  local entrypoint="$2"
  if [ '' == "${entrypoint}" ];then
    entrypoint='bash'
  fi
  echo '-- do_demo      : ' "$*"
  echo '-- IMAGE_NAME   : ' "${IMAGE_NAME}"
  echo '-- entrypoint   : ' "${entrypoint}"

  docker run --rm -it \
    --env IS_DOCKER='T' \
    --env IMAGE_NAME="${IMAGE_NAME}" \
    --env GIT_TOKEN='glpat-*' \
    --volume "$PWD/volume":/volume \
    --workdir "/volume" \
    --entrypoint "${entrypoint}" \
    "${IMAGE_NAME}" \
    '/volume/in-docker-demo.sh'
}

do_demo 'php:8.1-apache'
#do_demo 'ubuntu:latest'

#do_demo 'hello-world:latest' 'ls'   # https://hub.docker.com/_/hello-world
# ERR: "bash": executable file not found in $PATH: unknown.

#------------------------------------------------------------------------------
