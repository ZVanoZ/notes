#!/bin/sh

# link to:  /usr/local/bin/docker-php-entrypoint

set -e

echo "change UID for 'www-data' to '${UID}'"
usermod -u "${UID}" www-data

echo "change GID for 'www-data' to '${GID}'"
groupmod -g "${GID}" www-data

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
        set -- apache2-foreground "$@"
fi

exec "$@"
