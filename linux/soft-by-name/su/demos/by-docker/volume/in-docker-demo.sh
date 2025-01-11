#!/bin/bash

if [  'T' != "${IS_DOCKER=}" ];then
  echo '@WARN: Run this file by docker. Use ../run-docker.sh script'
  exit 1
fi

#cd /volume


cmdList=()
#cmdList+=("ls -l ${COMPOSER_HOME}")
cmdList+=("pwd")
#cmdList+=("ls -la")

cmdList+=("whoami")
cmdList+=("getent passwd root")

cmdList+=("echo \"HOME=\"$HOME\"\"")
cmdList+=("echo \"~: '$(realpath ~)'\"")
#cmdList+=("env")
#cmdList+=("set")
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

echo ''

echo '-- add user1'
useradd  user1
echo '-- su user1'
su user1
echo '-- now user1'
whoami
echo '-- su -s'
su -s
echo '-- now root'
whoami

exit
whoami
exit
exit
exit
#
#echo "root      HOME: \"$HOME\""
#echo "www-data  HOME: \"$HOME\""
#su - www-data echo "      HOME: \"$HOME\""
#
#echo "root       ~: \"$(realpath ~)\""
#echo "www-data   ~: \"$(realpath ~)\""
#su - root echo "?       ~: \"$(realpath ~)\""
echo '--END-OF-SCRIPT--'
