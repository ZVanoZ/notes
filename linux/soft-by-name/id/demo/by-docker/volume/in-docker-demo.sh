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
function do_init() {
    echo "-- do_init ..."
    local cmdList=()
    if [ '' != "$(getent passwd  www-data)" ]; then
      echo '@SKIP: add user "www-data" (already exists)'
      id www-data
    else
      cmdList+=('useradd -m www-data')
      cmdList+=("getent passwd root")
    fi
    cmdList+=("getent passwd  www-data")
    for cmd in "${cmdList[@]}"
    do
      echo ''
      echo "#RUN: ${cmd}"
      eval "${cmd}"
      res=$?
      echo "#RES: <${res}>"
    done
    return 0
}

function do_demo_eval() {
    local cmdList=()
    cmdList+=("echo \"\$PWD\"")
    cmdList+=("echo ls -la")
    cmdList+=("bash show-user-info.sh")
    cmdList+=("getent passwd root")
    cmdList+=("getent passwd www-data")
    cmdList+=('su - www-data -c id')
    cmdList+=("su - www-data -c whoami")
    cmdList+=('su - www-data -c "bash /volume/show-user-info.sh"')

    for cmd in "${cmdList[@]}"
    do
      echo ''
      echo "#RUN: ${cmd}"
      eval "${cmd}"
      res=$?
      echo "#RES: <${res}>"
    done
    
}

if [  'T' != "${IS_DOCKER=}" ];then
  echo '@WARN: Run this file by docker. Use ../run-docker.sh script'
  exit 1
fi
#cd /volume
do_init
do_demo_eval

#------------------------------------------------------------------------------

exit 0