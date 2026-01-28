# Устанавливаем php-composer нужной версии с проверкой контрольной суммы
#
# 1. Идем на сайт php-composer и выбираем нужную версию
# https://getcomposer.org/download/
# 2. Копипастим выбранную версию в COMPOSER_VERSION.
#    Например "2.7.7".
# 3. Находим контрольную сумму в колонке "sha256sum" и копипастим в COMPOSER_SHA256
#    Для версии "2.7.7" контрольная сумма будет "aab940cd53d285a54c50465820a2080fcb7182a4ba1e5f795abfb10414a4b4be"
#
FROM php:8.3.0-apache

ENV COMPOSER_VERSION="2.7.7"
ENV COMPOSER_SHA256="aab940cd53d285a54c50465820a2080fcb7182a4ba1e5f795abfb10414a4b4be"

ADD --checksum=sha256:${COMPOSER_SHA256} \
    https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar \
    /usr/bin/composer

RUN chmod +x /usr/bin/composer       ;\
    chmod 755 /usr/bin/composer
