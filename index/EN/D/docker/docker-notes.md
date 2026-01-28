
## Ссылки

````text
https://hub.docker.com
https://docs.docker.com/engine/reference/commandline

https://github.com/wsargent/docker-cheat-sheet/tree/master/ru


* https://dker.ru/docs/
Docker документация на русском
** https://dker.ru/docs/docker-compose/
*** https://dker.ru/docs/docker-compose/compose-file-reference/
Руководство по Docker Compose файлу

-- Шпаргалка с командами Docker
-- "infinite" - имя контейнера, на для которого даны примеры команд
https://habr.com/ru/company/flant/blog/336654/

@TODO:
* https://habr.com/ru/post/346634/
Лабораторная работа: введение в Docker с нуля. Ваш первый микросервис
* https://habr.com/ru/post/460173/
Разработка под Docker. Локальное окружение. Часть 2 — Nginx+PHP+MySql+phpMyAdmin
````

## Концепция 

````text
Docker это не виртуальная машина, а процесс в системе.
Для этого процесса симлинками собирается файловая система, а 
средствами ядра Linux корневой процесс получает виртуальный ID=0. 
Т.е. для дочерних процессов он будет 0, а для хост-системы другой.

-- Образ 
- аналогия - ISO-образ.
- аналогия - базовый диск VirtualBox (без снапшотов), с которого запускаемся
Обычно хранятся на dockerhub и тянутся для использования локально.

-- Контейнер 
- Аналогия - снапшоты VirtualBox + текущее состояние.
- Хранит данные, которые образовались после использования образа.

Например: хотим установить "mc" на базе образа "ubuntu"
$ docker run ubuntu:latest apt install mc
Тут происходит следующее:
1. С dockerhub скачается образ "ubuntu:latest" и разместится где-то в служебные квиалоги
2. На базе образа создается контейнер со случайным именем
3. Созданный контейнер запускается и скрипту по0умолчанию передаются параметры "apt install mc"
В данном образе ("ubuntu:latest") скрипт умеет перенаправлять вызов
4. После завершения команды выполнение образа завершается, но сам образ остается.
Это приводит к замусориванию системы.


Например: хотим получить терминал в рабочей среде любого образа, который переопределил
запуск bash на что-то свое.
$ docker run --rm -it --entrypoint /bin/bash tomsowerby/php-5.3-composer
$ docker run --rm -it php:5.3.29-cli /bin/bash
После запуска появится терминал (за это отвечают опции "-it"). 
Можем выполнять команды, которые будут работать в среде образа.
По завершению работы образ будет удален (опция "--rm") и мусора не останется.
````

## Жизненный цикл

```text
---- создает контейнер, но не запускает его.
$ docker create 
---- позволяет переименовать контейнер.
$ docker rename
---- создает и запускает контейнер за одну операцию.
$ docker run
---- удаляет контейнер.
$ docker rm 
---- обновляет ограничения ресурсов контейнера.
$ docker update

-- Запуск и остановка
----  запускает контейнер, чтобы он работал.
$ docker start
----  останавливает запущенный контейнер.
$ docker stop
---- останавливается и запускает контейнер.
$ docker restart 
----  приостанавливает работу контейнера, "замораживает" его на месте.
$ docker pause
----  снимает "заморозку" контейнера.
$ docker unpause
----  блокирует до остановки контейнера.
$ docker wait
----  посылает SIGKILL к запущеннному контейнеру.
$ docker kill
----  будет подключаться к работающему контейнеру.
$ docker attach


--  для выполнения команды в контейнере.
$ docker exec
$ docker exec -ti -u apache my-container-1 bash

-- Импорт / Экспорт
---- копирует файлы или папки между контейнером и локальной файловой системой.
$ docker cp 
---- экспортировать файловую систему контейнера в качестве tar-архива.
$ docker export

-- Логи контейнера
$ docker container logs --since 30s myContainerName

-- Показать список сетей
$ docker network ls
-- Удалить неимпользуемые сети
$ docker network prune
```

## Работа с логами 

* Просмотреть логи контейнера
````shell
# Смотрим все, что было отправлено в /dev/stderr
#PHP: file_put_contents('php://stderr', 'some text')
docker container logs local.webgate-app-t1 1>/dev/null

# Смотрим все, что было отправлено в  /dev/stdout
#PHP: file_put_contents('php://stdout', 'some text')
docker container logs local.webgate-app-t1 2>/dev/null
````
* Посмотреть какой тип драйвера используется в контейнере
````shell
docker inspect -f '{{.HostConfig.LogConfig.Type}}' local.webgate-app-t1
````


## Примеры

````text
-- Запустить команду "uname -a" в среде образа "ubuntu:latest"
--> Каждый запуск будет создавать новый контейнер, что приводит к замусориванию диска
--> Чтобы избежать замусоривания, нужно добавить --rm
$ docker run --rm ubuntu:latest uname -a
Unable to find image 'ubuntu:latest' locally
latest: Pulling from library/ubuntu
7ddbc47eeb70: Pull complete 
c1bbdc448b72: Pull complete 
8c3b70e39044: Pull complete 
45d437916d57: Pull complete 
Digest: sha256:6e9f67fa63b0323e9a1e587fd71c561ba48a034504fb804fd26fd8800039835d
Status: Downloaded newer image for ubuntu:latest

Linux c1359dc04594 4.15.0-70-generic #79-Ubuntu SMP Tue Nov 12 10:36:11 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

-- Запустить команду "ls" в среде образа "ubuntu:latest" и удалить контейнер после завершения
--> 1. При запуске будет создан контейнер.
--> 2. Затем внутри него выполнится "$ ls". Т.е. выведенный листинг покажет файлы внутри виртуалки.
--> 3. Затем будет удален контейнер, созданный на шаге "1."
$ docker run --rm ubuntu:latest ls
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var

-- Запустить команду "bash" в среде образа "ubuntu:latest" в интерактивном режиме
--> и удалить контейнер после завершения
--> В результате мы получаем терминал, который выполняется в виртуальной среде.
--> Таким образм мы можем исследовать внутренности, устанавливать и удалять программы, копировать и удалять файлы.
---> В данном примере внутри виртуалки выполнены команды:
---> 1. ls
---> 2. ll
---> 3. cat /etc/issue
---> 4. exit
$ docker run --rm -ti ubuntu:latest bash
root@7e2c18a4ac42:/# ls
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@7e2c18a4ac42:/# ll
total 72
drwxr-xr-x   1 root root 4096 Dec 13 15:35 ./
drwxr-xr-x   1 root root 4096 Dec 13 15:35 ../
-rwxr-xr-x   1 root root    0 Dec 13 15:35 .dockerenv*
drwxr-xr-x   2 root root 4096 Oct 29 21:25 bin/
drwxr-xr-x   2 root root 4096 Apr 24  2018 boot/
drwxr-xr-x   5 root root  360 Dec 13 15:35 dev/
drwxr-xr-x   1 root root 4096 Dec 13 15:35 etc/
drwxr-xr-x   2 root root 4096 Apr 24  2018 home/
drwxr-xr-x   8 root root 4096 May 23  2017 lib/
drwxr-xr-x   2 root root 4096 Oct 29 21:25 lib64/
drwxr-xr-x   2 root root 4096 Oct 29 21:25 media/
drwxr-xr-x   2 root root 4096 Oct 29 21:25 mnt/
drwxr-xr-x   2 root root 4096 Oct 29 21:25 opt/
dr-xr-xr-x 360 root root    0 Dec 13 15:35 proc/
drwx------   2 root root 4096 Oct 29 21:25 root/
drwxr-xr-x   1 root root 4096 Oct 31 22:20 run/
drwxr-xr-x   1 root root 4096 Oct 31 22:20 sbin/
drwxr-xr-x   2 root root 4096 Oct 29 21:25 srv/
dr-xr-xr-x  13 root root    0 Dec 13 15:35 sys/
drwxrwxrwt   2 root root 4096 Oct 29 21:25 tmp/
drwxr-xr-x   1 root root 4096 Oct 29 21:25 usr/
drwxr-xr-x   1 root root 4096 Oct 29 21:25 var/
root@7e2c18a4ac42:/# cat /etc/issue
Ubuntu 18.04.3 LTS \n \l
root@7e2c18a4ac42:/# exit
exit

-- Запустить команду "bash" в среде образа "ubuntu:latest" в интерактивном режиме,
--> прилинковать внутрь виртуалки папку (внутри "/app/mounted-dir", снаружи "/var/www/5-edu/docker/dirs-for-mount")
--> и удалить контейнер после завершения
-->
---> В данном примере внутри виртуалки выполнены команды:
---> 1. find app
----> Показывает ысе файлы, которые находятся внутри вмртуалки в папке "/app/"
---> 2. cat app/mounted-dir/readme.txt
----> Выводит содержимое файла. Внутри виртуалки         "app/mounted-dir/readme.txt" 
----> Снаружи этот файл находится в "/var/www/5-edu/docker/dirs-for-mount/readme.txt"
-- Вариант 1.
$ docker run --rm -ti -v /var/www/5-edu/docker/dirs-for-mount/:/app/mounted-dir ubuntu:latest bash
-- Вариант 2.
$ cd  /var/www/5-edu/docker/dirs-for-mount
$ docker run --rm -ti (pwd):/app/mounted-dir
--
root@a7aa1bd7665f:/# find app
app
app/mounted-dir
app/mounted-dir/readme.txt
root@a7aa1bd7665f:/# cat app/mounted-dir/readme.txt 
Это тестовая директория для монтирования каталогов внутрь образов.
Реально находится в "/var/www/5-edu/docker/dirs-for-mount/"
Внутри образа монтировать будем в "/app/.."
-- Дополнение.  Информация о контейнере.
--> 1. Пока висит bash, контейнер можно найти.
$ docker ps -a
CONTAINER ID        IMAGE                                COMMAND                  CREATED             STATUS                     PORTS                                      NAMES
a7aa1bd7665f        ubuntu:latest                        "bash"                   2 hours ago         Up 2 hours                                                            wonderful_dewdney
--> 2. Полная информация о контейнере.
$ docker inspect  a7aa1bd7665f
... много данных ...
--> 3. Смотрим какие папки примонтированы (частичная выборка информации).
$ docker inspect  --format '{{ .Mounts }}' a7aa1bd7665f
[{bind  /var/www/5-edu/docker/dirs-for-mount /app/mounted-dir   true rprivate}]

# Запустить "ex3to6.sh" в среде PHP 5.3
# \> при этом текущая папка линкуется внутрь контейнера в точку "/app"
$ docker run --rm  --mount type=bind,src=$(pwd),dst=/app tomsowerby/php-5.3:cli bash /app/tools/ex3to6.sh




-- Выводит список контейнеров с использованием форматирования
-- https://docs.docker.com/engine/reference/commandline/ps/#formatting
$ docker container list -a --format ' \
ID        = {{.ID}} \
Image     = {{.Image}} \
Command   = {{.Command}} \
CreatedAt = {{.CreatedAt}} \
RunningFor= {{.RunningFor}}} \
Ports     = {{.Ports}}} \
Status    = {{.Status}} \
Size      = {{.Size}} \
Names     = {{.Names}} \
Labels    = {{.Labels}} \
Labels    = {{.Labels}} \
Mounts    = {{.Mounts}} \
Networks  = {{.Networks}} \
'

-- Выводит список контейнеров, которые завершились с кодом 0 (корректный выход)
-- https://docs.docker.com/engine/reference/commandline/ps/#filtering
$ docker container list -a --filter 'exited=0'
-- Выводит список контейнеров, которые завершились с кодом 100 (не корректный выход)
$ docker container list -a --filter 'exited=100'
````
* Задача: удалить все контейнеры, завершенные аварийно.  
  Чаще всего это мусор, образовавшийся при упавшей сборке.  
````shell
# -- 1. Вывести список контейнеров, которые завершились с кодом не равным 0
# -- Используем grep для поиска по тексту (правильнее разобраться с фильтрами).
docker ps -a | grep "Exited ([^0]"

# -- 2. Вывести список ID контейнеров, которые завершились с кодом не равным 0
docker ps -a | grep "Exited ([^0]"|awk '{print $1}'

# -- 3. Удалить список контейнеров, которые завершились с кодом не равным 0
docker rm $(docker ps -a | grep "Exited ([^0]"|awk '{print $1}')
````
* Задача: удалить все временные образы.  
  Эти образы не имеют тега 
````shell
# -- 1. Вывести список образов без тега (в docker есть специфльный фильтр)
# -- https://docs.docker.com/engine/reference/commandline/images/#filtering
docker images --filter "dangling=true"

# -- 2. Удалить список образов без тега
docker rmi $(docker images -f "dangling=true" -q)

# -- Очистить кеш сборщика
# -- https://docs.docker.com/reference/cli/docker/builder/prune/
docker builder prune

# -- Очистить от неиспользуемых данных
# -- https://docs.docker.com/reference/cli/docker/system/prune/
docker system prune -a
````
* Задача: Обновить библиотеки PHP при поиощи composer в среде PHP 5.3  
````shell
# -- Текущая папка должна содержать "composer.json"
docker run --rm -v $(pwd):/app  tomsowerby/php-5.3-composer -vvv update
````
* Задача: после запуска контейнер падает и нужно разобраться почему  
  Решение: запускаем со сменой entrypoint на bash и смотрим что внутри.
````shell
# Зайдем тем пользователем, что указан в Dockerfile последним
docker run -it --rm -p 8080:80 --entrypoint bash  local.devrepo-test

# Зайдем пользователем apache
docker run -it --rm -p 8080:80 --user apache  --entrypoint bash  local.devrepo-test
````
* Задача: Собрать проект "my.project1.local" с указанием режима сборки
````shell

# Выносим название проекта в отдельную переменную (потом будем использовать для указания имени образа и контейнера).
appName=my.project1.local

# https://docs.docker.com/engine/reference/commandline/image_build/
# https://docs.docker.com/engine/reference/builder/#arg
# --tag       - появится локальный образ "my.project1.local:latest"
# --force-rm  - временные образы будут удалены, в том числе при ошибке сборки
# --build-arg - передаем в Dockerfile два аргумента.
#             - Обязательно в Dockerfile объявляем эти переменные
#             - Dockerfile:
#             - ARG APP_ENV
#             - ARG APP_IS_CLEAN
# --file      - Указываем путь к Dockerfile
# .           - Указываем контекст сбоки. Текущая директория будет корнем при сборке.
docker image build \
    --tag ${appName}:latest \
    --force-rm \
    --build-arg APP_ENV=LOCAL \
    --build-arg APP_IS_CLEAN=true \
    --file ./_docker/Dockerfile \
    .
# Проверяем собрался ли образ.
if [ ! "$?" == "0" ]
then
    echo "ERROR: can not build an image from a dockerfile."
    exit 1
fi   
````

* Понизить версию API для текущей консоли можно через переменную окружения "DOCKER_API_VERSION" 
```shell
docker version
export DOCKER_API_VERSION=1.43
```