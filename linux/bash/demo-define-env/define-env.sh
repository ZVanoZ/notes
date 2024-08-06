#!/bin/bash

function doWork() {
  local scriptPath="$(realpath "${BASH_SOURCE[0]}")"
  local scriptDir="$(dirname $(realpath "${BASH_SOURCE[0]}"))"

  # -----------------------------------------------------------------------------

  if [ "${APP_DIR}" = '' ];then
    export APP_DIR="${scriptDir}"
#    set env APP_DIR="${APP_DIR}"
    echo "@INFO: set APP_DIR=${APP_DIR}"
  else
    echo "@INFO: APP_DIR is already exists"
  fi

  # -----------------------------------------------------------------------------

  echo '------------'
  echo "scriptPath : ${scriptPath}"
  echo "scriptDir  : ${scriptDir}"
  echo "APP_DIR    : ${APP_DIR}"
  echo '------------'

  # -----------------------------------------------------------------------------

  return 0
}

doWork

