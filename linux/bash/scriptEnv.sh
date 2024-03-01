#!/bin/bash
# указываем где у нас хранится bash-интерпретатор
#------------------------------------------------------------------------------
# В данном скрипте команды, позволяющие извлечь разную полезную информацию
# link=https://habrahabr.ru/post/47163/
# Запускаем: bash b000.sh xxx YYY
#------------------------------------------------------------------------------
# Базовый синтаксис echo
#-----
echo '--------------------------'
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
echo '-------------------------------'
echo "Текущий каталог                : `pwd`"
echo "Относительный туть к скрипту   : '$0'"
echo "Полный путь к скрипту          : "$(readlink -e $0)
echo "Полный путь к каталогу скрипта : "`dirname $(readlink -e $0)`
echo "Смена текущего каталога...     : "
cd $(dirname $(readlink -e $0))                  # переход в директорию текущего скрипта
echo "Текущий каталог (1)            : `pwd`"    # выполняем команду pwd при помощи скобок "`"
echo "Текущий каталог (2)            : $(pwd)"   # выполняем команду pwd при помощи "$(команда)"
echo "Текущий каталог (3)            : ${PWD}"   # берем из переменной окружения PWD
echo '-------------------------------'
#------------------------------------------------------------------------------
# Параметры командной строки
#-----
echo '--------------------------'
echo "\$*: '$*'"   # Возвращает все аргументы вызова
echo "\$@: '$@'"   # Возвращает все аргументы вызова
echo "\$#: '$#'"   # Возвращает количество параметров
echo "\$0: '$0'"   # Возвращает название текущего скрипта
echo "\$1: '$1'"   # Возвращает значение аргумента 1
echo "\$2: '$2'"   # Возвращает значение аргумента 2
#------------------------------------------------------------------------------
# Информация о пользователе
#-----
echo '--------------------------'
echo "Логин пользователя: '${LOGNAME}'"
echo "Каталог пользователя: '${HOME}'"
echo "Цифровой идентификатор текущего пользователя: '${UID}'"
echo "Имя пользователя использованное для входа в систему: '${LOGNAME}'"
#------------------------------------------------------------------------------
exit 0 #Выход с кодом 0 (удачное завершение работы скрипта)
