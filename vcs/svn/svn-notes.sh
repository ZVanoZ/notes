# Извлекает проект "someProgect" с сервера в текущую папку 
# В текущей папке появится подкаталог "someProgect", который будет связан с удаленнын репозитарием
$svn checkout svn://svnserver/someProgect

# Показывает информацию о локальной копии
$ svn info

# Показывает изменения в локальной копии
$ svn status
# Показывает изменения в локальной копии, при этом не учитывает (M - modified, A - added, D - deleted) файлы
$ svn status | grep "^[^MAD]"

# Добавить паку "src" в список "для коммита". При этом содержимое папки тоже попадет в список..
$ svn add src 

# Добавить паку "build" в список "для коммита". При этом не добавлять  содержимое папки.
$ svn add -N build

# Загружает в локальную копию изменения с SVN-сервера
$ svn update

# Коммит указанной директории (закоммитится только папка "docker", а остальное останется в текущем состоянии)
$ svn commit ./docker/ -m "Commit notes for our dockerfiles"


svn mkdir http:/svnserver/svn/some-project/ -m "mktir for new project"

# Сделать ветку на удаленном сервере.
$ svn copy svn://svnserver/var/bump/trunk svn://svnserver/var/bump/branches/my-branch -m="Creating a private branch of /bump/trunk"

# Перенести на удаленном сервере папку из одного места в другое 
# В данном случае переименование someProgect1 в someProgect2
$ svn move svn://svnserver/someProgect1 svn://svnserver/someProgect2


# Отобразить список файлов и каталогов в удаленном репозитарии
svn list svn://svnserver/var/bump/branches

# Переключить локальную копию на ветку.
# Эту же команду использовать, если проект переехал в другое место.
# Например, если выполнили "$ svn move ..."
svn switch svn://svnserver/var/bump/branches/my-branch

# Отмена локальных изменений в текущей папке и ниже.
svn revert -R ./

# Получить список измененныз файлов зная ревизию.
# Полезно когда в одной директории сервра много проектов и не знаем в каком проекте сделать изменения.
# По номеру ревизии получаем путь к проекту.
$ svn log -v -r 4112:4112 http://svnserver/many-projects-root/

#-------------------------------
# Работа со свойствами
#----
#  Получить список свойств для текущей папки "."
svn proplist
# Получить список игноров для текущей папки "." (значение свойства "svn:ignore").
svn propget svn:ignore .
# Для текущей папки "." установить игнорирование подпапки ".idea"
svn propset svn:ignore .idea .
# ???
svn propedit svn:ignore .
#  Удалить свойство игноров для текущей папки "."
svn propdel svn:ignore
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
