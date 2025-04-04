#!/bin/bash

echo "Количество аргументов: <$#>"
echo "Аргументы: <$@>"

cmdList=()
cmdList+=("pwd")
cmdList+=("echo @")
cmdList+=("id")
cmdList+=("env")
#cmdList+=("env | grep APACHE_RUN_USER")
#cmdList+=("env | grep ARG_USER_ID")
cmdList+=("set")

for cmd in "${cmdList[@]}"
do
  echo ''
  echo "#RUN: ${cmd}"
  eval "${cmd}"
  res=$?
  echo "#RES: <${res}>"
  echo ''
done
