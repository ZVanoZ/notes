
## Установка PHP composer в Dockerfile

```dockerfile
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
```

<hr>

## Установка расширения Redis в Dockerfile

```dockerfile
# Способ 1. Из исходников github.
# Хорош тем, что можно ставить любые расширения, для которых есть исходники
## Для получения исходников используем "git".
## Для сборки и установки используем встроенный скрипт "docker-php-ext-install".
RUN git clone https://github.com/phpredis/phpredis.git  /usr/src/php/ext/redis\
    && cd /usr/src/php/ext/redis \
    && git checkout "5.3.4" \
    && docker-php-ext-install redis

# Способ 2. Из исходников через pecl.
# Хорош тем, что почти все что может понадобиться уже есть в PECL.
# И это "все" уже многократно проверено сообществом.
## Стягивание исходников и сорка через pecl, а интеграция в PHP ручками (создаем "redis.ini" командой).
RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini
    
```

<hr>

## Установка расширения xdebug в Dockerfile (решаем проблему со старой версией PHP)

```dockerfile
FROM php:5.6-apache

WORKDIR /var/www/
COPY src/ .

# Устанавливаем из исходников с github.
# В секции <git checkout "2.3.3"> выбираем ту версию, которая нам нужна.
# Выбираем тут: https://github.com/xdebug/xdebug/releases?after=XDEBUG_2_4_0
# "2.3.3" - on 19 Jun 2015    - PHP 5.6
RUN git clone https://github.com/xdebug/xdebug.git  /usr/src/php/ext/xdebug\
    && cd /usr/src/php/ext/xdebug \
    && git checkout "2.3.3" \
    && docker-php-ext-install xdebug
    
# Создаем ссылку на "xdebug.ini"
RUN cp  ./configs/xdebug.ini.sample ./configs/xdebug.ini \
    && ln -sfv `pwd`/configs/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
```
<hr>

## Обновление библиотек "vendor" при помощи PHP composer, который установлен в какой-то другой контейнер. 

```shell
# Обновление библиотек "vendor" для PHP 5.3
docker run --rm -v $(pwd):/app  tomsowerby/php-5.3-composer -vvv install
# Добавить в composer.json зависимость от библиотеки "some-company/their-library"
docker run --rm -v $(pwd):/app  tomsowerby/php-5.3-composer require some-company/their-library


# composer:2.0 (какая версия PHP внутри - не помню) 
docker run --rm --interactive --tty --volume $PWD:/app composer:2.0 composer install
docker run --rm --interactive --tty --volume $PWD:/app composer:2.0 composer update
```

<hr>
## На базе чужого образа с PHP 5.3 + php-composer создаем свой, но с subversion. 
Затем обновляем библиотеки используя php-composer + subversion 

```dockerfile
# Файл: "Dockerfile"
FROM  tomsowerby/php-5.3-composer

#COPY ./sources.list /etc/apt/sources.list

RUN apt-get update -y --force-yes

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes \
    ca-certificates \
    curl \
    git \
    subversion \
    make \
    php-pear

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes \
    php5-dev
```
Собираем образ
```bash
#!/usr/bin/env bash
#------------------------------------------------------------------------------
cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" || exit
#------------------------------------------------------------------------------
dockerhubImgName='local/php-53-composer-svn:latest'

docker image rm -f ${dockerhubImgName}

docker build --tag ${dockerhubImgName} ./
if [ ! "$?" == "0" ]; then
    echo "-- Error build image ${dockerhubImgName}"
    exit 1
fi
#docker push ${dockerhubImgName}
#if [ ! "$?" == "0" ]; then
#    echo "-- Error push image ${dockerhubImgName}"
#    exit 1
#fi
#------------------------------------------------------------------------------
```
Идем в каталог с проектом и добавляем svn-репозитарий, как репозитарий php-composer
```js
// Файл "composer.json"
// 1. Прописываем ссылку на репозитарий "http://svn.my.company.com/svn/libraries/my-library/"
// 2. Прописываем требование к загружаемой библиотеке "my-company/my-library": "~1.0"
//    Библиотека будет искаться в "http://svn.my.company.com/svn/libraries/my-library/tags/1.0.1" "1.0.2" и т.д.
{
  "name": "mu-company/my-project",
  "description": "Description",
  "minimum-stability": "dev",
  "config": {
    "secure-http": false
  },
  "repositories": [
    {
      "type": "vcs",
      "url": "http://svn.my.company.com/svn/libraries/my-library/",
      "trunk-path": "trunk",
      "branches-path": "branches",
      "tags-path": "tags"
    }
  ],
  "require": {
    "my-company/my-library": "~1.0"
  }
}
```
Запускаем наш образ докера, чтобы он обновил библиотеки в "vendors"
```bash
# В текущей директории должен лежать "composer.json" из предыдущего шага
# "--rm" - удадить временный контейнер после выполнения команды
# "-it"  - интерактивный режим + терминал - позволит ввести логин и пароль SVN
# "$(pwd):/app" - монтируем папку с "composer.json" внутрь контейнера в точку "/app"
# "~/.subversion:/root/.subversion" - монтируем папку ".subversion" из домашней директории 
#          текущего пользователя в домашнюю директорию пользователя "root" запускаемого 
#          образа. Нужно, если хотим использовать кеш авторизации SVN с хостмашины.  
#         
docker run --rm -it -v $(pwd):/app -v ~/.subversion:/root/.subversion local/php-53-composer-svn update
```

<hr>

## Обновление библиотек "vendor" при помощи PHP composer, который установлен внутрь контейнера.

1. Перегенерировать autoload
2. Выполняем, когда  в "composer.json" (autoload/psr-4):
2.1 добавляем модуль;
2.2 удаляем модуль

```bash
# Вариант 1. Раздельная команда
docker container exec laminas-mvc-skeleton composer -v dump-autoload
docker container exec laminas-mvc-skeleton chmod -vR 777 ./vendor/

# Вариант 2. Одной командой
docker container exec laminas-mvc-skeleton bash -c 'composer -vvv dump-autoload && chmod -vR 777 ./vendor/'
```

<hr>
