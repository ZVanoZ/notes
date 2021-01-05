#!/usr/bin/env bash
#------------------------------------------------------------------------------

cd $(dirname $(readlink -e $0)) #переход в директорию текущего скрипта
cd ..  # На папку выше, чтобы "phpunit.xml" был в текущем каталоге

# Предпролагается структура папок и файлов
# ./myApp/
# ./myApp/vendor/...
# ./myApp/tests/...
# ./myApp/composer.json
# ./myApp/phpunit.xml

#------------------------------------------------------------------------------
# Запуск при помощи сборок, которые содержат php-cli
#-----

# -- Работает
# REPOSITORY                                          TAG                  IMAGE ID            CREATED             SIZE
# tomsowerby/php-5.3                                  cli                  892f891e5196        5 years ago         440MB
#
# PHPUnit 4.8.36 by Sebastian Bergmann and contributors.
# Runtime:	PHP 5.3.29
docker run -v $(pwd):/app --workdir="/app" --rm tomsowerby/php-5.3:cli vendor/bin/phpunit --verbose

# -- Работает
# REPOSITORY                                          TAG                  IMAGE ID            CREATED             SIZE
# php                                                 5.3-cli              7f2a82c91480        6 years ago         729MB
#
# PHPUnit 4.8.36 by Sebastian Bergmann and contributors.
# Runtime:	PHP 5.3.29
# Configuration:	/app/phpunit.xml
docker run -v $(pwd):/app --workdir="/app" --rm php:5.3-cli vendor/bin/phpunit --verbose

#  -- Работает
# REPOSITORY                                          TAG                  IMAGE ID            CREATED             SIZE
# seti/php53                                          latest               70b21ba63d9c        7 months ago        298MB
#
# PHPUnit 4.8.36 by Sebastian Bergmann and contributors.
# Runtime:	PHP 5.3.29-Ubuntu/14.04-SergeyD/14.4
# Configuration:	/app/phpunit.xml
docker run -v $(pwd):/app --workdir="/app" --rm seti/php53 /app/vendor/bin/phpunit --verbose
#------------------------------------------------------------------------------
# Запуск специализированного образа
# @TODO: разобраться как запускать "phpunit" в среде "docker"
#-----

#docker run -v $(pwd):/app --rm phpunit/phpunit:5.3.4 "tests/run.php"
#docker run -v $(pwd):/app --rm phpunit/phpunit:5.3.4 --verbose tests

#------------------------------------------------------------------------------
