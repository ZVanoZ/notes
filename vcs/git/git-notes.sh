# Заметки по использованию git
#-------------------------------------------------------------------------------
# https://git-scm.com/book/ru/v2
#-------------------------------------------------------------------------------
# Настройка
#---

#   Глобально назначить текстовый редактор "atom" для редактирования 
# комментариев к коммитам, либо при указании правил обхединения коммитов для
# команды rebase.
git config --global core.editor "atom --wait"

# Настройка прокси.
git config --global http.proxy http://my-proxy.local:3128
git config --global https.proxy http://my-proxy.local:3128

# Настройка глобального .gitignore, чтобы игнорить папки типа ".idea"
# @see: https://git-scm.com/docs/gitignore
# @see: https://tyapk.ru/blog/post/gitignore
# search: "$HOME/.config/git/ignore is used instead"
touch ~/.config/git/ignore
echo ".idea" >> ~/.config/git/ignore

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
# Работа с логом
#---

# Выводит лог в стандартном виде (hash, branch, tag,  author, date, comment)
$ git log 

# Выводит лог в одну строку. 
# При этом видно ветки и теги, на которые ссылаются некоторые коммиты.
$ git log  --oneline

#-------------------------------------------------------------------------------
# Работа с тегами
#---

$ git tag add v1.0.0 1913
$ git show v1.0.0
$ git show --quiet v1.0.0
$ git log --oneline
$ git log --oneline v1.0.0
# Создать ветку "v1.x" от тега "v1.0.0"
$ git branche v1.x v1.0.0
# Список тегов
$ git tag
$ git tag --contains 1913
# Вывести теги и однк строку комментария
$ git tag -n1
$ git tag -n1 -l 'v1.1*'
# Удаление тегов
$ git tag -d v1.0.0 v1.1.0
#----
# Теги с аннотацией
$ git tag -a v1.0.0 1913



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
# Отменить локальные изменения с удалением не версионированных файлов
$ git clean -fd

# Хотим изменить комментарий предыдущего коммита.
# Команда создаст новый коммит с нужным комментарием, переставит ссылку ветки на него.
# При этом у нового коммита ссылка на предыдущий коммит будет на один шаг назад по истории.
# Коммит с ошибочным коммментарием будет "висящим" и очистится при сборке мусора через 90 дней.
$ git commit --amend
#[origin-issue#214 d62c479b] @fix: #214 "MySQL integration test fail in section testNamedParameters
# Date: Fri Sep 24 11:50:25 2021 +0300
# 1 file changed, 122 insertions(+), 21 deletions(-)

# Нужно подписать коммит перед pool-reqest т.к. на принимающей стороне DCO не
# пропускает коммиты без подписи
## 1. Локально подписываем коммит.
$ git commit --amend --no-edit --signoff
#[origin-issue#214 29f3b1c9] @fix: #214 "MySQL integration test fail in section testNamedParameters
# Date: Fri Sep 24 11:50:25 2021 +0300
# 1 file changed, 122 insertions(+), 21 deletions(-)
## 2. Отправляем изменения на github
## опция "-q" нужна в случае, когда для авторизации используется токен.
$ git push -q --force-with-lease origin origin-issue#214

#-------------------------------------------------------------------------------
# Задача:
# Имеем локальный репозиторий с историей разработки.
# Хотим залить все на github и не потерять историю
#-----

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


#-------------------------------------------------------------------------------
# Задача:
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

#-------------------------------------------------------------------------------
#   Задача: выполнить слияние нескольких коммитов, чтобы затем сделать 
# pool-request с одним коммитом.
# См. https://htmlacademy.ru/blog/boost/tools/how-to-squash-commits-and-why-it-is-needed
#---

# Проверяем, что мы назодимся на нужной ветке (в нашем случае это "origin-issue#214")
$ git branch
  2.13.fix.vagranfile
  2.13.x
  2.14.x
  2.14.x-fix-uniqid-in-test
  2.14.x-zvanoz-trashed
  2.14.x.test-by-docker
  2.14.x.zvanoz-fixtures
* origin-issue#214
  origin-issue#214-local

# Смотрим коммиты, которые были сделаны с момента ответвления от основной 
# ветки с названием "2.14.x"
$ git cherry -v 2.14.x
+ 1bef71c0e03d30925b03508fd2318b9362de73ab #214 @fix: "MySQL integration test fail in section testNamedParameters"
+ b4605830a83018863ac13ec6c5695b9401ef972e #214 @fix: "MySQL integration test fail in section testNamedParameters"/change failure test to any exception (because github-ci messages different of local messages)
+ a957818aad4fbfa433e2d2074f3066d060170b63 #214 @fix: "MySQL integration test fail in section testNamedParameters"/change code style by phpcs and "laminas/laminas-coding-standard"
+ 343b33b371dabb320da745e56d3caa99fb852e3c #214 @fix: "MySQL integration test fail in section testNamedParameters"/delete commited "phpcs.xml" (i'm sorry)
+ 808c64af56293e771f2a496ec27c7f69eec83555 #214 @fix: "MySQL integration test fail in section testNamedParameters"/fix test "testBindParamByFieldNameIsFail" - wrong name of a fieldName
+ 171cbec2a11e687a68a82e3793b7d0341a814451 Revert "#214 @fix: "MySQL integration test fail in section testNamedParameters"/fix test "testBindParamByFieldNameIsFail" - wrong name of a fieldName"
+ e8e55c252b44a04af6b1ae6e46f295268a1092d4 #214 @fix: "MySQL integration test fail in section testNamedParameters"/fix test "testBindParamByFieldNameIsFail" - wrong name of a fieldName

# Просим git посчитать сколько было коммитов. Получаем 7 штук.
$ git cherry -v 2.14.x |wc -l
7

# Объединяем 7 коммитов.
# Фактически, создаентся новый коммит в котором объединены все 7 коммитов.
# Затем ссылка текущей ветки("origin-issue#214") переставляется на новый коммит.
$ git rebase -i HEAD~7
#-------------------------------------------------------------------------------
