#!/bin/bash
# переход в директорию текущего скрипта
cd $(dirname $(readlink -e $0))
#------------------------------------------------------------------------------
#echo "script name: '$0'"
#echo "script fullpath: '$(readlink -e $0)'"
#------------------------------------------------------------------------------
declare -r TRUE='TRUE'
declare -r FALSE='FALSE'
#------------------------------------------------------------------------------

# Выводит данные в консоль.
# Предназначена для использования внутри функций
function echoVar ()
{
    echo "$1" >&2
}
echoVar 'test echoVar: Hello'

function testEchoVar() {
  echoVar 'test echoVar into testEchoVar(): Hello'
}
testEchoVar

function testReturn() {
  local result=1
  # echo '...testReturn...' # Так нельзя, ибо строка вернется как результат функции
  return $result;
}
#echo 'testReturn1: '$( testReturn ) # Так фигушки. Значение не возвращается
testReturn
echo 'testReturn2-1: '$?  # Работает: Получаем значение 1.
echo 'testReturn2-2: '$?  # Ошибка: Получаем 0. Похоже, буфер очищается после считывания
testReturn; echo 'testReturn3: ' $?
if ( testReturn; $? = 1 );then
  echo 'testReturn if: +'
else
  echo 'testReturn if: -'
fi

function testReturnEcho() {
  local result=${TRUE}
  echo $result;
}
echo 'testReturnEcho: '$( testReturnEcho )

function F4() {
  return 35
}

F4
echo "Return value of the function is $?"