#!/bin/bash
#------------------------------------------------------------------------------
# Запускает php:*-apache с правами текущего пользователя
#-----

cd $(dirname $(realpath "${BASH_SOURCE[0]}"))

set -e

#entrypointScript="${PWD}/dockerfiles/docker-php-entrypoint-bash.sh"
entrypointScript="${PWD}/dockerfiles/docker-php-entrypoint-sh.sh"
chmod -v +x "${entrypointScript}"

# --mount type=bind,source="$(pwd)"/dockerfiles/docker-php-entrypoint,target=/usr/local/bin/docker-php-entrypoint,readonly \
#  -v "${PWD}/dockerfiles/docker-php-entrypoint:/usr/local/bin/docker-php-entrypoint"  \

docker run --rm -it         \
  --env UID="$(id -u)"      \
  --env GID="$(id -g)"      \
  -p 5081:80                \
  -v "${entrypointScript}:/usr/local/bin/docker-php-entrypoint"  \
  -v "${PWD}/www:/var/www"  \
  php:8.2-apache

#------------------------------------------------------------------------------
