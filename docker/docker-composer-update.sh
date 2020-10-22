#!/usr/bin/env bash
cd $(dirname $(readlink -e $0)) #переход в директорию текущего скрипта
#------------------------------------------------------------------------------
#docker run --rm -v $(pwd):/app  tomsowerby/php-5.3-composer -vvv install

#docker run --rm --interactive --tty \
# --volume $PWD:/app \
# composer:2.0 \
# composer install

docker run --rm --interactive --tty \
--volume $PWD:/app \
composer:2.0 \
composer update
#------------------------------------------------------------------------------
# Если composer установлен внутрь контейнера, то можно так
#-----
# Перегенерировать autoload
# Выполняем, когда  в "composer.json" (autoload/psr-4):
# > 1. добавляем модуль;
# > 2. удаляем модуль

# Вариант 1. Раздельная команда
# docker container exec laminas-mvc-skeleton composer -v dump-autoload
# docker container exec laminas-mvc-skeleton chmod -vR 777 ./vendor/

# Вариант 2. Одной командой
docker container exec laminas-mvc-skeleton bash -c 'composer -vvv dump-autoload && chmod -vR 777 ./vendor/'
#------------------------------------------------------------------------------
