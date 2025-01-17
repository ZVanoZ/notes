#!/bin/bash
#------------------------------------------------------------------------------

echo ''
echo "$(printf '\x2D%.0s' {1..80})"
echo '------------------ BEG'
echo '-- $0                : '$0
#echo '-- ${BASH_SOURCE[0]} : '${BASH_SOURCE[0]}
echo '-- whoami            : '"$(whoami)"
echo '-- IMAGE_NAME        : '"${IMAGE_NAME}"
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
    else
      cmdList+=('useradd -m www-data')
      cmdList+=("getent passwd root")
    fi
    cmdList+=("getent passwd  www-data")
    cmdList+=('apt update')
    cmdList+=('apt install -y sudo')

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

#
#  -u, --user=user               выполнить команду (или
#                                редактировать файл) от
#                                имени или ID указанного
#                                пользователя
#  -E, --preserve-env            сохранить
#                                пользовательское
#                                окружение при выполнении
#                                команды
#      --preserve-env=list       preserve specific environment variables
#
function do_demo() {
  echo "-- do_demo ..."

  echo "-- run script use current user (root)"
  bash "/volume/show-user-info.sh" 'run script use current user'

  echo "-- run script use user 'www-data' without mapping variables"
  sudo -u www-data bash "/volume/show-user-info.sh" 'sudo -u www-data bash'

  echo "-- run script use user 'www-data' with mapping ALL variables"
  sudo -u www-data --preserve-env bash "/volume/show-user-info.sh" 'sudo -u www-data --preserve-env'

  echo "-- run script use user 'www-data' with mapping CUSTOM variables"
  sudo -u www-data --preserve-env=GIT_TOKEN,IMAGE_NAME bash "/volume/show-user-info.sh" 'sudo -u www-data --preserve-env=GIT_TOKEN,IMAGE_NAME'

  # @TODO: разобраться. Фрагмент "--preserve-env=!..." не работает.
  echo "-- run script use user 'www-data' with mapping CUSTOM variables (exclude list)"
  sudo -u www-data -E --preserve-env=!PATH,!IS_DOCKER bash "/volume/show-user-info.sh" 'sudo -u www-data -E --preserve-env=!PATH,!IS_DOCKER'

  return 0
}

function do_demo_eval() {
  echo "-- do_demo_eval ..."
  local cmdList=()
  cmdList+=('sudo -u www-data                                         bash "/volume/show-user-info.sh"')
  cmdList+=('sudo -u www-data    --preserve-env                       bash "/volume/show-user-info.sh"')
  cmdList+=('sudo -u www-data    --preserve-env=GIT_TOKEN,IMAGE_NAME  bash "/volume/show-user-info.sh"')
  # @TODO: разобраться. Фрагмент "--preserve-env=!..." не работает.
  cmdList+=('sudo -u www-data    --preserve-env=!PATH,!IS_DOCKER      bash "/volume/show-user-info.sh"')
  cmdList+=('sudo -u www-data -E --preserve-env=!PATH,!IS_DOCKER      bash "/volume/show-user-info.sh"')
#  cmdList+=('')
  for cmd in "${cmdList[@]}"
  do
    echo ''
    echo "#RUN: ${cmd}"
    eval "${cmd} \"${cmd}\""
    res=$?
    echo "#RES: <${res}>"
  done
}

#------------------------------------------------------------------------------

if [  'T' != "${IS_DOCKER=}" ];then
  echo '@WARN: Run this file by docker. Use ../run-docker.sh script'
  exit 1
fi

do_init
#do_demo
do_demo_eval

#------------------------------------------------------------------------------

exit 0