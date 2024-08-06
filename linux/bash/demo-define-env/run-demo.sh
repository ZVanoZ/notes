#!/bin/bash


function doWork() {
  set -e

  local scriptPath="$(realpath "${BASH_SOURCE[0]}")"
  local scriptDir="$(dirname $(realpath "${BASH_SOURCE[0]}"))"

  . "${scriptDir}/define-env.sh"

  # -----------------------------------------------------------------------------

  echo '------------'
  echo "scriptPath : ${scriptPath}"
  echo "scriptDir  : ${scriptDir}"
  echo "APP_DIR    : ${APP_DIR}"
  echo '------------'

  # -----------------------------------------------------------------------------

}
echo "$(printf '\x2D%.0s' {1..80})"
echo '-- RUN-1'
doWork

echo "$(printf '\x2D%.0s' {1..80})"
echo '-- RUN-2'
doWork
