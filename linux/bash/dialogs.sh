#!/bin/bash

#------------------------------------------------------------------------------

echo 'При нажатии кнопки все живое на планете будет уничтожено.'
read -p "Вы хотите продолжить (y/n)? " answer
case $answer in
y) echo "Запуск ядерных ракет...";;
n) echo "Выход. Операция отменена пользователем."
  exit 1
  ;;
*)
    echo "Выход. Пользователь ввел что-то непонятное."
    echo "answer : ${answer}"
    exit 2
    ;;
esac

echo "Поздравляю. Вы уничтожили жизнь на планете."
#------------------------------------------------------------------------------