# "ts"

[ts-help.txt](ts-help.txt)

## Системная информация

* Информация о команде

````shell
type ts        &> ts-type.txt
ts --help      &> ts-help.txt
ts --version   &> ts-version.txt
man ts         &> ts-man.txt
````

* Информация об установке

````shell
sudo dpkg -i ts     &> ts-dpkg-i.txt
dpkg --status ts    &> ts-dpkg-status.txt
apt info ts         &> ts-apt-info.txt
````

```shell
sudo apt install moreutils
```

# Примеры

```shell
cat /etc/hosts | ts %H:%M:%.S
```