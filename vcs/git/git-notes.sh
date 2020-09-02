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
# Отменить локальные изменения и загрузить файлы из "master"
$ git checkout master --force

# ----------------
# Имеем локальный репозиторий с историей разработки.
# Хотим залить все на github и не потерять историю
# 1. Создаем пустой репозитарий на github
# Получаем ссылку "https://github.com/ZVanoZ/zim-material-ui-sample.git"
# 2. Переходим в папку локального проекта
$ cd local-zim-material-ui-sample
# 3. Связываем локалный проект с репозиторием github
$ git remote add origin https://github.com/ZVanoZ/zim-material-ui-sample.git
# 4. Выгружаем все ветки
$ git push origin --all
# 5. Выгружаем все теги
$ git push origin --tags
#-----------------
#-- Настройка прокси
#-----
git config --global http.proxy http://my-proxy.local:3128
git config --global https.proxy http://my-proxy.local:3128
#----------------
#-- Настройка глобального .gitignore, чтобы игнорить папки типа ".idea"
#-----
$ touch ~/.config/git/ignore
$ echo ".idea" >> ~/.config/git/ignore
# ----------------


