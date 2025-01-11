# Заметки по использованию git

## Ссылки на документацию. 

https://git-scm.com/book/ru/v2

## Настройка GIT

https://git-scm.com/docs/gitattributes

````bash
#-------------------------------------------------------------------------------
# Настройка
#---
# Получить список текущих настроек
## Впремешку
git config --list
## Локальные настройки проекта (<project>/.git/config )
git config --list --local
## Глобальне настройки GIT
git config --list --global

# Удалить локальную опцию
git config --unset <опция> 
# Удалить глобальную опцию 
git config --unset --global <опция>

# Удалить секцию настроек
git config --remove-section <название>
## Например
git config --remove-section submodule.library/dio-zf1future

# Смена настроек проекта
# Пробую убрать глобальные настройки пользователя, чтобы при коммитах случайно не
## Имя пользователя
git config --global user.name ""
git config --local user.name "Ivan Zahliada"
## e-mail пользователя
git config --global user.email ""
git config --local user.email my-mail@gmail.com

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


#------------------------------------------------------------------------------
# core.autocrlf - замена перевода строк
# https://g.co/gemini/share/0f1ba0cc6eee
#----

## Коммит как есть - перевод строк не меняется
git config core.autocrlf input
## CRLF заменяется на LF
git config core.autocrlf true
## LF заменяется на CRLF 
git config core.autocrlf false

#------------------------------------------------------------------------------
# core.bare
# https://git-scm.com/docs/git-config
# Если это правда, предполагается, что этот репозиторий пуст и не имеет 
# связанного с ним рабочего каталога. 
# В этом случае ряд команд, требующих рабочий каталог, будут отключены, 
# например git-add[1] или git-merge[1].
#----

# 1.
git init 
# опция в состоянии "true"

# 2.
git remote add origin <url>
# опция в состоянии "false" 
 

#------------------------------------------------------------------------------
# core.logAllRefUpdates
# Управляет $GIT_DIR/logs/<ref>
# @TODO: разобраться
# В этой папке для каждой из веток локального и удаленных репозитариев хранится список хешей.
# Что-зачем и почему - ХЗ. Возможно, это кеширование чтобы не дергать удаленные репы.
#----

#------------------------------------------------------------------------------
# core.logallrefupdates
#-----

# code.filemode - опция Git используется для контроля прав доступа к файлам в репозитории.
# https://git-scm.com/docs/git-config
# https://g.co/gemini/share/3c5d93d7a9b2
# Она позволяет указать режим прав доступа по умолчанию для новых файлов, создаваемых в репозитории.
## Удалить локальную опцию. Применяется, чтобы начала действовать глобальная. 
git config --unset core.filemode
## Удалить глобальную опцию
git config --unset --global core.filemode
# Игнорировать смену прав на файлах
## Для проекта
git config core.filemode false
## Глобально
git config --global code.filemode false
````
### Настройка GIT/Вывод отладочной информации

````bash
export GCM_TRACE=1

export GIT_TRACE=0
git config --global credential.helper
# /var/www/git-credential-helper.sh
export GIT_TRACE=1
git config --global credential.helper
# 13:46:06.351349 git.c:460               trace: built-in: git config --global credential.helper
# /var/www/git-credential-helper.sh
# И тут же удалим локальные настройки "credential"
git config --remove-section credential

````

### Настройка GIT/credential

Настройки кеширования логинов/паролей/токенов.  
* [7.14 Инструменты Git - Хранилище учётных данных](https://git-scm.com/book/ru/v2/Инструменты-Git-Хранилище-учётных-данных)
* [gitfaq#http-credentials-environment](https://git-scm.com/docs/gitfaq#http-credentials-environment)


*Подстановка данных авторизации из переменных окружения*
1. К примеру, мы имеем свой git репозитарий с URL "https://gitlab.repo.local".
   Хотим склонировать "https://gitlab.repo.local/lib/my-slim-fork.git".
   Репозитарий всюду требует авторизации и нам нужно сделать это автоматически в CI/CD.   
2. Для решения этой задачи выносим авторизационные данные в переменные окружения и настраиваем подмену URL командой вида.  
[@see: stackoverflow; how-can-i-save-username-and-password-in-git](https://stackoverflow.com/questions/35942754/how-can-i-save-username-and-password-in-git) 
```shell
# old-fragment - URL без авторизации
# new-fragment - URL с авторизацией 
git config --global url."new-fragment".insteadOf "old-fragment" 
```
При этом данные из переменных окружения попадут в виде статичного текста в файл "~/.gitconfig". Нужно следить чтобы этот файл не увели.
```shell
cat ~/.gitconfig
```
3. Подставляем логин/пароль из переменных окружения GIT_LOGIN и GIT_PASS (@NOTE: проверено, работает) 
```shell
git config --global url."https://$GIT_LOGIN:$GIT_PASS@gitlab.repo.local/".insteadOf "https://gitlab.repo.local/"
git clone https://gitlab.repo.local/lib/my-slim-fork.git
```
```text
$cat ~/.gitconfig
[url "https://my-login:my-pass@gitlab.repo.local/"]
 	insteadOf = https://gitlab.repo.local/
```
3. Подставляем token из переменной окружения GIT_TOKEN (@NOTE: проверено, работает)
```shell
git config --global url."https://api:$GIT_TOKEN@gitlab.repo.local/".insteadOf "https://gitlab.repo.local/"
git clone https://gitlab.repo.local/lib/my-slim-fork.git
```
```text
$cat ~/.gitconfig
[url "https://api:glpat-...@gitlab.repo.local/"]
	insteadOf = https://gitlab.repo.local/
```
4. Подставляем token ключ из переменной окружения GIT_TOKEN для запросов по git-протоколу (@NOTE: проверено, работает)
```shell
git config --global url."https://git:$GIT_TOKEN@gitlab.repo.local/".insteadOf "git@gitlab.repo.local:"
git clone git@gitlab.repo.local/lib/my-slim-fork.git
```
```text
$cat ~/.gitconfig
[url "https://git:glpat-...@gitlab.repo.local/"]
	insteadOf = git@gitlab.repo.local:
```
5. Подставляем ssh ключ из переменной окружения GIT_SSH_KEY (@TODO: проверить) 
```shell
git config --global url."https://ssh:$GIT_SSH_KEY@gitlab.repo.local/".insteadOf "ssh://git@gitlab.repo.local/"
git clone ssh://git@gitlab.repo.local//lib/my-slim-fork.git
```



---

````bash
# Посмотреть что выставлено для в локальных настройках
# см. ".git/config"
git config credential
cat .git/config | grep "\[credential\]" -A 1
# [credential]
#      helper = /var/www/git-credential-helper1.sh

# Посмотреть что выставлено для в глобальных настройках
# см. ~/.gitconfig 
git config --global credential.helper


````
Стандартные помощники авторизации
````bash
#------------------------------------------------------------------------------
# Хранение в открытом виде в файле  ~/.git-credentials
#-----

# Устанавливаем глобально тип помощника "store"
## По умолчанию он хранит авторизационные данные в файле "~/.git-credentials"
git config --global credential.helper store
## Можно указать другой путь. 
## Например такой
git config --global credential.helper "store --file ~/SECRET/git/credentials.txt"

git clone https://my.repo.local/libs/my-lib.git
# Username for 'https://my.repo.local': myLogin
# Password for 'https://myLogin@my.repo.local': myPass
# После ввода логина и пароля данные сохранятся в файле
cat ~/.git-credentials
# https://myLogin:myPass@my.repo.local

# Внимание!!!
#   Если на одном хосте несколько библиотек для каждой из которых свой 
#   токен доступа, то выставляем этой репе опцию useHttpPath = true 
git config --global credential.my.repo.local.useHttpPath true
git config --global credential.my.repo.local.helper "store --file ~/git-my.repo.local.txt"  

#------------------------------------------------------------------------------
# Хранение в ~/.cache/git/socket
# Как дальше работает - ХЗ (надо разбираться).
git config --global credential.helper cache
````
Свой помощник авторизации
````bash
# Свой помощник авторизации
# Этот скрипт будет вызываться всякий раз, когда GIT потребуются авторизационные данные
git config --global credential.helper /var/www/git-credential-helper.sh
````

## Первые шаги. Создаем локальное хранилище и связываем с удаленным на githib 

````bash
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
````

## Отмена изменений

````bash
# Откатываем локальные изменения
git reset --hard HEAD

# Отменить локальные изменения с удалением не версионированных файлов
$ git clean -fd
````

## Работа с логом 

````bash
# Выводит лог в стандартном виде (hash, branch, tag,  author, date, comment)
$ git log 

# Выводит лог в одну строку. 
# При этом видно ветки и теги, на которые ссылаются некоторые коммиты.
$ git log  --oneline
````

## Получение информации о коммитах

````bash
#-----
# По имени специального указателя HEAD 
git cat-file -p HEAD
# tree 039602ea590b608dca94a29907a709a8e1669a74
# parent 0037ae28d5ea66824143db67a9c969ebc1f9c671
# author ...
# committer ...

#-----
# По хешу
git cat-file -p 0037a
## По хешу для первого коммита в репозитории (parent отсутствует)
# git cat-file -p 29889
# tree 44bb535cc33767c8703897c83e75b89d03bc9a65
# author ...
# committer ...

#-----
# По хешу для коммита с объединением веток.
# Видим, что у коммита два parent
git cat-file -p 98cc
# tree 30867346d49bc20c2965f0650b1bbb7dc0a2ce23
# parent 7bb2fd6fcfb1f6cade9042f6c99104dbe0f41cfe
# parent f74481d2e04d336460aa1e353747b2f0da669533
# author ...
# committer ...

````

## Работа с ветками

````bash
# Получить список веток в текущем репозитарии
# Ссылки на ветки во внешних репозитариях будут начинаться с "remotes/"
# Например, имеем внешние репы:
# "origin" - ссылка на основной репозитарий
# "oleg"   - ссылка на репозитарий Олега
# Результат:
#   dev
# * master
#  remotes/oleg/master
#  remotes/origin/HEAD -> origin/master
#  remotes/origin/dev
#  remotes/origin/master
$ git branch -a

# Переключиться на ветку master
$ git checkout master
````

## Работа с тегами

````bash
#-------------------------------------------------------------------------------
# Работа с тегами
#
# Скринкаст от Ильи Кантора.
# https://www.youtube.com/watch?v=N0V1Cm6DT30&list=PLDyvV36pndZEB7kWWocU4QSn-G78LoaEE
#---

$ git tag add v1.0.0 1913
# Теги по хешу
$ git describe 1913
# Информация по тегу
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

# Откроется редактор для ввода комментария к тегу 
$ git tag -a v1.0.0 1913
# Комментарий через параметр -m
$ git tag -a v1.0.0 1913   -m 'my comment'
$ git tag -a v1.0.0 master -m 'my comment'
````

## Работа с внешними репозитариями

````bash
# Получить список внешних репозитариев.
$ git remote -v
````

## Работа с субмодулями

### Предварительный итог изучения

**Для PHP программиста субмодули GIT приносят больше вреда, чем пользы.**

Интеграции в PhpStorm нет, а стирать пальцы о клавиатуру вообще не хочется.  
В контексте работы PHP программиста лучше использовать PHP-composer.  
В идеале, подключаемая библиотека должна быть стабильной и с правильным версионированием.  

Если же библиотека еще "сырая" и только выполняется ее выпиливание из монолитного проекта в отдельную репу, 
то загружаем эту библиотеку в "library/XYZ" как отдельный проект.  
При этом в основном проекте подключаем ее как репозиторий с типом "path".
````bash
# Клонируем сырую библиотеку
git clone https://myrepo.local/lib/dio-zf1future.git library/dio-zf1future
cd library/dio-zf1future
git checkout dev

# Говорим GIT, что нечего ему заглядывать в папку с либой 
echo '**/library/dio-zf1future/*' >> .gitignore
````
````JS
// composer.json
{
    "repositories": [
        {
          "type": "path",
          "url": "./library/dio-zf1future/"
        }
    ]
}
````

### Прорабатываем документацию по субмодулям GIT

````bash
# Добавить субмодуль в проект
git submodule add https://myrepo.local/lib/dio-zf1future.git library/dio-zf1future
git config --local  --add safe.directory ./library/dio-zf1future
git config --global --add safe.directory /var/www
# 1. Появляется файл <проект>/.gitmodules
# 
# [submodule "library/dio-zf1future"]
# 	path = library/dio-zf1future
# 	url = https://myrepo.local/lib/dio-zf1future.git
# 
# 2. Добавляется секция в <проект>/.git/config 
# 
# [submodule "library/dio-zf1future"]
# 	url = https://myrepo.local/lib/dio-zf1future.git
# 	active = true
# [safe]
# 	directory = ./library/dio-zf1future
# 
# 3. Появляется папка <проект>/.git/modules/library/dio-zf1future/
# В ней находится то, что должно быть в "dio-zf1future/.git" если его склонить
# Однако есть и отличия
# <проект>/.git/modules/library/dio-zf1future/config
#
#[core]
#	worktree = ../../../../library/dio-zf1future 
#

# Удалить субмодуль из проекта
## Удалится только секция  [submodule "library/dio-zf1future"] из <проект>/.git/config
## При этом файлы субмодуля останутся.
git config --remove-section submodule.library/dio-zf1future

git submodule update
# Submodule path 'library/dio-zf1future': checked out '2ab0e6eaa3226c2fb2c4bc1e50839132b1d39f92'

#------------------------------------------------------------------------------
# Какого-то фига папка "library/dio-zf1future" помечена как новая, 
# добавленная в индекс. 
# Но при этом закоммитить изменения нельзя
#-----
 
git status
# On branch master
# Changes to be committed:
#   (use "git restore --staged <file>..." to unstage)
#         new file:   library/dio-zf1future

git restore --staged library/dio-zf1future to unstage
# error: pathspec 'to' did not match any file(s) known to git
# error: pathspec 'unstage' did not match any file(s) known to git
````

@TODO: роазобраться и описать
[git-book/7.11 Инструменты Git - Подмодули](https://git-scm.com/book/ru/v2/%D0%98%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BC%D0%B5%D0%BD%D1%82%D1%8B-Git-%D0%9F%D0%BE%D0%B4%D0%BC%D0%BE%D0%B4%D1%83%D0%BB%D0%B8)
````bash

git submodule init

git clone --recurse-submodules https://github.com/chaconinc/MainProject

git submodule update --init
git submodule update --remote
git submodule update --remote --merge
git submodule update --remote --rebase

git fetch

git push --recurse-submodules=check
git push --recurse-submodules=on-demand

git submodule foreach 'git stash'
git submodule foreach 'git checkout -b featureA'
git diff; git submodule foreach 'git diff'

$ git config --global diff.submodule log
$ git diff
# Submodule DbConnector c3f01dc..d0354fc:
#   > more efficient db routine
#   > better connection routine
  
git submodule update --remote DbConnector

$ git config -f .gitmodules submodule.DbConnector.branch stable
$ git submodule update --remote
# remote: Counting objects: 4, done.
# remote: Compressing objects: 100% (2/2), done.
# remote: Total 4 (delta 2), reused 4 (delta 2)
# Unpacking objects: 100% (4/4), done.
# From https://github.com/chaconinc/DbConnector
#    27cf5d3..c87d55d  stable -> origin/stable
# Submodule path 'DbConnector': checked out 'c87d55d4c6d4b05ee34fbc8cb6f7bf4585ae6687'

# Локальная установка URL для субмодуля
git config submodule.<submodule-name>.url PRIVATE_URL
git config submodule.library/dio-zf1future.url PRIVATE_URL


git config alias.sdiff '!'"git diff && git submodule foreach 'git diff'"
git config alias.spush 'push --recurse-submodules=on-demand'
git config alias.supdate 'submodule update --remote --merge'
````

Если хотим вносить изменения в субмодуль  
См. [git-book/7.11 Инструменты Git - Подмодули/Работа с подмодулем](https://git-scm.com/book/ru/v2/%D0%98%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BC%D0%B5%D0%BD%D1%82%D1%8B-Git-%D0%9F%D0%BE%D0%B4%D0%BC%D0%BE%D0%B4%D1%83%D0%BB%D0%B8)
````BASH
# Внимание!!!
# Изначально субмодуль будет в состоянии "detached HEAD"
# Это означает, что локальные изменения будут потеряны после очередного выполнения "git submodule update"
#
# Если хотите, чтобы изменения в подмодуле отслеживались, потребуется выполнить несколько дополнительных шагов.
# Для подготовки репозитория подмодуля к такой работе с ним, нужно сделать две вещи. 
# Нужно перейти в каждый подмодуль и извлечь ветку, в которой будете далее работать. 
# Затем необходимо сообщить Git что ему делать, если вы внесли свои изменения, а затем получаете новые 
# изменения из удалённого репозитория командой git submodule update --remote. 
# Возможны два варианта
# 1. вы можете слить их в вашу локальную версию 
# 2. или попробовать перебазировать ваши локальные наработки поверх новых изменений.

# заходим в каталог субмодуля "DbConnector" и переключаемся на локальную ветку "stable" 
cd DbConnector/
git checkout stable
# Switched to branch 'stable'

# Переходим в каталог проекта и обновляем субмодуль "DbConnector" в режиме слияния
# В результате мы получим изменения с удаленного сервера и не потеряем локальные изменения. 
cd ..
git submodule update --remote --merge
# remote: Counting objects: 4, done.
# remote: Compressing objects: 100% (2/2), done.
# remote: Total 4 (delta 2), reused 4 (delta 2)
# Unpacking objects: 100% (4/4), done.
# From https://github.com/chaconinc/DbConnector
#    c87d55d..92c7337  stable     -> origin/stable
# Updating c87d55d..92c7337
# Fast-forward
#  src/main.c | 1 +
#  1 file changed, 1 insertion(+)
# Submodule path 'DbConnector': merged in '92c7337b30ef9e0893e758dac2459d07362ab5ea'

# Переходим в субмодуля "DbConnector" 
cd DbConnector/
# меняем исходный код
vim src/db.c
# коммитим в локальное хранилище
git commit -am 'Unicode support'
# [stable f906e16] Unicode support
#  1 file changed, 1 insertion(+)

# Затягиваем изменеия с удаленного сервера
## Переходим в каталог проекта
cd ..
## тянем изменения
## Внимание! Если не указать --remote или  --rebase, то субмодуль 
##           перейдет в состояние удаленного репозитория  и субмодуль будет в состоянии "detached HEAD"
##           Локальные изменеия останутся в локальной ветке 'stable'
git submodule update --remote --rebase
# First, rewinding head to replay your work on top of it...
# Applying: Unicode support
# Submodule path 'DbConnector': rebased into '5d60ef9bbebf5a0c1c1050f242ceeb54ad58da94'
##           Вот демонстрация того, что произойдет
git submodule update --remote
# Submodule path 'DbConnector': checked out '5d60ef9bbebf5a0c1c1050f242ceeb54ad58da94'
##
##           Если вы не зафиксировали ваши изменения в подмодуле и выполнили его обновление, то это 
##           приведёт к проблемам — Git получит изменения из удалённого репозитория, но не перезапишет 
##           несохранённые изменения в каталоге вашего подмодуля.
git submodule update --remote
# remote: Counting objects: 4, done.
# remote: Compressing objects: 100% (3/3), done.
# remote: Total 4 (delta 0), reused 4 (delta 0)
# Unpacking objects: 100% (4/4), done.
# From https://github.com/chaconinc/DbConnector
#    5d60ef9..c75e92a  stable     -> origin/stable
# error: Your local changes to the following files would be overwritten by checkout:
# 	scripts/setup.sh
# Please, commit your changes or stash them before you can switch branches.
# Aborting
# Unable to checkout 'c75e92a2b3855c9e5b66f915308390d9db204aca' in submodule path 'DbConnector'
##            Если ваши локальные изменения в подмодуле конфликтуют с какими-либо изменениями в удалённом репозитории, 
##            то Git вам сообщит об этом при обновлении подмодуля.
git submodule update --remote --merge
# Auto-merging scripts/setup.sh
# CONFLICT (content): Merge conflict in scripts/setup.sh
# Recorded preimage for 'scripts/setup.sh'
# Automatic merge failed; fix conflicts and then commit the result.
# Unable to merge 'c75e92a2b3855c9e5b66f915308390d9db204aca' in submodule path 'DbConnector'

#------------------------------------------------------------------------------
# Чтобы не потерять изменения их нужно залить на удаленный сервер
# См. раздел "Публикация изменений подмодуля" в главе "7.11 Инструменты Git - Подмодули"
#----

git push --recurse-submodules=check
git push --recurse-submodules=on-demand

#------------------------------------------------------------------------------
# См. раздел "Слияние изменений подмодуля" в главе "7.11 Инструменты Git - Подмодули"
#----

````

Ошибки
````bash
git -c credential.helper= -c core.quotepath=false -c log.showSignature=false commit -F /tmp/git-commit-msg-.txt --
# warning: adding embedded git repository: library/dio-zf1future
# hint: You've added another git repository inside your current repository.
# hint: Clones of the outer repository will not contain the contents of
# hint: the embedded repository and will not know how to obtain it.
# hint: If you meant to add a submodule, use:
# hint: 
# hint: 	git submodule add <url> library/dio-zf1future
# hint: 
# hint: If you added this path by mistake, you can remove it from the
# hint: index with:
# hint: 
# hint: 	git rm --cached library/dio-zf1future
# hint: 
# hint: See "git help submodule" for more information.
git config --global --add safe.directory /var/www
git config --local  --add safe.directory ./library/dio-zf1future

````

## Практические примеры

### RAW

````bash
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



#------------------------------------------------------------------------------

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
````

### Залить локальный репозиторий с историей на github

````bash
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
````

### Затягивание изменений из удаленного репозитария в локальный

````bash
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
````

### Заливка нескольких локальных изменений на удаленный репозитарий в виде одного коммита  

````bash
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
````
