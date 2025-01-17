#!/bin/bash

if [  'T' != "${IS_DOCKER=}" ];then
  echo '@WARN: Run this file by docker. Use ../run-docker.sh script'
  exit 1
fi

#cd /volume


cmdList=()
cmdList+=("pwd")
cmdList+=("whoami")
cmdList+=("getent passwd root")
cmdList+=("echo \"HOME=\"$HOME\"\"")
cmdList+=("echo \"~: '$(realpath ~)'\"")
cmdList+=('echo $UID')
cmdList+=('echo $GROUPS')

# -D, --defaults                показать или изменить настройки
cmdList+=('useradd -D')
cmdList+=('useradd --defaults')

cmdList+=('useradd user1')
cmdList+=("getent passwd user1")
# #RUN: useradd user1
# #RES: <0>
# #RUN: getent passwd user1
# user1:x:1001:1001::/home/user1:/bin/sh
# #RES: <0>
cmdList+=('su - user1 -c id')
# Домашняя директория в свойствах пользователя прописана, но ее нет на диске
# #RUN: su - user1 -c id
# su: warning: cannot change directory to /home/user1: No such file or directory
# uid=1001(user1) gid=1001(user1) groups=1001(user1)
# #RES: <0>

# -m, --create-home             создать домашний каталог пользователя
# -M, --no-create-home          не создавать домашний каталог пользователя
# -d, --home-dir ДОМ_КАТ        домашний каталог новой учётной записи
cmdList+=('useradd -m user1.m')
cmdList+=("getent passwd user1.m")
#RUN: useradd -m user1.m
#RES: <0>
cmdList+=('su - user1.m -c id')
# #RUN: su - user1.m -c id
# uid=1002(user1.m) gid=1002(user1.m) groups=1002(user1.m)
# #RES: <0>



# useradd -m -g users -d /home/user1_D user1-D
cmdList+=('useradd -d /home/user1-d.home user1-d')
cmdList+=('su - user1-d -c id')
cmdList+=('mkdir -v /home/user1-d.home')
cmdList+=('chown -v user1-d:user1-d /home/user1-d.home')
cmdList+=('su - user1-d -c id')


# -s, --shell ОБОЛОЧКА          регистрационная оболочка новой
# -m, --create-home             создать домашний каталог пользователя
cmdList+=('useradd --shell /bin/bash -m user1-s')
cmdList+=("getent passwd user1-s")
cmdList+=('su - user1-s -c "bash /volume/show-user-info.sh"')

#cmdList+=('useradd --defaults user1-defaults')


for cmd in "${cmdList[@]}"
do
  echo ''
  echo "#RUN: ${cmd}"
  eval "${cmd}"
  res=$?
  echo "#RES: <${res}>"
done

#useradd --defaults user1_defaults

echo '--END-OF-SCRIPT--'
