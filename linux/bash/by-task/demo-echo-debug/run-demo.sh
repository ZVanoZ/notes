#!/bin/bash

set -e

scriptDir="$(dirname $(realpath "${BASH_SOURCE[0]}"))"
pathDefFile="${scriptDir}/define-debug.sh"
echo "scriptDir   : ${scriptDir}"
echo "pathDefFile : ${pathDefFile}"

. "$(dirname $(realpath "${BASH_SOURCE[0]}"))/define-debug.sh"

echo_debug 'a' 'b' 'c'

CI_DEBUG_TRACE=true
echo_debug '1' '2' 3
echo_debug 3 2 '1'