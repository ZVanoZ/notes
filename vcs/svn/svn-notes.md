
## Полезные ссылки


* "Краткая шпаргалка по основным командам [Subversion](https://eax.me/svn-commands)

---

## Работа с репозитарием на внешнем сервере

* Создаем базовую структуру для проекта "some-project"

  * Удаленно за 4 коммита

Создаем папку "some-project" в корне репозитария. Затем создаем в ней 3 папки.  
````shell
svn mkdir http:/svnserver/svn/some-project/         -m "mktir for new project"
svn mkdir http:/svnserver/svn/some-project/branches -m "mktir for new project - branches"
svn mkdir http:/svnserver/svn/some-project/tags     -m "mktir for new project - tags"
svn mkdir http:/svnserver/svn/some-project/trunk    -m "mktir for new project - trunk"
````

  * Удаленно за один коммит

````shell
svn mkdir --parents http:/svnserver/svn/some-project/trunk http:/svnserver/svn/some-project/branches http:/svnserver/svn/some-project/tags -m "#0000 create empty structure for some-project"
````

* Сделать ветку на удаленном сервере.

````shell
svn copy svn://svnserver/var/bump/trunk svn://svnserver/var/bump/branches/my-branch -m="Creating a private branch of /bump/trunk"
````

* Перенести на удаленном сервере папку из одного места в другое.

В данном случае переименование someProgect1 в someProgect2
````shell
svn move svn://svnserver/someProgect1 svn://svnserver/someProgect2
````

* Отобразить список файлов и каталогов в удаленном репозитарии

````shell
svn list svn://svnserver/var/bump/branches
````

---

##  Работа с локальной копией


* Извлекает проект "someProgect" с сервера в текущую папку

В текущей папке появится подкаталог "someProgect", который будет связан с удаленнын репозитарием
````shell
svn checkout svn://svnserver/someProgect
````


* Добавить паку "src" в список "для коммита". 

При этом содержимое папки тоже попадет в список.
````shell
svn add src
```` 

* Добавить паку "build" в список "для коммита".

При этом не добавлять  содержимое папки.
````shell
svn add -N build
````

* Загружает в локальную копию изменения с SVN-сервера
````shell
svn update
````

* Коммит указанной директории 

Закоммитится только папка "docker", а остальное останется в текущем состоянии.
````shell
svn commit ./docker/ -m "Commit notes for our dockerfiles"
````

* Перенести папку "myCompany-myLibrary" в папку "./my-company/my-library" (Локально).

````shell
svn mv myCompany-myLibrary ./my-company/my-library
````

* Переключить локальную копию на ветку.

Эту же команду использовать, если проект переехал в другое место.

Например, если выполнили "$ svn move ..."

````shell
svn switch svn://svnserver/var/bump/branches/my-branch
````

````shell
# Предварительно ("--dry-run") посмотреть что будет, если попытаемся слить trunk с my-branch1
# \> На момент вызова текущая директория  trunk
## Сравнить две ветки на удаленом сервере
svn merge svn://svnserver/my-project1/trunk svn://svnserver/my-project1/branches/my-branch1 --dry-run
## Сравнить ветку сервера и локальное состояние
svn merge svn://svnserver/my-project1/trunk ./ --dry-run

## Если конфликтов с локальной копией овердофига, то задолбаемся улаживать в консоли.
## Поэтому применяем "--accept postone"
## Например, на локальном диске в "./" лежит копия бренча и в нее нужно влить изменения с trunk
## После выполнения команды открываем графическую утилиту и страдаем от улаживания трехсторонних конфликтов :(
svn merge --accept postpone svn://svnserver/my-project1/trunk ./

# Улаживание конфликта деревьев.
## Принять текущее состояние папки "./docker/web" как рабочее
svn resolve --accept working -R ./docker/web

# Отмена локальных изменений в текущей папке и ниже.
svn revert -R ./
````

---

## Просмотр истории

[svn Subcommands: svn log](https://svnbook.red-bean.com/en/1.7/svn.ref.svn.c.log.html)
[Revision Keywords](https://svnbook.red-bean.com/en/1.7/svn.tour.revs.specifiers.html#svn.tour.revs.keywords)

* Получить последние 10 изменений в репозитарии

````shell
svn log -l 10 http://svnserver/many-projects-root/
````


````shell
# Получить список измененных файлов зная ревизию.
# Полезно когда в одной директории сервера много проектов и не знаем в каком проекте сделать изменения.
# По номеру ревизии получаем путь к проекту.
#
# Параметры
# -----------------------------------------------------
# -v --verbose  : выводит список измененных файлов
# -r --revision : ограничение по ревизиям
#               : -r 1729
#               : -r 1729:HEAD
#               : -r 1729:1744
#               : -r {2001-12-04}:{2002-02-17}
#               : -r 1729:{2002-02-17}
# -q --quiet    : без комментария к коммиту
# -----------------------------------------------------
## Заголовок, комментарий
$ svn log     -r 4112:4112 http://svnserver/many-projects-root/
## Заголовок
$ svn log -q  -r 4112:4112 http://svnserver/many-projects-root/
## Заголовок, комментарий, список файлов
$ svn log -v  -r 4112:4112 http://svnserver/many-projects-root/
## Заголовок, список файлов
$ svn log -vq -r 4112:4112 http://svnserver/many-projects-root/

# Получить список коммитов по номеру задачи
svn log |grep "#39603" -B 2
````

---

## Просмотр изменений в локальной копии

````shell
# Показывает информацию о локальной копии
$ svn info

# Показывает изменения в локальной копии:
# M - (modified) изменен
# A - (added) Добавлен
# D - (deleted) Помечен на удаление в SVN
# ! - Удален в локальной файловой системе, но не помечен на удаление в SVN
# X - Внешняя ссылка на ресурс, подключаемый через атрибут "svn:externals"
# L - (locked) файл или папка заблокированы. Разрешение конфликтов совместного доступа.
# см. "Три значения «Блокировки»" в https://tortoisesvn.net/docs/release/TortoiseSVN_ru/tsvn-dug-locking.html
$ svn status

# Показывает изменения в локальной копии, при этом не учитывает (M - modified, A - added, D - deleted) файлы
$ svn status | grep "^[^MAD]"


# Показывает все изменения в локальной копии
$ svn diff
# Показывает изменения файла "my-file.txt" в локальной копии
$ svn diff my-dir/my-file.txt

````
---

## Работа со свойствами

````shell
# Справка по синтаксису команды
$ svn help propset

#  Получить список свойств для текущей папки "."
$ svn proplist

# Получить список игноров для текущей папки "." (значение свойства "svn:ignore").
$ svn propget svn:ignore .
# Получить список игноров для папки ".gradle"
$ svn propget svn:ignore .gradle/

# Для текущей папки "." установить игнорирование подпапки ".idea"
## @INFO: см. "Глобальные настройки игнорирорования" для расширения темы
# - т.е. папка ".idea" не будет добавлена под управление SVN.
$ svn propset svn:ignore .idea .
# Для папки ".gradle" установить свойство "svn:ignore *"  
# - т.е. папка ".gradle" будет добавлена в SVN, а ее содержимое нет (содержимое не коммитится).
svn propset svn:ignore "*" .gradle



# ???
$ svn propedit svn:ignore .
#  Удалить свойство игноров для текущей папки "."
$ svn propdel svn:ignore
#------ 
# Работа со свойством "svn:externals"
# @see: http://sysadminnotebook.blogspot.com/2012/02/set-svn-svnexternals-in-command-line.html
#--
# 1. Переходим внутри проекта в папку, которой будем лепить атрибут
$ cd docs/ext3
# 2. Текущему каталогу "." (он же "docs/ext3") добавить атрибут "svn:externals"
# Этот атрибут загружает в папку "src" содержимое 3й ревизии ("-r3") из 
# внешнего репозитария "http://company.repo.com/svn/repo1/libs/ExtJs/3.4.0.full/src"
$ svn propset svn:externals 'src -r3 http://my-company-repo.com/svn/repo1/libs/ExtJs/3.4.0.full/src' .
# 3. Коммитимся. @TODO: Разобраться - возможно, этот шаг необязательно делать на данном этапе.
$ svn commit -m "Добавили ссылку на внешний репо"
# 4. Обновляем папку. Выполнится попытка затянуть файлы из внешего репозитария
$ svn update
Updating '.':
Fetching external item into 'src':
A    src/adapter
A    src/state
A    src/ext-core
...
#-- То же самое через конфиг
# 1. создаем файл конфига (находимся в корне выгруженного проекта)
$ touch ./.svn-settings/svn.externals
# В файл добавляем строчки
./docs/ext3/src -r3 http://my-company-repo.com/svn/repo1/libs/ExtJs/3.4.0.full/src
# 2. Применяем конфиг
# Текущей директории "." добавится атрибут "svn:externals", значение 
# которого будет взято из файла ".svn-settings/svn.externals"
$  svn propset svn:externals -F .svn-settings/svn.externals .
# 3. Обновляем папку. Выполнится попытка затянуть файлы из внешего репозитария
$ svn update
# 4. Коммитимся.
$ svn commit -m "Добавили ссылку на внешний репо"
#------

````

---

## Сценарий: создать структуру папок под новый проект

````shell
# Допустим, проект с названием "my-project-1"
#----
$ cd ~/projects
$ mkdir my-project-1
$ cd my-project-1
$ mkdir branches tags tags 
$ svn import . http://svn.my.server.net/my-project-1 -m 'Создание директорий под проект'
$ svn ls http://svn.my.server.net/my-project-1
branches/
tags/
trunk/
$ svn checkout http://svn.my.server.net/my-project-1/trunk ~/projects/my-project-1.trunk
````

---

## Тема: Глобальные настройки игнорирорования

Вносим изменения в конфиг subversion:
   Windows Vista/7/8/8.1/10: C:\Users\<username>\AppData\Roaming\Subversion\config
   Windows XP: c:\Documents and Settings\<username>\.subversion\config
   Unix (Linux, etc), macOS: $HOME/.subversion/config

* Задача: требуется глобально установить игнорирование папки ".idea".

Т.е. какой бы проект не открыли, папка будет игнориться.

Редактируем опцию "miscellany.global-ignores" конфига subversion

````ini
[miscellany]
global-ignores = .idea
````


## Задача: откатить последний коммит

Допустим, коммит с ошибкой имеет номер 5271


1. Приводим локальную копию к предыдущему состоянию
````shell
svn merge -c -5271 .
````
2. Проверяем изменения
````shell
svn status
````
3. Откат. Т.е. коммитим изменения.
````shell
svn commit -m "Откат r5271 из задачи #XXX"
````


## Задача: вернуть HEAD в состояние на какую-то ревизию

Допустим, мы сделали несколько ошибочных коммитоы, и хотим вернуть все назад

При этом мы готовы потерять все изменения, сделанные между этими ревизиями

````shell
# Шаг 1: приводим состояние локальной копии к .r7228
# .r7236 - последняя ревизия с ошибками 
# .r7228 - самая свежая ревизия без ошибок
$svn merge -r 7236:7228 http://svn.my.server.net/my-project-1/trunk

# Шаг 2: коммитим текущее состояние
$ svn commit -m "Откат r7236 до состояния r7228"
````


## Задача: откатить коммит, который не является HEAD

````shell

#
# Допустим, коммит с ошибкой имеет номер 22868
# Решается через path
#----

#  Шаг 0. Переходем в папку с проектом
cd "my-project.trunk"

#  Шаг 1. Генерируем diff-файл между ошибочной ревизией 22868 и той, которая была перед ней 22867
# Файл ляжет в /tmp/1.diff
svn diff -r 22867:22868 >/tmp/1.diff

# Шаг 2. Оцениваем список изменений
patch -R -p0 -i /tmp/1.diff --dry-run

# Шаг 3. Выполняем откат.
# При этом файлы, созданные в .r22868 останутся, но будут пустыми (их нужно удалить вручную).
patch -R -p0 -i /tmp/1.diff

# Шаг 4. Коммитим изменения.
svn commit -m "Откат r22868 в HEAD"
````


## Задача: получить список авторов для миграции при помощи git svn clone

````shell
svn log --quiet http://svn.my.server.net/my-project-1/trunk | awk '{print $3}' | sort | uniq
# Получим что-то типа:
# --
# author1
# some-author2
# --

# Копируем полученный список в файл "authors.txt
# Модифицируем:
# --
# author1=author1 <author1@my-company.com>
# some-author2=some-author2 <some-author2@my-company.com>
# (no author) = no-author <no-author@my-company.com>
# --

git svn clone --authors-file=authors.txt ...
````
