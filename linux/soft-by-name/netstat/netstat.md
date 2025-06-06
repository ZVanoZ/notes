# "netstat"

[netstat-help.txt](netstat-help.txt)

## Системная информация

* Информация о команде
````shell
type netstat        &> netstat-type.txt
netstat --help      &> netstat-help.txt
netstat --version   &> netstat-version.txt
man netstat         &> netstat-man.txt
````

* Информация об установке
````shell
#sudo dpkg -i netstat     &> netstat-dpkg-i.txt
#dpkg --status netstat    &> netstat-dpkg-status.txt
#apt info netstat         &> netstat-apt-info.txt
````


## Demos

* Показать таблицу маршрутизации
```bash
netstat --route
```
