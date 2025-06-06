#!/bin/bash
#------------------------------------------------------------------------------
# Установка переменной, если она еще не задана
# Для этого в двойных кавычках после имени переменной нужно добавить ":-",
# после чего альтернативное значение.
#-----

clear
EXISTS_USER1='user1'
echo "# Scripte:"$(realpath "${BASH_SOURCE[0]}")
echo "# Now is : "$(date +"%Y-%m-%d_%H-%M-%S")
echo "# EXISTS_USER1: '${EXISTS_USER1}'"

test1(){
  printf '=%.0s' {1..10} && echo ""
  echo '# Работает'
  echo '# Альтернативное значение - статический текст'
  echo "APP_USER: '${APP_USER}'"
  local APP_USER="${APP_USER:-altUserName_text}"
  echo "APP_USER: '${APP_USER}'"
}

test2(){
  printf '=%.0s' {1..10} && echo ""
  echo '# Работает'
  echo '# Альтернативное значение - имя другой переменной окружения'

  echo '# -- '
  echo '# Переменная  APP_USER1 не существует'
#  local res1="${APP_USER1:-${EXISTS_USER1}}"
  local res1="${APP_USER1:${EXISTS_USER1}}"
  echo "APP_USER1: '${APP_USER1}'"
  echo "res1     : '${res1}'"

  echo '# -- '
  echo '# Переменная  APP_USER1 существует, но пуста'
  APP_USER1=''
  echo "APP_USER1: '${APP_USER1}'"
  local res2="${APP_USER1:${EXISTS_USER1}}"
  echo "res2     : '${res2}'"

  echo '# -- '
  echo '# Переменная  APP_USER1 существует, и содержит пробел'
  APP_USER1=' '
  echo "APP_USER1: '${APP_USER1}'"
  local res3="${APP_USER1:${EXISTS_USER1}}"
  echo "res3     : '${res3}'"

  echo '# -- '
  echo '# Переменная  APP_USER1 существует, и содержит текст'
  APP_USER1='some-login'
  echo "APP_USER1: '${APP_USER1}'"
  local res4_1="${APP_USER1:-${EXISTS_USER1}}"
  local res4_2="${APP_USER1:${EXISTS_USER1}}"
  echo "res4_1     : '${res4_1}'"
  echo "res4_2     : '${res4_2}'"

}

test3(){
  printf '=%.0s' {1..10} && echo ""
  echo '# ? Работает'
  echo '# В качестве альтернативного значения выполняем команду'

  echo '# -- '
  echo '# Команда завернута в двойные кавычки'
  local IMAGE_BUILD_AT=''
  echo "IMAGE_BUILD_AT (1): '${IMAGE_BUILD_AT}'"
  IMAGE_BUILD_AT=${IMAGE_BUILD_AT:-"$(date +%Y-%m-%d)"}
  echo "IMAGE_BUILD_AT (2): '${IMAGE_BUILD_AT}'"

  echo '# -- '
  echo '# Команда без кавычек'
  local IMAGE_BUILD_AT=''
  echo "IMAGE_BUILD_AT (1): '${IMAGE_BUILD_AT}'"
  IMAGE_BUILD_AT=${IMAGE_BUILD_AT:-$(date +%Y-%m-%d)}
  echo "IMAGE_BUILD_AT (2): '${IMAGE_BUILD_AT}'"

}

test4(){
  printf '=%.0s' {1..10} && echo ""
  echo '# Не работает'
  echo '# Цепочка альтернативных значений.'
  echo '# Позволяется только одна альтернатива'
  echo "APP_USER2: '${APP_USER2}'"
  APP_USER2="${APP_USER2:-${APP_USER3}:-altUser2}"
  echo "APP_USER2: '${APP_USER2}'"
}
#------------------------------------------------------------------------------

#test1
#test2
test3
#test4
#------------------------------------------------------------------------------
