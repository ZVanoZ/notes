<h1>Сценарии решения различных проблем в Linux</h1>

<hr/>

# Узнать какой дистрибутив установлен

## Раз

```BASH
uname -a
```
```TEXT
Linux 00821c2bcae8 4.19.0-18-amd64 #1 SMP Debian 4.19.208-1 (2021-09-29) x86_64 GNU/Linux
```

## Два

```BASH
cat /etc/os-release
```
Получим что-то типа
```TEXT
RETTY_NAME="Debian GNU/Linux jessie/sid"        № Вот это нас и интересует. Гуглим "debian jessy"
NAME="Debian GNU/Linux"
ID=debian
ANSI_COLOR="1;31"
HOME_URL="http://www.debian.org/"
SUPPORT_URL="http://www.debian.org/support/"
BUG_REPORT_URL="https://bugs.debian.org/"
```

## Три (для Debian, текущая версия)
```bash
$ cat /etc/debian_version
10.12
```

<hr/>

# В терминале переключиться на рута 

```BASH
sudo su -
exit
```	

<hr/>

# Добавить поддержку локали

Debian 10, PhpStorm 2019.2, svn 1.10.4 (r1850624)
При обновлении проекта из PhpStorm получаю ошибку:
09:15	Can't use Subversion command line client: svn
			svn: warning: cannot set LC_CTYPE locale
			svn: warning: environment variable LC_ALL is en_US.UTF-8
			svn: warning: please check that your locale name is correct
      
Решение:
Раскомментировать локаль "en_US.UTF-8 UTF-8" в "/etc/locale.gen"

Выполняем
```bash
sudo mcedit /etc/locale.gen 
```
Находим строчки и раскомментируем
```TEXT
en_US.UTF-8 UTF-8
ru_UA.UTF-8 UTF-8
```
Запускаем
```BASH
sudo locale-gen
```
Видим
```TEXT
Generating locales (this might take a while)...
  en_US.UTF-8... done
  ru_UA.UTF-8... done
```

<hr/>

# Вывести список установленных пакетов, которые не являются родными для Debian
```
# Эти пакеты рекомендуется удалить перед большим обновлением системы (например, Debian 10 на 11)
# $ sudo apt install aptitude 
$ aptitude search '?narrow(?installed, ?not(?origin(Debian)))'
...
i   atom                        - A hackable text editor for the 21st Century.                                                                                             
i   containerd.io               - An open and reliable container runtime                                                                                                   
i   docker-ce                   - Docker: the open-source application container engine                                                                                     
i   docker-ce-cli               - Docker CLI: the open-source application container engine                                                                                 
i A docker-ce-rootless-extras   - Rootless support for Docker.                                                                                                             
i A docker-scan-plugin          - Docker scan cli plugin.                                                                                                                  
i   eusw                        - IIT End User CA-1. Sign (web)                                                                                                            
i   jdk-17                      - Java Platform Standard Edition Development Kit                         
```

<hr/>

# Рекуррсивный поиск и удаление каталогов ".svn"

```bash
# Применяется, когда нужно сравнить копию проекта из системы со старым SVN (< 1.6.7)
# Т.к. в старом SVN служебная папка ".svn" была в каждой папке проекта, что мешает сравнению. 
rm -rf `find . -type d -name .svn`
```

# Посчитать MD5 для всех файлов текущей папки.

```bash
# Посчитать MD5 для всех файлов текущей папки.
find -type f -print0 | xargs -0 md5sum > folder.md5

# Проверка контрольных сумм для файлов из списка.
## Вывести информацию о всех проверенных файлах
md5sum -c folder.md5 
## Вывести информацию о файлах, для которых md5 не совпал 
md5sum --quiet -c folder.md5
```

<hr/>

Как в linux найти все файлы с расширением "php", которые содержат текст ->extjs3CommunityPagingToolbar?

```shell
find . -name "*.php" -type f -exec grep -H '\->extjs3CommunityPagingToolbar' {} \;
```

Разберем эту команду по частям:  
* find .         
: Начинает поиск в текущем каталоге (.).  
* -name "*.php"    
: Ограничивает поиск файлами с расширением .php.
* -type f          
: Ищем только в файлах (игнорируем директории). При этом рекуривный поиск фалов в директории не прервется.
* -exec grep -H "extjs3CommunityPagingToolbar" {} ;:  
  * -exec            
  : Выполняет команду для каждого найденного файла.  
  * grep -H "extjs3CommunityPagingToolbar" {}        
  : Ищет строку "extjs3CommunityPagingToolbar" в каждом файле. Опция -H выводит имя файла перед каждой найденной строкой.  
  * ;               
  : Завершает -exec блок.  


<hr/>

# Рекурсивный поиск фрагмента текста по шаблону и вывод уникальных вхождений с указанием количества совпадений

```bash
egrep -rn --include="*.php" -oh "Type::[A-Z_]+" | sed 's/^[0-9]*://' | sort | uniq -c
# Результат
#      1 Type::BLOB
#     10 Type::BOOLEAN
#      2 Type::CLOB
```

# Обработать "php.log" таким образом, чтобы получить статистику по уникальным строкам

```bash
egrep "\[[0-9]{2}-[a-zA-Z]{3}-[0-9]{4}" php.log | cut -c 32- | sort | uniq -c | sort -r -nk 1 > php-log-stat.txt
# Результат
#      3 Notice:  Undefined offset: 220067 in index.php 489
#      1 Notice:  Undefined index: SOME_KEY in index.php on line 537
```

# Поиск и замена текста

```bash
# Заменить все строки вида "* @version ..." на "* @version DELETED"
find ./ -name *.ph* -print0 | xargs -0 sed -i "s/^\s*\*\s*@version.*$/ * @version DELETED/g"
```

# Скрипт для рекурсивного поиска и очистки содержимого всех PHP-файлов

Применяется для подготовки фейковых пакетов древних библиотек.
Дело в том, что в них встречаются requre_once для загрузки зависимостей.
Если подгрузить либу при помощи PHP-Composer, то такие вызовы ломают проект.
Поэтому берем либу, очищаем PHP-файлы и добавляем путь к очищенной либе в пкти поиска.
Вуаля. PHP-Composer работает, ошибок нет.
````bash
#!/usr/bin/env bash
#------------------------------------------------------------------------------
#переход в директорию текущего скрипта
cd $(dirname $(readlink -e $0))

# Находим все PHP-файлы и помещаем в массив files
files=(`find . -type f -iname '*.php'`)
# echo "${files[*]}"

# Пербираем элементы в массиве files и запихиваем внутрь соответствующего скрипта пустой тег
for file in ${files[*]}; do \
  echo "-- ${file}"
  echo '<?php ' > ${file}
done
````


---

# Нужно отформатировать большой JSON

```bash
# При помощи python  
python3 -m json.tool my-data.json > my-data-formatted.json
```