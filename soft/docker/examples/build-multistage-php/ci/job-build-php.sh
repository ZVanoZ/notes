#!/bin/bash

set -e

echo ''
echo "#$(printf '\x2D%.0s' {1..79})"
echo '# BEG script     :' "##$(realpath "${BASH_SOURCE[0]}"):${LINENO}#$(date +'%Y-%m-%dT%H-%M-%SZ')##"
echo '# $0             : '$0
echo "# BASH_SOURCE[0] : '${BASH_SOURCE[0]}'"
echo '# id             : '"$(id)"
echo "# PWD            : '$PWD'"
echo '#'

function onExit() {
  echo ''
  echo "# PWD            : '$PWD'"
  echo '# $0             : '$0
  echo "# BASH_SOURCE[0] : '${BASH_SOURCE[0]}'"
  echo '# END script     :' "##$(realpath "${BASH_SOURCE[0]}"):${LINENO}#$(date +'%Y-%m-%dT%H-%M-%SZ')##"
  echo "#$(printf '\x2D%.0s' {1..79})"
}
do_work() {
  set -e
  #------------------------------------------------------------------------------
  local script_path=$(realpath "${BASH_SOURCE[0]}")
  local script_dir=$(dirname $(realpath "${BASH_SOURCE[0]}"))
  local work_dir=`pwd`
  #------------------------------------------------------------------------------
  local cmdList=()
  cmdList+=('env')
  cmdList+=('cd /build-app/www')
  cmdList+=('pwd')
  cmdList+=('ls -la')
  cmdList+=('composer install -vvv --no-dev')
  cmdList+=('ls -la ./vendor')

  for cmd in "${cmdList[@]}" ;do
      echo ''
      echo "#RUN: '${cmd}'" "##${script_path}:${LINENO}#$(date +'%Y-%m-%dT%H-%M-%SZ')##"
      eval "${cmd}"
      res=$?
      echo "#RES: '${res}' for cmd '${cmd}'" "##${script_path}:${LINENO}#$(date +'%Y-%m-%dT%H-%M-%SZ')##"
      if [ ! 0 = "${res}" ];then
        return ${res}
      fi
  done

  #------------------------------------------------------------------------------
}
#pwd
#ls -la
#RUN composer install -vvv --no-scripts --prefer-dist --no-progress --no-interaction
#composer install -vvv

do_work