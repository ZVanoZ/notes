#!/bin/bash
cd $(dirname $(readlink -e $0)) #переход в директорию текущего скрипта

#------------------------------------------------------------------------------------

git clone https://github.com/vanzan01/cursor-memory-bank.git cursor-memory-bank
mkdir app
cp -vr cursor-memory-bank/.cursor app/

cd app
git init
git config --local user.email "example@gmail.com"
git config --local user.name "your-name"
git add .cursor
git commit -m "'vanzan01/cursor-memory-bank' копирование базовых правил"

#------------------------------------------------------------------------------------
# Дальнейшие действия
#----

cat <<EOF
---
* Инициализация
# Открываем программу Cursor 2+
# Открываем ранее созданную папку "app"
# Открываем чат. Выбираем режим Agent.
# Вбиваем в чат текст "/van" и жмем 'Отправить'.
Появится директория 'memory-bank'.
Коммитим эту директорию
# Заменяем в 'memory-bank' описание проекта на свое и снова коммитим.
---
EOF
