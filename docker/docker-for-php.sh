# Установка PHP composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Установка расширения Redis
## Способ 1. Из исходников github.
## Для получения исходников используем "git".
## Для сборки и установки используем встроенный скрипт "docker-php-ext-install".
#RUN git clone https://github.com/phpredis/phpredis.git  /usr/src/php/ext/redis\
#    && cd /usr/src/php/ext/redis \
#    && git checkout "5.3.4" \
#    && docker-php-ext-install redis

## Способ 2. Из исходников через pecl.
## Стягивание исходников и сорка через pecl, а интеграция в PHP ручками (создаем "redis.ini" командой).
RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini
