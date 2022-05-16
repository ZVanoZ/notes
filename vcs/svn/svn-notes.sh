# Извлекает проект "someProgect" с сервера в текущую папку 
# В текущей папке появится подкаталог "someProgect", который будет связан с удаленнын репозитарием
$svn checkout svn://svnserver/someProgect

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

# Добавить паку "src" в список "для коммита". При этом содержимое папки тоже попадет в список.
$ svn add src 

# Добавить паку "build" в список "для коммита". При этом не добавлять  содержимое папки.
$ svn add -N build

# Загружает в локальную копию изменения с SVN-сервера
$ svn update

# Коммит указанной директории (закоммитится только папка "docker", а остальное останется в текущем состоянии)
$ svn commit ./docker/ -m "Commit notes for our dockerfiles"

# Создаем папку "some-project" в корне репозитария. 
# Таким способом базовую структуру можно создать за 4 коммита
svn mkdir http:/svnserver/svn/some-project/ -m "mktir for new project"
# Создаем базовую структуру для проекта "some-project" за один коммит
svn mkdir --parents http:/svnserver/svn/some-project/trunk http:/svnserver/svn/some-project/branches http:/svnserver/svn/some-project/tags -m "#0000 create empty structure for some-project"

# Сделать ветку на удаленном сервере.
$ svn copy svn://svnserver/var/bump/trunk svn://svnserver/var/bump/branches/my-branch -m="Creating a private branch of /bump/trunk"

# Перенести на удаленном сервере папку из одного места в другое 
# В данном случае переименование someProgect1 в someProgect2
$ svn move svn://svnserver/someProgect1 svn://svnserver/someProgect2

# Локально. Перенести папку "myCompany-myLibrary" в папку "./my-company/my-library"
svn mv myCompany-myLibrary ./my-company/my-library

# Отобразить список файлов и каталогов в удаленном репозитарии
svn list svn://svnserver/var/bump/branches

# Переключить локальную копию на ветку.
# Эту же команду использовать, если проект переехал в другое место.
# Например, если выполнили "$ svn move ..."
svn switch svn://svnserver/var/bump/branches/my-branch

# Предварительно ("--dry-run") посмотреть что будет, если попытаемся слить trunk с my-branch1
# \> На момент вызова текущая директория  trunk
$ svn merge svn://svnserver/my-project1/trunk svn://svnserver/my-project1/branches/my-branch1 --dry-run
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

# Получить список измененныз файлов зная ревизию.
# Полезно когда в одной директории сервра много проектов и не знаем в каком проекте сделать изменения.
# По номеру ревизии получаем путь к проекту.
$ svn log -v -r 4112:4112 http://svnserver/many-projects-root/

#-------------------------------
# Работа со свойствами
#----
# Справка по синтаксису команды
$ svn help propset

#  Получить список свойств для текущей папки "."
$ svn proplist

# Получить список игноров для текущей папки "." (значение свойства "svn:ignore").
$ svn propget svn:ignore .
# Получить список игноров для папки ".gradle"
$ svn propget svn:ignore .gradle/

# Для текущей папки "." установить игнорирование подпапки ".idea"
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
#-------------------------------
# Сценарий: создать структуру папок под новый проект
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
#-------------------------------
# Сценарий: откатить последний коммит
# Допустим, коммит с ошибкой имеет номер 5271
#----
# Приводим локальную копию к предыдущему состоянию
$ svn merge -c -5271 .
# Проверяем изменения
$ svn status
# Откат. Т.е. коммитим изменения.
$ svn commit -m "Откат r5271 из задачи #XXX"
#-------------------------------

