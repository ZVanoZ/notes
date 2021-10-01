#------------------------------------------------------------------------------
# Установка PHP composer в Dockerfile
#-----

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#------------------------------------------------------------------------------
# Установка расширения Redis в Dockerfile
#-----

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

#------------------------------------------------------------------------------
# Обновление библиотек "vendor" при помощи PHP composer, который установлен 
# в какой-то другой контейнер. 
#----

# Обновление библиотек "vendor" для PHP 5.3
docker run --rm -v $(pwd):/app  tomsowerby/php-5.3-composer -vvv install

# composer:2.0 (какая версия PHP внутри - не помню) 
docker run --rm --interactive --tty --volume $PWD:/app composer:2.0 composer install
docker run --rm --interactive --tty --volume $PWD:/app composer:2.0 composer update

#------------------------------------------------------------------------------
# Обновление библиотек "vendor" при помощи PHP composer, который установлен 
# внутрь контейнера.
#-----

# Перегенерировать autoload
# Выполняем, когда  в "composer.json" (autoload/psr-4):
# > 1. добавляем модуль;
# > 2. удаляем модуль

# Вариант 1. Раздельная команда
docker container exec laminas-mvc-skeleton composer -v dump-autoload
docker container exec laminas-mvc-skeleton chmod -vR 777 ./vendor/

# Вариант 2. Одной командой
docker container exec laminas-mvc-skeleton bash -c 'composer -vvv dump-autoload && chmod -vR 777 ./vendor/'
#------------------------------------------------------------------------------
