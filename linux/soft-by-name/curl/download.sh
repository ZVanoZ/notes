#!/bin/bash
cd $(dirname $(readlink -e $0)) #переход в директорию текущего скрипта
#-----------------------------
cookie="SESSID=74uger334fiuqhkuagiuaibe32"
url=http://my-server.local/get-file?FILE_ID=3070342
#-----------------------------
# Используем curl
#--------

# Загружаем файл. Куки из переменной
curl -v $url \
--cookie $cookie \
--output resCurl.json

# Загружаем файл. Куки из заголовка.
curl -v $url \
-H 'User-Agent: Mozilla/5.0 ...' \
-H 'Cookie: SESSID=74uger334fiuqhkuagiuaibe32' \
--output resCurl.json

# Загружаем файл. Куки из файла "req-cookies.txt".
# Полученные с сервера куки пишем в "resp-cookies.txt"
curl -v $url \
--cookie req-cookies.txt \
--cookie-jar resp-cookies.txt \
--output resCurl.json
#-----------------------------