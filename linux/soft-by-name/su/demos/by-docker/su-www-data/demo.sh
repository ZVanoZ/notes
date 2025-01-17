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
#  ls -la

fi
set -e
echo "Теперь я работаю от root с id: '$(id)'"

#echo '# Меняем оболочку пользователю www-data'
#chsh -s /bin/sh www-data

echo '# Просмотр информации об учетной записи'
chage -l www-data

echo '# Разблокировка учетной записи'
chage -E -1 www-data

echo '# Прямая смена пользователя (не рекомендуется)'
su - www-data
echo "# Теперь я работаю от www-data с id: '$(id)'"

echo '# Дальнейшие команды будут выполняться от www-data'

echo '# Возврат к root (не всегда работает корректно)'
exit

echo "# Теперь я работаю от root с id: '$(id)'"

exit 0