#!/bin/bash
cd $(dirname $(realpath "${BASH_SOURCE[0]}"))

#docker run --rm -it                      \
#  -v "${PWD}/dockerfiles:/dockerfiles"   \
#  php:8.2-apache                         \
#  bash /dockerfiles/show-apache-env.sh

docker run --rm -it                      \
  -v "${PWD}/dockerfiles:/dockerfiles"   \
  php:8.2-apache                         \
  cp /etc/apache2/envvars /dockerfiles/apache2-envvars