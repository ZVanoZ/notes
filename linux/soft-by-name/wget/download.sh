#!/bin/bash
cd $(dirname $(readlink -e $0)) #переход в директорию текущего скрипта
#-----------------------------
cookie="SESSID=74uger334fiuqhkuagiuaibe32"
url=http://my-server.local/get-file?FILE_ID=3070342

#-----------------------------
# Используем wget
#--------

# Загружаем файл. Куки из файла.
wget -qO- --load-cookies=req-cookies.txt $url &> resWget.json

#-----------------------------
