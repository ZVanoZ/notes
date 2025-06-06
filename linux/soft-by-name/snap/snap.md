<h1>apt</h1>

https://ravesli.com/difference-between-apt-and-apt-get-in-linux/

## CMD 

* help
````shell
snap --help &>snap-help.txt
````

* man
````shell
man snap &>snap-man.txt
````

* man
````shell
snap version &>snap-version.txt
````

* service "snapd" 
```shell
sudo service snapd status
```
```shell
sudo service snapd restart
```

* Обновить приложения
```shell
sudo snap refresh
```

* Удалить приложение
```shell
snap remove viber-unofficial
```

* Запуск "telegram-desktop" с выводом отладочной информации
```shell
SNAPD_DEBUG=1 snap run telegram-desktop
```

