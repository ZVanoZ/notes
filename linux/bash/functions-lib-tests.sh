#!/bin/bash
#------------------------------------------------------------------------------
# переход в директорию текущего скрипта
cd $(dirname $(readlink -e $0))

. ./functions-lib.sh
#------------------------------------------------------------------------------
echoVar 'test echoVar: Hello'
# echoDebug 'test echoDebug: Hello'
#------------------------------------------------------------------------------
# isInStr - возвращает TRUE, если подстрока содержится в строке

#echoVar 'test isInStr TRUE : '$( isInStr '-key2-' '-key1-key2-key3')
#echoVar 'test isInStr FALSE: '$( isInStr '-key0-' '-key1-key2-key3')
#------------------------------------------------------------------------------
# isInStrAwk - возвращает TRUE, если подстрока содержится в строке
# @TODO: доделать - сейчас не работает

#echoVar 'test isInStrAwk TRUE: '$( isInStrAwk '-key2-' '-key1-key2-key3')
#echoVar 'test isInStrAwk FALSE: '$( isInStrAwk '-key0-' '-key1-key2-key3')
#------------------------------------------------------------------------------
# makeLink - Создает символическую ссылку, если она еще не существует
sourceFullpath=`pwd`"/tmp/source.txt"
destFullpath=`pwd`"/tmp/dest.txt"
if [ -e $sourceFullpath -o -h $sourceFullpath ]; then
  echo "delete: '$sourceFullpath'"
  rm $sourceFullpath
fi
if [ -e $destFullpath -o -h $destFullpath ]; then
  echo "delete: '$destFullpath'"
  rm $destFullpath
fi
echo "tmpFile content" > $sourceFullpath
echo "created: '$sourceFullpath'"
echo "tmpFile will be replaced" > $destFullpath
echo "created: '$destFullpath'"

# dest существует и является обычным файлом. Нет флага "-REPLACE_FILE-"
echo "-- test: passed if 'skip rm'"
makeLink $sourceFullpath $destFullpath
# dest существует и является обычным файлом. Нет флага "-REPLACE_FILE-"
echo "-- test: passed if 'skip rm'"
makeLink $sourceFullpath $destFullpath "-REPLACE_LINK-"
# dest существует и является обычным файлом. Есть флаг "-REPLACE_FILE-"
echo "-- test: passed if 'rm, created link'"
makeLink $sourceFullpath $destFullpath "-REPLACE_FILE-"
# dest существует и является линком. Нет флага "-REPLACE_LINK-"
echo "-- test: passed if 'skip unlink'"
makeLink $sourceFullpath $destFullpath "-REPLACE_FILE-"
# dest существует и является линком. Есть флаг "-REPLACE_LINK-"
echo "-- test: passed if 'unlink, created link'"
makeLink $sourceFullpath $destFullpath "-REPLACE_FILE-REPLACE_LINK-"
# dest существует и является линком. Нет флага "-REPLACE_LINK-"
echo "-- test: passed if 'skip unlink'"
makeLink $sourceFullpath $destFullpath

#------------------------------------------------------------------------------