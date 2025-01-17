#!/bin/bash

function echo_debug() {
  if [ ! "${CI_DEBUG_TRACE}" = 'true' ]; then
    return 0;
  fi
  eval "echo $*"
  return 0
}

