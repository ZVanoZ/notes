#!/bin/bash
#-----------------------------------------------------------------------
echo "$(printf '\x2D%.0s' {1..80})"
echo "-- PWD    : <${PWD}>"
echo "-- script : <$0>"
echo "-----"


#-----------------------------------------------------------------------
# https://www.shellhacks.com/case-statement-bash-example/
# Пример работает
#-----

#printf 'Which Linux distribution do you know? '
#read DISTR
#
#case $DISTR in
#     ubuntu)
#          echo "I know it! It is an operating system based on Debian."
#          ;;
#     centos|rhel)
#          echo "Hey! It is my favorite Server OS!"
#          ;;
#     windows)
#          echo "Very funny..."
#          ;;
#     *)
#          echo "Hmm, seems i've never used it."
#          ;;
#esac

#-----------------------------------------------------------------------

CI_JOB_NAME='deploy-test'
CI_DEV_DATA_DIR='/data/dev'
CI_TEST_DATA_DIR='/data/test'
VOLUME_DIR=''
CONFIGS_DIR=''
IS_SKIP=''

case "${CI_JOB_NAME}" in
deploy-dev)
  VOLUME_DIR="${CI_DEV_DATA_DIR}/volume"
  CONFIGS_DIR="${CI_DEV_DATA_DIR}/configs"
  IS_SKIP='F'
  ;;
deploy-test)
  VOLUME_DIR="${CI_TEST_DATA_DIR}/volume"
  CONFIGS_DIR="${CI_TEST_DATA_DIR}/configs"
  IS_SKIP='F'
  ;;
*)
  echo "skip"
  IS_SKIP='T'
  ;;
esac
echo "IS_SKIP    : ${IS_SKIP}"
echo "VOLUME_DIR : ${VOLUME_DIR}"
echo "CONFIGS_DIR: ${CONFIGS_DIR}"


#-----------------------------------------------------------------------
echo "-----"
echo "-- PWD    : <${PWD}>"
echo "-- script : <$0>"
echo "$(printf '\x2D%.0s' {1..80})"
#-----------------------------------------------------------------------
exit 0
