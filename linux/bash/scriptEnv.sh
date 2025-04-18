#!/bin/bash
# указываем где у нас хранится bash-интерпретатор
#------------------------------------------------------------------------------
# В данном скрипте команды, позволяющие извлечь разную полезную информацию
# link=https://habrahabr.ru/post/47163/
# Запускаем: bash b000.sh xxx YYY
#------------------------------------------------------------------------------
# Базовый синтаксис echo
#-----
echo '-------------------------------------------------------------------------'
echo "***Тест1***"     # Вывод текста
echo "***Тест2***" >&2 # Непонятный вывод, но тоже работает
echo  ***Тест3***      # Без скобок тоже работает
echo "Экранирование: \$ = $"         # Выводит знак $

varHello='Hello'
varWorld='World'
echo "Подстановка переменных выполняеся      : $varHello, $varWorld"   # В двойных кавычках выполняеся подстановка переменных
echo "Подстановка переменных не выполняеся. 1: \$varHello, \$varWorld" # Экранируем знак "$" слешем "\$"
echo 'Подстановка переменных не выполняеся. 2: $varHello, $varWorld'   # В одинарных кавычках подстановка не выполняется.

echo "Вывод переменных. 1: ${varHello}"
echo "Вывод переменных. 2: "$varHello
echo "Вывод переменных. 3: "${varHello}
#------------------------------------------------------------------------------
# Получаем информацию о том, где находимся и какой скрипт выполняем
#-----
function displayPath() {
  echo '---------------------------------------------------- '
  echo '+ : `pwd`                                          : ' `pwd`
  echo '+ : ${PWD}                                         : '  ${PWD}
  echo '+ : $(pwd)                                         : '  $(pwd)
  echo '+ : $0                                             : ' $0
  echo '+ : ${BASH_SOURCE[0]}                              : ' ${BASH_SOURCE[0]}
  echo '- : $(realpath "${BASH_SOURCE[0]}")                : ' $(realpath "${BASH_SOURCE[0]}")
  echo '- : $(readlink -e ${BASH_SOURCE[0]}                : ' $(readlink -e ${BASH_SOURCE[0]})
  echo 'E : $(readlink -e $0)                              : ' $(readlink -e $0)
  echo '- : `dirname $(readlink -e $0)`                    : ' `dirname $(readlink -e $0)`
  echo '+ : `dirname $(realpath "${BASH_SOURCE[0]}")`      : ' `dirname $(realpath "${BASH_SOURCE[0]}")`
  echo '+ : $(dirname $(realpath "${BASH_SOURCE[0]}"))     : ' $(dirname $(realpath "${BASH_SOURCE[0]}"))
  echo '+ : "<$(dirname $(realpath "${BASH_SOURCE[0]}"))>" : '"<$(dirname $(realpath "${BASH_SOURCE[0]}"))>"
  echo '+ : `dirname "${BASH_SOURCE[0]}"`                  : ' `dirname "${BASH_SOURCE[0]}"`
  echo '---------------------------------------------------- '
  echo "+ : Путь к родительскому каталогу скрипта          : " $(realpath "$(dirname $(realpath "${BASH_SOURCE[0]}"))/..")
  echo '---------------------------------------------------- '
  echo '--: Содержимое BASH_SOURCE: '
  for itemIndex in "${!BASH_SOURCE[@]}"
  do
    echo "BASH_SOURCE[${itemIndex}]: " ${BASH_SOURCE[${itemIndex}]}
  done
  echo '-----------------------------------------------'
}

echo ''
echo '-- Вычисление путей находясь в директории запуска'
displayPath

echo ''
echo '-- Вычисление путей находясь в директории, не соответствующей директории запуска'
echo '-- Внимание! Часть путей вычисляется неверно.'
cd tmp
displayPath
cd ..
echo ''

echo '-------------------------------------------------------------------------'
echo '-- Параметры командной строки'
echo '-----'
echo "\$*: '$*'"   # Возвращает все аргументы вызова
echo "\$@: '$@'"   # Возвращает все аргументы вызова
echo "\$#: '$#'"   # Возвращает количество параметров
echo "\$0: '$0'"   # Возвращает название текущего скрипта
echo "\$1: '$1'"   # Возвращает значение аргумента 1
echo "\$2: '$2'"   # Возвращает значение аргумента 2
echo '-------------------------------------------------------------------------'
echo '-- Перебираем аргументы с ключами -a -b -c'
echo '-----'
echo '@TODO разобраться и доделать'
# scriptEnv.sh -a -b -c                                         # пример запуска
# scriptEnv.sh -a 'val-a' -b 'val-b' -c 'val-c 1' -c 'val-c 2'  # @TODO: разобраться как получать значения
while [ -n "$1" ]
do
  case "$1" in
  -a) echo "Found the -a option" ;;
  -b) echo "Found the -b option" ;;
  -c) echo "Found the -c option" ;;
  *) echo "$1 is not an option" ;;
  esac
  shift
done

echo '-------------------------------------------------------------------------'
echo "-- Информация о пользователе"
echo '-----'
echo "Логин пользователя                                  : '${LOGNAME}'"
echo "Каталог пользователя                                : '${HOME}'"
echo "Цифровой идентификатор текущего пользователя        : '${UID}'"
echo "Цифровой идентификатор группы текущего пользователя : '${GROUPS}'"
echo "Имя пользователя использованное для входа в систему : '${LOGNAME}'"

echo '-------------------------------------------------------------------------'
echo '-- Домашняя директория пользователя'
echo '-----'
#echo "\$(~)          : '$(~)'" Так не катит
echo "~             :" && echo ~
echo "\$(realpath ~) : '$(realpath ~)'"
echo "\$(dirname ~)  : '$(dirname ~)'"  # Каталог на уровень выше чем ~
echo "\${HOME}       : '${HOME}'"
echo '-------------------------------------------------------------------------'

#------------------------------------------------------------------------------
exit 0 #Выход с кодом 0 (удачное завершение работы скрипта)
