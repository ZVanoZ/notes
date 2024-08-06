

* /etc/php.ini
DEV & PROD
````ini
date.timezone=Europe/Kiev
````
DEV
```ini
zend.exception_string_param_max_len=0
```
PROD
```ini
log_errors_max_len=1024
;zend.exception_string_param_max_len=0
;mail.mixed_lf_and_crlf=Off
mysqli.reconnect=Off
```
* /etc/php-fpm.d/www.conf
DEV
````apacheconf
clear_env = no
````