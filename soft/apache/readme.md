* '/etc/php-fpm.d/www.conf'
````apacheconf
# Проверяем чтобы грузились дополнительные конфиги 
IncludeOptional conf.d/*.conf
````
* Копируем дополнительные конфиги
````shell
cp cp -fv   ./etc/httpd/conf.d/*        /etc/httpd/conf.d/
````

* Список модулей, которые были загружены в Apache. 
```bash
apachectl -M
```
```bash
apachectl -M | grep rewrite
```
```text
AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.18.0.2. Set the 'ServerName' directive globally to suppress this message
 rewrite_module (shared)
```