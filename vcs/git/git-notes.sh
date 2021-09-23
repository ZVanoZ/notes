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

# ----------------
# Имеем клон репозитория.
# Нужно следить за актуальностью.
#-----

$ git remote -v
# origin	https://github.com/laminas/laminas-db.git (fetch)
# origin	https://github.com/laminas/laminas-db.git (push)

$ git status
# На ветке 2.13.x
# Ваша ветка отстает от «origin/2.13.x» на 27 коммитов и может быть перемотана вперед.
#   (используйте «git pull», чтобы обновить вашу локальную ветку)

$ git pull
# remote: Enumerating objects: 23, done.
# remote: Counting objects: 100% (23/23), done.
# remote: Compressing objects: 100% (16/16), done.
# remote: Total 23 (delta 9), reused 21 (delta 7), pack-reused 0
# Распаковка объектов: 100% (23/23), готово.
# Из https://github.com/laminas/laminas-db
# ...
# 338 files changed, 6490 insertions(+), 5591 deletions(-)
# delete mode 100644 phpcs.xml
# create mode 100644 phpcs.xml.dist


$ git branch -a
#  2.12.x
#* 2.13.x
#  2.14.x
#  remotes/origin/2.11.x
#  remotes/origin/2.12.x
#  remotes/origin/2.13.x
#  remotes/origin/2.13.x-merge-up-into-2.14.x_3Y5r1t4x
#  remotes/origin/2.13.x-merge-up-into-2.14.x_LxxfGKFv
#  remotes/origin/2.14.x
#  remotes/origin/HEAD -> origin/2.13.x
#  remotes/origin/dev-3.0.0
#  remotes/origin/dev-3.0.0-old
#  remotes/origin/gh-pages


#-----------------
#-- Настройка прокси
#-----
git config --global http.proxy http://my-proxy.local:3128
git config --global https.proxy http://my-proxy.local:3128
#----------------
#-- Настройка глобального .gitignore, чтобы игнорить папки типа ".idea"
#-- https://git-scm.com/docs/gitignore
#-- search: "$HOME/.config/git/ignore is used instead"
#-----
$ touch ~/.config/git/ignore
$ echo ".idea" >> ~/.config/git/ignore
# ----------------


