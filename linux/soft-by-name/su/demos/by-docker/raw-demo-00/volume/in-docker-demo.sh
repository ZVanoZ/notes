#!/bin/bash
#------------------------------------------------------------------------------
echo ''
echo "$(printf '\x2D%.0s' {1..80})"
echo '------------------ BEG'
echo '-- $0                : '$0
#echo '-- ${BASH_SOURCE[0]} : '${BASH_SOURCE[0]}
echo '-- whoami            : '"$(whoami)"
echo '-- IMAGE_NAME        : '"${IMAGE_NAME}"
echo '--'

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

if [  'T' != "${IS_DOCKER=}" ];then
  echo '@WARN: Run this file by docker. Use ../run-docker.sh script'
  exit 1
fi

#----------------------------------------------------------------------------

function eval_cmd() {
    local cmd=$1
    echo "-- eval_cmd"
    echo "-- comment : '$2'"
    echo "#RUN: ${cmd}"
    eval "${cmd}"
    res=$?
    echo "#RES: <${res}>"
    return 0
}

function do_demo_eval() {
    local cmdList=()

    if [ '' != "$(getent passwd  www-data)" ]; then
      echo '@SKIP: add user "www-data" (already exists)'
    else
      cmdList+=('useradd -m www-data')
      cmdList+=("getent passwd root")
    fi

    cmdList+=("echo \"\$PWD\"")
    cmdList+=("getent passwd root")
    cmdList+=("getent passwd www-data")
    cmdList+=("id")
    cmdList+=("id root")
    cmdList+=("id www-data")
    cmdList+=("bash /volume/show-user-info.sh")

    for cmd in "${cmdList[@]}"
    do
      eval_cmd "${cmd}" 'by root'
    done

    # @TODO: проверить разрешен ли пользователю www-data логин перед выполнением  "chsh -s"
    chsh -s /bin/bash www-data

    eval_cmd 'type id'

    echo '@INFO: change current user to www-data'
     su - www-data -c 'id;pwd;ls -la;env'
     su - www-data -c "
echo '!!!! Теперь я работаю от www-data'
id
ls -la ~
"
#    su --login www-data      # Получаем терминал для ввода команд
     su - www-data            # Получаем терминал для ввода команд


     id
#    eval_cmd 'su --login www-data id'
#    local res="$?"
#    echo "res: '${res}'"
#    if [ 0 != "${res}" ]; then
#      echo "@SKIP: can't run scripts of user www-data"
#    else
      echo "@INFO: run scripts of user www-data"
      echo '@INFO: id:'"$(id)"

      cmdList=()
      cmdList+=("bash id")
      # @TODO: разобраться почему не удается вывести команду "id"
      # -- eval_cmd
      # -- comment : 'by www-data'
      # #RUN: su --login www-data bash id
      # /usr/bin/bash: /usr/bin/bash: cannot execute binary file
      # #RES: <126>
      cmdList+=("bash /volume/show-user-info.sh")
      for cmd in "${cmdList[@]}"
      do
        eval_cmd "su --login www-data ${cmd}" 'by www-data'
      done
#    fi

#    su - www-data
#    echo '@INFO: id:'"$(id)"
  return 0
}

do_demo_eval

#------------------------------------------------------------------------------

exit 0