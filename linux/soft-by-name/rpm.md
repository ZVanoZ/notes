
* Как узнать, с каким пакетом был установлен файл "libphp5.so" в CentOS 7

````shell
rpm -qf /opt/remi/php56/root/usr/lib64/httpd/modules/libphp5.so
````
````text
php56-php-5.6.40-41.el7.remi.x86_64
````