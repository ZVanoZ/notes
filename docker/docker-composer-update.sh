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
