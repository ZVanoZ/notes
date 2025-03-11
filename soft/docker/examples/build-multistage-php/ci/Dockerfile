# Первая стадия: установка зависимостей Composer
FROM composer:2.6 AS composer_install

# Установка переменных окружения (опционально)
ENV COMPOSER_ALLOW_SUPERUSER=1

# Установка рабочего каталога
WORKDIR /build-app

COPY ./ci  /build-app/ci
COPY ./www /build-app/www

RUN find /build-app
RUN bash /build-app/ci/job-build-php.sh
RUN find /build-app

# Вторая стадия: сборка основного образа
FROM php:8.1-apache

RUN env
# Копирование vendor и composer.lock из первой стадии
COPY --from=composer_install /build-app/www        /var/www
# Установка прав доступа (опционально)
RUN chown -R www-data:www-data /var/www/html
RUN find /var/www

RUN a2enmod rewrite

# Команда для запуска приложения (опционально)
#CMD ["apache2-foreground"]