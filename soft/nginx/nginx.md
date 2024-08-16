# О чем речь


[nginx](https://ru.wikipedia.org/wiki/Nginx)  — веб-сервер и почтовый прокси-сервер, работающий на Unix-подобных операционных системах

Лицензия: 2-пунктная лицензия BSD.  

Часть функционала платная ([продукты](https://www.f5.com/products/nginx)).
Например, для модуля ngx_http_upstream_module динамически настраиваемая группа с периодическими проверками работоспособности доступна как часть коммерческой подписки [источник](http://nginx.org/ru/docs/http/ngx_http_upstream_module.html)

## Документация

* RU [Родная документация на русском языке](http://nginx.org/ru/)

## Модули nginx

* ngx_http_rewrite_module
RU [ngx_http_rewrite_module](http://nginx.org/ru/docs/http/ngx_http_rewrite_module.html)
````text
  Модуль ngx_http_rewrite_module позволяет изменять URI запроса с помощью 
регулярных выражений PCRE, делать перенаправления и выбирать конфигурацию по условию. 
````
* ngx_http_upstream_module
RU [ngx_http_upstream_module](http://nginx.org/ru/docs/http/ngx_http_upstream_module.html)
````text
  Модуль ngx_http_upstream_module позволяет описывать группы серверов, которые 
могут использоваться в директивах proxy_pass, fastcgi_pass, uwsgi_pass, 
scgi_pass, memcached_pass и grpc_pass.

Т.е. один раз объявляем сервер. Указываем конфигурации псевдоним.
Затем везде, где требуется, вместо указания сервера указываем псевдоним.
Если потребуется изменить IP|DNS сервера, то делаем это в одном месте, где объявляется upstream.
````
* aaa

