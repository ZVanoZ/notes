# Заметки по использованию git
#-------------------------------------------------------------------------------
# https://git-scm.com/book/ru/v2
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Первые шаги. Создаем локальное хранилище и связываем с удаленным  на githib
#---
echo "# notes" >> README.md
# Создаем в текущем каталоге .git
git init
# Ставим маркер "Добавить под управление GIT"
git add README.md
# Коммитим в локальный репозитарий
git commit -m "first commit"
# Связываем локальный репозитарий с внешним.
git remote add origin https://github.com/ZVanoZ/notes.git
# Выгружаем локальные изменения на внешний репозитарий.
git push -u origin master

# …or push an existing repository from the command line
git remote add origin https://github.com/ZVanoZ/notes.git
git push -u origin master

# …or import code from another repository
# You can initialize this repository with code from a Subversion, 
# Mercurial, or TFS project.
# @{link https://github.com/ZVanoZ/notes/import}



#-------------------------------------------------------------------------------
# Практические примеры
#---
#Отображает изменения в локальной копии
git status
# Переименовать файл "./git/readme.md" в "./git/git-notes.sh"
git mv ./git/readme.md ./git/git-notes.sh
# Перенести каталог "./git" в "./vcs/git"
git mv ./git ./vcs/git
# Помечает на удаление директорию "sander"
git rm -r sander
# Ставим маркер "Добавить под управление GIT" всем файлам, которые 
# не под управлением GIT
git add .
# Ставим маркер "Добавить под управление GIT" конкретному файлу
git add PHP/readme.md

# Фиксирует изменения в локальную копию
git commit -m "Реорганизация песочницы"
#
git checkout

