#!/bin/bash
#------------------------------------------------------------------------------

clear

#------------------------------------------------------------------------------
# Команда realpath позволяет получить абсолютный путь из относительного.
# Работает даже если файл по относительному пути не существует.
# Не работает, если директория относительного пути не существует/
#-----

echo 'pwd         :' $(pwd)
echo '$0          :' $0
echo 'dirname  $0 :' $(dirname $0)
echo 'basename $0 :' $(basename $0)


echo '--'
# Файл существует
someFilePath="$(basename $0)"
echo "file                  : ${someFilePath}"
echo "file ls -la           : $( ls -la ${someFilePath})"
echo "file dirname          : '$(dirname ${someFilePath})'"
echo "file dirname realpath : '$(dirname $(realpath ${someFilePath}))'" #

echo '--'
# Файл НЕ существует
someFilePath="./invalid-file-name.txt"
echo "file                  : ${someFilePath}"
echo "file ls -la           : $( ls -la ${someFilePath})"               #  невозможно получить доступ к './invalid-file-name.txt': Нет такого файла или каталога
echo "file dirname          : '$(dirname ${someFilePath})'"             # '.'
echo "file dirname realpath : '$(dirname $(realpath ${someFilePath}))'" # '.../notes/linux/bash' - вывел текущий каталог

#------------------------------------------------------------------------------
