#!/bin/bash
#------------------------------------------------------------------------------
declare -r TRUE='TRUE'
declare -r FALSE='FALSE'
declare IS_DEBUG=TRUE
#------------------------------------------------------------------------------
# echoVar - Выводит данные в консоль.
# Предназначена для использования внутри функций
function echoVar ()
{
    echo "$1" >&2
}
#------------------------------------------------------------------------------
# @TODO: доделать - сейчас не работает. Выводит текст до первого пробела
function echoDebug ()
{
  echoVar 'argCount: '$#
  echoVar 'arg1: '$1
  if [[ IS_DEBUG == TRUE ]]; then
    echoVar $1
  fi
}
#------------------------------------------------------------------------------
# isNumber  - возвращает TRUE, если arg1 является числом
# @TODO: проверить работоспособность - закопипасчено.
function isNumber {
  if [[ "$1" =~ ^[[:digit:]]+$ ]]; then
    return 0
  else
    return 1
  fi
}
#------------------------------------------------------------------------------
# isInStr - возвращает TRUE, если подстрока содержится в строке
# @param {String} 1. Подстрока, которую ищем
# @param {String} 2. Подстрока в которой ищем
function isInStr() {
  local substr=$1
  local str=$2
  local result=FALSE
  if [[ "$str" == *"$substr"* ]]; then
    result=TRUE
  fi
  echo $result
}
#------------------------------------------------------------------------------
# isInStrAwk - возвращает TRUE, если подстрока содержится в строке
# Для поиска используется awk
# @TODO: доделать - сейчас не работает
function isInStrAwk() {
  echoVar "isInStrAwk: @TODO: доделать, сейчас не работает"
  local substr=$1
  local str=$2
  #local cmd="echo | awk '{print index(\"$str\", \"$substr\")}'"
  local cmd="awk '{print index(\"$str\", \"$substr\")}'"
  echoVar "cmd: <${cmd}>"
  local foundPos=`${cmd}`
  #local foundPos=awk '{print match($substr, $str)}'
  #local foundPos= exec awk '{print match($substr, $str)}'
  # local foundPos=`echo | awk '{print index("${str}", "${substr}")}'`
  local result=FALSE
  if ((foundPos > 0)); then
    result=TRUE
  fi
  # echo "isInStr result: '$result' for search '$substr' in '$str', found in position '$foundPos'"
  echo $result
}
#------------------------------------------------------------------------------
# makeLink - Создает символическую ссылку, если она еще не существует
# Аргумент1: источник. Т.е. файл, на который будем ссылаться
# Аргумент2: назначение. Путь к файлу-ссылке, который создаем.
# Аргумент3: Признак принудительного создания ссылки. Файл будет удален.
#            -REPLACE_FILE-REPLACE_LINK-
function makeLink() {
  if (($# < 2)); then
    echo 'makeLink fail: invalid arguments count'
  else
    local inpPath=$1
    local outPath=$2
    local isReplaceFile=$FALSE
    local isReplaceLink=$FALSE
    if (($# >= 3)) ; then
      local workMode=$3

      if [[ $workMode == *"-REPLACE_FILE-"* ]]; then
        isReplaceFile=$TRUE
      else
        isReplaceFile=$FALSE
      fi
#      echoVar 'isReplaceFile  '$isReplaceFile

      if [[ $workMode == *"-REPLACE_LINK-"* ]]; then
        isReplaceLink=$TRUE
      else
        isReplaceLink=$FALSE
      fi
#      echoVar 'isReplaceLink  '$isReplaceLink
    fi
    if [ -f $outPath ]; then
      if [ -h $outPath ]; then
        if [[ $isReplaceLink = $TRUE ]]; then
          echoVar 'makeLink unlink: '$outPath
          unlink $outPath
        else
          echoVar 'makeLink skip unlink: '$outPath
          return 1
        fi
      fi
      if [ -f $outPath ] ; then
        if [[ $isReplaceFile = $TRUE ]];then
          echoVar 'makeLink rm: '$outPath
          rm $outPath
        else
          echoVar 'makeLink skip rm: '$outPath
          return 1
        fi
      fi
    fi
    ln -s $inpPath $outPath
    echoVar "makeLink created link: '${outPath}' from '${inpPath}'"
    # ls $outPath
    return 0
  fi
}
#------------------------------------------------------------------------------