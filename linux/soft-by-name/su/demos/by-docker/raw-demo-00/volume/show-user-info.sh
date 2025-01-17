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
echo '-- $*                : '$*
echo '-- IMAGE_NAME        : '"${IMAGE_NAME}"
echo '-- IS_DOCKER         : '"${IS_DOCKER}"
echo '-- GIT_TOKEN         : '"${GIT_TOKEN}"
echo '-- HOME              : '"${HOME}"
echo '-- PATH              : '"${PATH}"

function do_demo() {
  local cmdList=()
  #cmdList+=("pwd")
  #cmdList+=("whoami")

  #cmdList+=("echo \"HOME=\"\$HOME\"\"")
  #cmdList+=("echo \"~: '$(realpath ~)'\"")
#  cmdList+=("env")
#  cmdList+=("set")
  cmdList+=('env |egrep "IS_DOCKER|GIT_TOKEN|IMAGE_NAME|HOME|USER|LOGNAME|SUDO\_"')
  #cmdList+=('echo $UID')
  #cmdList+=('echo $GROUPS')

  for cmd in "${cmdList[@]}"
  do
    echo ''
    echo "#RUN: ${cmd}"
    eval "${cmd}"
    res=$?
    echo "#RES: <${res}>"
  done

}
#----------------------------------------------------------------------------

do_demo

#------------------------------------------------------------------------------

exit 0