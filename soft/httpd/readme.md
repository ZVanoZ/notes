* /etc/httpd/conf/httpd.conf  
DEV 
````apacheconf
<Directory "/var/www/html">
    Options +Indexes +FollowSymLinks
    AllowOverride All    
    Require all granted
</Directory>    

# Для DEV мы используем .../conf.d/dev.conf
IncludeOptional conf.d/*.conf
````
PROD
````apacheconf
<Directory "/var/www/html">
    Options Indexes FollowSymLinks
    AllowOverride None
    Require all granted
</Directory>
````
* etc/httpd/conf.d/php.conf  
@TODO: разобраться в каком режиме используется этот конфиг
* /etc/httpd/conf.d/httpd_log.conf  
В Docker перенаправляем вывод логов в stdout и stderr
* /etc/httpd/run/
* /etc/php.ini
* /etc/php-fpm.d/www.conf
* /etc/httpd/conf.d/*.conf  
@see [www.conf](..%2Fphp%2Fetc%2Fphp-fpm.d%2Fwww.conf)
* /var/log/httpd/
* /var/lib/httpd/
* /var/www/
* /var/www/html/



