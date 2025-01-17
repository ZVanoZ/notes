#!/bin/bash

if [ 'T' != "${IS_DOCKER}" ]; then
  echo "-- docker run ..."
  chmod -v 777 su-www-data.sh
  docker run --rm -it \
    --env IS_DOCKER='T' \
    --volume "$PWD":/volume \
    --workdir "/volume" \
    php:8.1-apache \
    /volume/demo.sh
  res="$?"
  echo "-- docker run res: '${res}'"
  exit ${res}
else
  echo "-- in docker context ..."
  echo "-- IS_DOCKER: '${IS_DOCKER}'"
  pwd
fi

set -e

grep root /etc/passwd
grep www-data /etc/passwd

echo "-- id: '$(id)'"

echo "# chage -l root"
chage -l root

echo '# chage -l www-data'
chage -l www-data

# Разблокировка учетной записи
echo '# chage -E -1 www-data'
chage -E -1 www-data
grep www-data /etc/passwd

#usermod -s /bin/bash www-data
#grep www-data /etc/passwd

echo '# su - www-data'
su - www-data

exit 0