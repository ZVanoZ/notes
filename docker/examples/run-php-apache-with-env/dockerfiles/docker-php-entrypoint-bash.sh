#!/bin/bash
# @WARNING: список команд не cmdList не будет работать, если указать в 1й строке #!/bin/sh

# link to:  /usr/local/bin/docker-php-entrypoint

set -e

cmdList=()
cmdList+=("usermod -u \"${UID}\" www-data")
cmdList+=("groupmod -g \"${GID}\" www-data")
for cmd in "${cmdList[@]}"
do
  echo ''
  echo "#RUN: ${cmd}"
  eval "${cmd}"
  res=$?
  echo "#RES: <${res}>"
  echo ''
done

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
        set -- apache2-foreground "$@"
fi

exec "$@"
