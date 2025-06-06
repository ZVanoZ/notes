<h1>apt</h1>

https://ravesli.com/difference-between-apt-and-apt-get-in-linux/

## CMD 


````shell
apt --help &>apt-help.txt
````


````shell
apt --version &>apt-version.txt
````

````shell
man apt &>apt-man.txt
````

## Обновление и установка ПО 


* Обновление установленных пакетов
```shell
sudo apt upgrade
```

* Обновление до новой версии дистрибутива (dist-upgrade)
```shell
sudo apt dist-upgrade
```


## apt cache

```bash
ls -la /var/cache/apt/archives/ 
sudo apt clean
```

```shell
apt-cache depends mc
```

## apt policy
  
```bash
# Вывод информации об используемых репозиториях, а также их приоритете.
apt policy &>apt-policy.txt
```

# Вывод информации о версии установленного пакета и доступной для обновления версии пакета.

```shell
apt policy docker &>apt-policy/apt-policy-docker.txt
````

```shell
apt policy wine &>apt-policy/apt-policy-wine.txt
````

```shell
apt policy playonlinux &>apt-policy/apt-policy-playonlinux.txt
````


## apt list

Вывести список установленных пакетов
```bash
apt list --installed
```
```bash
apt list --installed |grep eusw
# WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
# eusw/now 1.3.1.56 amd64 [установлен, локальный]
```

## apt remove

```bash
# Удалить пакет "eusw"
sudo apt remove eusw 
# Чтение списков пакетов… Готово
# Построение дерева зависимостей… Готово
# Чтение информации о состоянии… Готово         
# Следующие пакеты будут УДАЛЕНЫ:
#   eusw
# Обновлено 0 пакетов, установлено 0 новых пакетов, для удаления отмечено 1 пакетов, и 0 пакетов не обновлено.
# После данной операции объём занятого дискового пространства уменьшится на 5 777 kB.
# Хотите продолжить? [Y/n] y
# (Чтение базы данных … на данный момент установлено 602144 файла и каталога.)
# Удаляется eusw (1.3.1.56) …

```

## apt show

```bash
# Вывести информацию о пакете "eusw" 
apt show eusw
# Package: eusw
# Version: 1.3.1.56
# Status: install ok installed
# Priority: optional
# Section: web
# Source: eusw
# Maintainer: JSC IIT <iit@iit.kharkov.ua>
# Installed-Size: 5 777 kB
# Provides: eusw
# Depends: libc6
# Homepage: http://iit.com.ua
# Download-Size: неизвестно
# APT-Manual-Installed: yes
# APT-Sources: /var/lib/dpkg/status
# Description: IIT End User CA-1. Sign (web)

```