#!/bin/bash
#-----------------------------------------------------------------------
# Сравнение данных в конструкции if-then-...-elif-...-fi
# https://www.opennet.ru/docs/RUS/bash_scripting_guide/x2565.html
# https://techrocks.ru/2019/01/21/bash-if-statements-tips/
#-----------------------------------------------------------------------
# Булевы операторы ! (нет), && (и), || (или) могут использоваться для комбинирования выражений, как и в других языках.
#
# if [[ "$name" == "Ryan" ]] && ! [[ "$time" -lt 2000 ]]; then
#  echo "Sleeping"
# elif [[ "$day" == "New Year's Eve" ]] || [[ "$coffee_intake" -gt 9000 ]]; then
#  echo "Maybe awake"
# else
#  echo "Probably sleeping"
# fi
#-----------------------------------------------------------------------
######## сравнение целых чисел в квадратных скобках
# -eq    равно
# -ne    не равно
# -gt    больше
# -ge    больше или равно
# -lt    меньше
# -le    меньше или равно
echo '--------------[-eq -ne -gt -ge -lt -le]-----------------'
cond='[] if then elif else'
if [ 1 -ge 2 ]; then # 1 >= 2
  echo $cond': [ 1 -qt 2 ]'
elif [ 1 -ge 2 ] && [ 2 -ge 1 ]; then # 1 >= 2 and 2 >= 1
  echo $cond': [ 1 -ge 2 -a 2 -ge 1 ]'
elif [ 1 -ge 2 -a 2 -ge 1 ]; then # 1 >= 2 and 2 >= 1
  echo $cond': [ 1 -ge 2 -a 2 -ge 1 ]'
elif [ 3 -eq 3 ]; then
  echo $cond': [ 3 -eq 3 ]'
else
  echo $cond': else'
fi
#-----------------------------------------------------------------------
######## сравнение целых чисел в круглых скобках
# <      меньше (внутри двойных круглых скобок )
# <=     меньше или равно (внутри двойных круглых скобок)
# >      больше (внутри двойных круглых скобок)
# >=     больше или равно (внутри двойных круглых скобок)
echo '--------------(())-----------------'
cond='(()) if elif else fi'
if (( 1 >= 2 )) ; then
  echo $cond': (( 1 >= 2 ))'
elif (( 1 >= 2 )) && (( 2 >= 1 )); then #
  echo $cond': (( 1 >= 2 )) && (( 2 >= 1 ))'
elif (( 1 >= 2 -a 2 >= 1 )); then # @TODO: разобраться с выражением "-a"
#elif (( 1 >= 2 )) -a ((2 >= 1 )); then # @TODO: разобраться с выражением "-a"
  echo $cond': (( 1 >= 2 -a 2 >= 1 ))'
elif (( 3 <= 3 )); then
  echo $cond': (( 3 <= 3 ))'
else
  echo $cond': else'
fi
#-----------------------------------------------------------------------
######## сравнение строк в квадратных скобках
# =      равно
# ==     равно
# !=     не равно
# <      меньше, в смысле величины ASCII-кодов
# >      больше, в смысле величины ASCII-кодов
# -z     строка "пустая", т.е. имеет нулевую длину
# -n     строка не "пустая" (в кавычках внутри квадратных скобок)
#-------
echo '--------------[][[]]-----------------'

echo 'test: "="'
cond='[ "abc" = "abc" ]'
if [ "abc" = "abc" ] ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi

cond='[ "abc" = "abcd" ]'
if [ "abc" = "abcd" ] ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi

cond='[[ "abc" = "abc" ]]'
if [[ "abc" = "abc" ]] ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi

cond='[[ "abc" = "abcd" ]]'
if [[ "abc" = "abcd" ]] ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi
#-------
echo 'test: "=="'
cond='[ "abc" == "abc" ]'
if [ "abc" == "abc" ] ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi

cond='[ "abc" == "abcd" ]'
if [ "abc" == "abcd" ] ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi

cond='[[ "abc" == "abc" ]]'
if [[ "abc" == "abc" ]] ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi

cond='[[ "abc" == "abcd" ]]'
if [[ "abc" == "abcd" ]] ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi
#-------
echo 'test: "!="'
cond='[ "abc" != "abc" ]'
if [ "abc" != "abc" ] ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi

cond='[ "abc" != "abcd" ]'
if [ "abc" != "abcd" ] ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi

cond='[[ "abc" != "abc" ]]'
if [[ "abc" != "abc" ]] ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi

cond='[[ "abc" != "abcd" ]]'
if [[ "abc" != "abcd" ]] ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi


#-----------------------------------------------------------------------
# Проверяем AND и OR в квадратных скобках
#-----

echo -e "\n#$(printf '\x2D%.0s' {1..80})"

x1=1
x2=''
y1='1'
y2=''

echo "# x1=<${x1}>"
echo "# x2=<${x2}>"
echo "# y1=<${y1}>"
echo "# y2=<${y2}>"
echo "#-----"

cond='[[ "${x1}" = "${x2}" ]]'
if [[ "${x1}" = "${x2}" ]]  ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi
echo "# x1=<${x1}> x2=<${x2}>"

cond='[[ "${x1}" == "${x2}" ]]'
if [[ "${x1}" == "${x2}" ]]  ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi

cond='[[ "${x1}" = "${y1}" ]]'
if [[ "${x1}" = "${y1}" ]]  ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi
echo "# x1=<${x1}> y1=<${y1}>"

cond='[[ "${x1}" == "${y1}" ]]'
if [[ "${x1}" == "${y1}" ]]  ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi

cond='[[ "${x1}" != "${x2}" ]]'
if [[ "${x1}" != "${x2}" ]]  ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi

cond='[[ "${x1}" != "${y1}" ]]'
if [[ "${x1}" != "${y1}" ]]  ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi


cond='[[ "${x1}" == "${x2}" ]] && [[ "${y1}" == "${y2}" ]]'
if [[ "${x1}" == "${x2}" ]] && [[ "${y1}" == "${y2}" ]]  ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi

cond='[[ "${x1}" == "${x2}" && "${y1}" == "${y2}" ]]'
if [[ "${x1}" == "${x2}" && "${y1}" == "${y2}" ]]  ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi

cond='[[ "${x1}" == "${y1}" ]] && [[ "${x2}" == "${y2}" ]]'
if [[ "${x1}" == "${y1}" ]] && [[ "${x2}" == "${y2}" ]]  ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi

cond='[[ "${x1}" == "${y1}" &&  "${x2}" == "${y2}" ]]'
if [[ "${x1}" == "${y1}" &&  "${x2}" == "${y2}" ]]  ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi

cond='[[ "${x1}" == "${x2}" ]] || [[ "${y1}" == "${y2}" ]]'
if [[ "${x1}" == "${x2}" ]] || [[ "${y1}" == "${y2}" ]]  ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi


cond='[[ "${x1}" == "${x2}" || "${y1}" == "${y2}" ]]'
if [[ "${x1}" == "${x2}" || "${y1}" == "${y2}" ]]  ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi

cond='[[ "${x1}" == "${x2}" ]] || [[ "${x1}" == "${y1}" ]]'
if [[ "${x1}" == "${x2}" ]] || [[ "${x1}" == "${y1}" ]]  ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi

cond='[[ "${x1}" == "${x2}" || "${x1}" == "${y1}" ]]'
if [[ "${x1}" == "${x2}" || "${x1}" == "${y1}" ]]  ;then
  echo '+: '$cond
else
  echo '-: '$cond
fi

#-----------------------------------------------------------------------
set +e
echo -e "\n$(printf '\x2D%.0s' {1..80})"
echo '-- test run invalid command and check result'

#cmd='ls -l'
cmd='my-invalid-command'
echo -e "\ncmd: <${cmd}> "
eval "${cmd}"
if [ "$?" == "0" ]; then
  echo 'SUCCESS: code='"$?"
else
    echo 'FAIL: code='"$?"
fi;
#-----------------------------------------------------------------------

echo -e "\n$(printf '\x2D%.0s' {1..80})"
#-----------------------------------------------------------------------

