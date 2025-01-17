#!/bin/bash
echo "# \$0       : '$0'"
echo "# IS_DOCKER: '${IS_DOCKER}'"

if [ 'T' != "${IS_DOCKER}" ]; then
  echo "# << now NOT a docker context"
  cmd='
  docker run --rm -it            \
    --env-file .env              \
    --env IS_DOCKER="T"          \
    --volume "$PWD":/volume      \
    --workdir "/volume"          \
    php:8.1-apache               \
    /volume/demo.sh
'
  echo "# RUN: '${cmd}'"
  eval "${cmd}"
  res="$?"
  echo "# docker run res: '${res}'"
  exit ${res}
else
  echo "# << now in docker context"
  set -e
  pwd
  ls -la
fi


do_work() {
  echo "# WWW_DATA_HOME: '${WWW_DATA_HOME}'"
  if [ '' == "${WWW_DATA_HOME}" ];then
    echo '@SKIP: empty WWW_DATA_HOME'
  else
    echo '# @INFO: use WWW_DATA_HOME'
    usermod -d "${WWW_DATA_HOME}" www-data
  fi

  echo "# WWW_DATA_UID: '${WWW_DATA_UID}'"
  if [ "${WWW_DATA_UID}" = '' ]; then
    echo '@SKIP: WWW_DATA_UID is empty'
  else
    echo '# @INFO: use WWW_DATA_UID'
    usermod -u "${WWW_DATA_UID}" www-data
    echo '# @INFO: www-data UID is changed to '${WWW_DATA_UID}
  fi


  echo "# WWW_DATA_GID: '${WWW_DATA_GID}'"
  if [ '' == "${WWW_DATA_GID}" ]; then
    echo '# @SKIP: WWW_DATA_GID is empty'
  else
    echo '# @INFO: use WWW_DATA_GID'
    groupmod -g "${WWW_DATA_GID}" www-data
    echo '# @INFO: www-data GID is changed to '${WWW_DATA_GID}
  fi
}

echo "# BEFORE: '$(getent passwd  www-data)'"
do_work
echo "# AFTER: '$(getent passwd  www-data)'"

exit 0