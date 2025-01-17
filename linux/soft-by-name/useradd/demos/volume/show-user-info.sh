#!/bin/bash

#------------------------------------------------------------------------------
echo ''
echo "$(printf '\x2D%.0s' {1..80})"
echo "-- BEG: script      : '$(realpath ${BASH_SOURCE[0]})'             "
echo "-- script-dir       : '$(dirname $(realpath \"${BASH_SOURCE[0]}\"))'  "
echo "-- id               : '$(id)'                                         "
echo "-- whoami           : '$(whoami)'                                     "
echo "-- \${HOME}         : '$(HOME)'                                       "
echo "-- \$(realpath ~)   : '$(realpath ~)'                                 "
echo "-- pwd              : '$(realpath \"${PWD}\")'                        "
echo ''
#----------------------------------------------------------------------------

cmdList=()
cmdList+=("pwd")
cmdList+=("whoami")

cmdList+=("echo \"HOME=\"\$HOME\"\"")
cmdList+=("echo \"~: '$(realpath ~)'\"")
cmdList+=("env")
cmdList+=("set")
cmdList+=('echo $UID')
cmdList+=('echo $GROUPS')

for cmd in "${cmdList[@]}"
do
  echo ''
  echo "#RUN: ${cmd}"
  eval "${cmd}"
  res=$?
  echo "#RES: <${res}>"
done

#------------------------------------------------------------------------------

echo "--    : moment     : $(date +%Y-%m-%dT%T.%3N)"
echo '--    : pwd        : '$(realpath "${PWD}")
echo '--    : script-dir : '$(dirname $(realpath "${BASH_SOURCE[0]}"))
echo '-- END: script     : '$(realpath "${BASH_SOURCE[0]}")
echo "$(printf '\x2D%.0s' {1..80})"

#------------------------------------------------------------------------------
#exit