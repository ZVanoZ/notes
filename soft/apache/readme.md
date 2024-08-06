* '/etc/php-fpm.d/www.conf'
````apacheconf
# Проверяем чтобы грузились дополнительные конфиги 
IncludeOptional conf.d/*.conf
````
* Копируем дополнительные конфиги
````shell
cp cp -fv   ./etc/httpd/conf.d/*        /etc/httpd/conf.d/
````

