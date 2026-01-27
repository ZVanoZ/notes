# О чем это

php-config — это простой скрипт командной строки для получения информации о конфигурации установленного PHP.

## Help

[php.net](https://www.php.net/manual/ru/install.pecl.php-config.php)

```text
Опции скрипта Опция    Описание
---------------------------------------------------------------------------------------------------
--prefix               Директория, в которой установлен PHP, например, /usr/local
--includes             Список -I параметров со всеми подключаемыми файлами
--ldflags              LD, с которыми был скомпилирован PHP
--libs                 Внешние библиотеки, с которыми был скомпилирован PHP
--extension-dir        Директория, в которой по умолчанию ищутся модули
--include-dir          Префикс директории, в которую по умолчанию устанавливаются заголовочные файлы
--php-binary           Полный путь до исполняемых файлов php CLI или CGI
--php-sapis            Показывает все доступные модули SAPI
--configure-options    Конфигурационные опции для воссоздания настроек текущей установки PHP.
--version              Версия PHP
--vernum               Версия PHP в виде целого числа
```

```shell
php-config
```
```text
Usage: /usr/bin/php-config [OPTION]
Options:
  --prefix            [/usr]
  --includes          [-I/usr/include/php -I/usr/include/php/main -I/usr/include/php/TSRM -I/usr/include/php/Zend -I/usr/include/php/ext -I/usr/include/php/ext/date/lib]
  --ldflags           []
  --libs              [-lcrypt   -lresolv -lcrypt -ledit -lncurses -lstdc++ -lz -lpcre -lrt -lm -ldl -lnsl  -lxml2 -lz -lm -ldl -lgssapi_krb5 -lkrb5 -lk5crypto -lcom_err -lssl -lcrypto -lcrypt -lcrypt ]
  --extension-dir     [/usr/lib64/php/modules]
  --include-dir       [/usr/include/php]
  --man-dir           [/usr/share/man]
  --php-binary        [/usr/bin/php]
  --php-sapis         [apache2handler embed fpm  cli phpdbg cgi]
  --configure-options [--build=x86_64-redhat-linux-gnu --host=x86_64-redhat-linux-gnu --program-prefix= --disable-dependency-tracking --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc --datadir=/usr/share --includedir=/usr/include --libdir=/usr/lib64 --libexecdir=/usr/libexec --localstatedir=/var --sharedstatedir=/var/lib --mandir=/usr/share/man --infodir=/usr/share/info --cache-file=../config.cache --with-libdir=lib64 --with-config-file-path=/etc --with-config-file-scan-dir=/etc/php.d --disable-debug --with-pic --disable-rpath --without-pear --with-exec-dir=/usr/bin --with-freetype-dir=/usr --with-png-dir=/usr --with-xpm-dir=/usr --enable-gd-native-ttf --with-t1lib=/usr --without-gdbm --with-jpeg-dir=/usr --with-openssl --with-system-ciphers --with-pcre-regex=/usr --with-zlib --with-layout=GNU --with-kerberos --with-libxml-dir=/usr --with-system-tzdata --with-mhash --enable-dtrace --libdir=/usr/lib64/php --enable-pcntl --enable-opcache --enable-phpdbg --with-imap=shared --with-imap-ssl --enable-mbstring=shared --enable-mbregex --with-gd=shared,/usr --with-gmp=shared --enable-calendar=shared --enable-bcmath=shared --with-bz2=shared --enable-ctype=shared --enable-dba=shared --with-db4=/usr --with-gdbm=/usr --with-tcadb=/usr --enable-exif=shared --enable-ftp=shared --with-gettext=shared --with-iconv=shared --enable-sockets=shared --enable-tokenizer=shared --with-xmlrpc=shared --with-ldap=shared --with-ldap-sasl --enable-mysqlnd=shared --with-mysql=shared,mysqlnd --with-mysqli=shared,mysqlnd --with-mysql-sock=/var/lib/mysql/mysql.sock --with-oci8=shared,instantclient,/usr/lib/oracle/21/client64/lib,21.13 --with-pdo-oci=shared,instantclient,/usr,21.13 --with-interbase=shared,/usr/lib64/firebird --with-pdo-firebird=shared,/usr/lib64/firebird --enable-dom=shared --with-pgsql=shared --enable-simplexml=shared --enable-xml=shared --enable-wddx=shared --with-snmp=shared,/usr --enable-soap=shared --with-xsl=shared,/usr --enable-xmlreader=shared --enable-xmlwriter=shared --with-curl=shared,/usr --enable-pdo=shared --with-pdo-odbc=shared,unixODBC,/usr --with-pdo-mysql=shared,mysqlnd --with-pdo-pgsql=shared,/usr --with-pdo-sqlite=shared,/usr --with-pdo-dblib=shared,/usr --with-sqlite3=shared,/usr --without-readline --with-libedit --with-pspell=shared --enable-phar=shared --with-mcrypt=shared,/usr --with-tidy=shared,/usr --with-mssql=shared,/usr --with-sybase-ct=shared,/usr --enable-sysvmsg=shared --enable-sysvshm=shared --enable-sysvsem=shared --enable-shmop=shared --enable-posix=shared --with-unixODBC=shared,/usr --enable-fileinfo=shared --enable-intl=shared --with-icu-dir=/usr --with-enchant=shared,/usr --with-recode=shared,/usr build_alias=x86_64-redhat-linux-gnu host_alias=x86_64-redhat-linux-gnu CFLAGS=-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -m64 -mtune=generic -fno-strict-aliasing -Wno-pointer-sign LDFLAGS=-Wl,-z,relro -specs=/usr/lib/rpm/redhat/redhat-hardened-ld CXXFLAGS=-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -m64 -mtune=generic]
  --version           [5.6.40]
  --vernum            [50640]
```


## Команды

```shell
type php-config
```
```text
php-config is /usr/bin/php-config
```

```shell
php-config --libs
```
```text
-lcrypt -lresolv -lcrypt -ledit -lncurses -lstdc++ -lz -lpcre -lrt -lm -ldl -lnsl -lxml2 -lz -lm -ldl -lgssapi_krb5 -lkrb5 -lk5crypto -lcom_err -lssl -lcrypto -lcrypt -lcrypt

```

