# "ping"

[ping-help.txt](ping-help.txt)

## Установка

```shell
apt update && apt install -y iputils-ping
```

## Системная информация

* Информация о команде 
````shell
type ping        &> ping-type.txt
ping --help      &> ping-help.txt
ping -V          &> ping-version.txt
man ping         &> ping-man.txt
````

* Информация об установке
````shell
#sudo dpkg -i ping     &> ping-dpkg-i.txt
#dpkg --status ping    &> ping-dpkg-status.txt
#apt info ping         &> ping-apt-info.txt
````

## Demos

```shell
ping -v -c 1 google.com
```
