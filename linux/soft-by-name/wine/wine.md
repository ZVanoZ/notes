#

* [How to Install Wine on Debian 12 Bookworm](https://wine.htmlvalidator.com/install-wine-on-debian-12.html)
* https://dl.winehq.org/wine/wine-mono/
* https://gitlab.winehq.org/wine/wine/-/wikis/Wine-Mono#versions

# CMD

* help
````shell
wine --help   &>wine-help.txt
````

* man
````shell
man wine &>wine-man.txt
````

```shell
wine --version
```

Запустить GUI для настройки виртуальной машины
Вероятно, это базовая конфигурация
```shell
wine winecfg
```
Запустить GUI для "Установка и удаление программ"
```shell
wine uninstaller
```

