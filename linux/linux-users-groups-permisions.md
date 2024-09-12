# О чем файл

О правах на файлы и папки.

Ответ на вопросы типа: Как просмотреть права? Как изменить права?  

## Шпаргалка

```text
          Владелец
           Группа
            Остальные
chmod -vR 700

________________________________________________
:   0   1   2   3      4     5     6     7     :
________________________________________________
:   -   x   w          r                       :
: --- --x  -w-  -wx    r--   r-x   rw-   rwx   :
:               2+1          3+1   4+2   4+2+1 :
________________________________________________

chmod -v 700        rwx------  
chmod -v 701        rwx-----x   
chmod -v 702        rwx----w-   
chmod -v 703        rwx----wx   
chmod -v 704        rwx---r--   
chmod -v 705        rwx---r-x   
chmod -v 706        rwx---rw-   
chmod -v 707        rwx---rwx   
```

## RAW

````shell
#-- Добавить пользователя "ivan" с домашней директорией "/home/ivan"
sudo useradd -d /home/ivan -m
# -- Либо добавить пользователя в виде консольного визарда
sudo adduser ivan
... диалоги...
````

````shell
# -- Сменить пароль пользователю "ivan"
sudo passwd ivan
# Enter new UNIX password: ***
# Retype nrew UNIX password: ***
# passwd: password updated successfully
````

````shell
---------------------------------
# -- Задача: Дать пользователю "ivan" возможность изменять файлы, принадлежащие пользователям группы "www-data".
# --
# -- Практический смысл в том, что процесс apache обслужывающий приложение "laminas/api-tools-skeleton" генерит 
# -- файлы от пользователя www-data. Рабочий пользователь "ivan" не может менять эти файлы.
# -- Сбрасывать права не вариант.
# -- Вероятно, правильным решением будет добавить пользователя "ivan" в группу "www-data"
# -----

# -- Вывести информацию, в какие группы входит пользователь "ivan"

id ivan

# uid=1000(ivan) gid=1000(ivan) groups=1000(ivan),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),112(lpadmin),127(sambashare),130(docker),131(kvm),128(vboxusers)


# -- Добавить пользователя в дополнительную группу "www-data"
sudo usermod -a -G www-data ivan 


# -- Проверяем, что получилось.
id ivan

# uid=1000(ivan) gid=1000(ivan) groups=1000(ivan),4(adm),24(cdrom),27(sudo),30(dip),33(www-data),46(plugdev),112(lpadmin),127(sambashare),130(docker),131(kvm),128(vboxusers)
# -- Видим, что добавилось "33(www-data)"

# -- Перероверяем.
groups
groups ivan
# ivan : ivan adm cdrom sudo dip www-data plugdev lpadmin sambashare docker kvm vboxusers
# -- Видим, что группа "www-data присутствует"
# -- А в каких группах пользователь "www-data"?
groups www-data
# www-data : www-data

# ---------------------------------
# Теперь проверяем появились ли права на запись в каталог, созданный пользователем "www-data"

## 1. Смотрим от какого пользователя сидим
who
# ivan     tty7         2020-09-02 09:09 (:0)
whoami
# ivan
users
# ivan

## 2. Переходим в каталог, созданный пользователем "www-data"
cd /var/www/5-edu/laminas/api-tools-skeleton-1/module/

ll
# total 24
# drwxrwxrwx  6 ivan     ivan     4096 сен  2 12:10 ./
# drwxrwxrwx 10 ivan     ivan     4096 сен  2 10:17 ../
# drwxrwxrwx  6 ivan     ivan     4096 авг 31 18:09 Application/
# drwxr-xr-x  5 www-data www-data 4096 сен  2 12:10 Log/
# drwxrwxrwx  5 www-data www-data 4096 сен  2 12:10 Logs/
# drwxrwxrwx  5 www-data www-data 4096 сен  2 11:35 Server/

cd Log
ll
# total 24
# drwxr-xr-x 5 www-data www-data 4096 сен  2 12:10 ./
# drwxrwxrwx 6 ivan     ivan     4096 сен  2 12:10 ../
# drwxr-xr-x 2 www-data www-data 4096 сен  2 12:10 config/
# -rw-r--r-- 1 www-data www-data  493 сен  2 12:10 Module.php
# drwxr-xr-x 3 www-data www-data 4096 сен  2 12:10 src/
# drwxr-xr-x 2 www-data www-data 4096 сен  2 12:10 view/

mkdir 1
# mkdir: cannot create directory ‘1’: Permission denied
# -- Видим, что прав на создание каталога нет

# -- Рекурсивно сменим владельца на "ivan", а группу на "www-data"
sudo chown -vR ivan:www-data /var/www/5-edu/laminas/api-tools-skeleton-1
# -- Либо сменим владельца всех файлов и каталогов на "www-data"
sudo chown -vR www-data /var/www/5-edu/laminas/api-tools-skeleton-1/

# -- Но єто все равно не поможет т.к. фалы генерируемые "api-tools-skeleton",
# -- имеют права "r-x" для пользователей группы "www-data", и 
# -- пользователь "ivan" все равно не сможет их править.
# -- ivan@ivan-desktop:/var/www/5-edu/laminas/api-tools-skeleton-1/module
ll |grep Log
# drwxr-xr-x  5 www-data www-data 4096 сен  2 15:45 Log/
# -- Таким образом у нас остаются вариантв:
# -- 1.  заставить "api-tools-skeleton" устанавливать "rwx" для группы "www-data"
# -- 2. запускать приложение в "docker" со сменой пользователя на "ivan".
# -- в этом варианте будут проблемы с исспользованием пользователем "ivan" 
# -- порта "80" на виртуальных интерфейсах. 
````