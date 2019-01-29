# Извлекает проект "someProgect" с сервера в текущую папку 
# В текущей папке появится подкаталог "someProgect", который будет связан с удаленнын репозитарием
$svn checkout svn://svnserver/someProgect

# Показывает информацию о локальной копии
$ svn info

# Показывает изменения в локальной копии
$ svn status

# Загружает в локальную копию изменения с SVN-сервера
$ svn update

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
