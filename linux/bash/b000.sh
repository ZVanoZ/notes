#!/bin/bash
# link=https://habrahabr.ru/post/47163/
# Запускаем: bash b000.sh xxx YYY

#указываем где у нас хранится bash-интерпретатор
parametr1=$1 #присваиваем переменной parametr1 значение первого параметра скрипта
script_name=$0 #присваиваем переменной script_name значение имени скрипта
echo "Вы запустили скрипт с именем $script_name и параметром $parametr1" # команда echo выводит определенную строку, обращение к переменным осуществляется через $имя_переменной.
echo 'Вы запустили скрипт с именем $script_name и параметром $parametr1' # здесь мы видим другие кавычки, разница в том, что в одинарных кавычках не происходит подстановки переменных.

echo "***ZIM1*******************************************************"     # Вывод текста
echo "***ZIM2*******************************************************" >&2 # Непонятный вывод 
echo  ***ZIM3*******************************************************      # Без скобок тоже работает
echo "\$ = $"     # Выводит знак $
echo "\$0 = $0"   # Возвращает название текущего скрипта
echo "\$1 = $1"   # Возвращает значение аргумента 1
echo "\$2 = $2"   # Возвращает значение аргумента 2
echo "\$* = $*"   # Возвращает все аргументы вызова
echo "\$# = $#"   # Возвращает количество параметров
echo "LOGNAME1=${LOGNAME}" # Вариант 1. Возвращает логин текущего пользователя
echo "LOGNAME2="$LOGNAME   # Вариант 2.
echo "LOGNAME3="${LOGNAME} # Вариант 3.


exit 0 #Выход с кодом 0 (удачное завершение работы скрипта)
