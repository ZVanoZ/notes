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

# "phpunit" + "php 5.3"
docker run -v $(pwd):/app --workdir="/app" --rm tomsowerby/php-5.3:cli vendor/bin/phpunit --verbose

#------------------------------------------------------------------------------
# Запуск специализированного образа
# @TODO: разобраться как запускать "phpunit" в среде "docker"
#-----

#docker run -v $(pwd):/app --rm phpunit/phpunit:5.3.4 "tests/run.php"
#docker run -v $(pwd):/app --rm phpunit/phpunit:5.3.4 --verbose tests

#------------------------------------------------------------------------------
