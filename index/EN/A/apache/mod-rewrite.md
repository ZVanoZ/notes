# [mod-rewrite.md](mod-rewrite.md)


## Подмена пути загружаемого файла

Физическая структура файлов на диске 
```
public/vendor/iit/EUSignAgent/1.3.89/*.js
public/vendor/iit/EUSignAgent/1.3.100/*.js
public/vendor/iit/EUSignAgent/.htaccess
```

При запросе "/vendor/iit/EUSignAgent/eusw.js" нужно возвращать "/vendor/iit/EUSignAgent/1.3.100/eusw.js"
```.htaccess
RewriteEngine On

# 1. Проверяем, что запрашивают именно eusw.js
# 2. Перенаправляем на подпапку 1.3.100 относительно текущего .htaccess
# 3. Флаг [L] останавливает обработку, [QSA] сохраняет query string (динамическую версию)

RewriteRule ^eusw\.js$ 1.3.100/eusw.js [L,QSA]
RewriteRule ^euswll\.js$ 1.3.100/euswll.js
```
