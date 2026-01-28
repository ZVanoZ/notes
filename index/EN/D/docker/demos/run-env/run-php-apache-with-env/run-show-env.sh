#!/bin/bash
cd $(dirname $(realpath "${BASH_SOURCE[0]}"))

docker run --rm -it php:8.2-apache env | grep APACHE

# Передаем переменные окружения через --env-file и --env
# --env имеет больший приоритет и  переопределяет значения --env-file
docker run --rm -it                      \
  --env-file ".env"                      \
  --env ARG_USER_ID="$(id -u)"           \
  --env ARG_GROUP_ID="$(id -g)"          \
  --env CONFLICT_KEY="conflict-key from --env" \
  -v "${PWD}/dockerfiles:/dockerfiles"   \
  php:8.2-apache                         \
  bash /dockerfiles/show-env.sh -a -b

# Переопределяем entrypoint
#docker run --rm -it                        \
#  --entrypoint "bash"                      \
#  --env-file ".env"                        \
#  -v "${PWD}/dockerfiles:/dockerfiles"     \
#  php:8.2-apache                           \
#  /dockerfiles/show-env.sh -a -b -c


