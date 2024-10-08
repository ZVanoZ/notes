<h1>apt</h1>

https://ravesli.com/difference-between-apt-and-apt-get-in-linux/

## 

````shell
apt
````
````text
apt 2.6.1 (amd64)
Использование: apt [параметры] команда

apt — менеджер пакетов с интерфейсом командной строки. Он предоставляет
команды для поиска и управления, а также запросов информации о пакетах.
apt выполняет те же задачи, что и специализированные инструменты APT,
например apt-get и apt-cache, но по умолчанию задействует параметры,
которые больше подходят для интерактивного использования.

Основные команды:
  list - показать список пакетов на основе указанных имён
  search - искать в описаниях пакетов
  show - показать дополнительные данные о пакете
  install - установить пакеты
  reinstall - переустановить пакеты
  remove - удалить пакеты
  autoremove - automatically remove all unused packages
  update - обновить список доступных пакетов
  upgrade - обновить систему, устанавливая/обновляя пакеты
  full-upgrade - обновить систему, удаляя/устанавливая/обновляя пакеты
  edit-sources - редактировать файл с источниками пакетов
  satisfy - удовлетворить строки зависимостей

Дополнительную информацию о доступных командах смотрите в apt(8).
Параметры настройки и синтаксис описаны в apt.conf(5).
Информацию о том, как настроить источники, можно найти в sources.list(5).
Выбор пакетов и версий описывается в apt_preferences(5).
Информация о безопасности доступна в apt-secure(8).
                    В APT есть коровья СУПЕРСИЛА.
````

## apt cache

```bash
# @TODO: добавить примеры использования
```

## apt policy
  
```bash
# Вывод информации об используемых репозиториях, а также их приоритете.
$ apt policy
Списки пакетов:
 100 /var/lib/dpkg/status
     release a=now
 500 http://download.opensuse.org/repositories/Emulators:/Wine:/Debian/Debian_10 ./ Packages
     release o=obs://build.opensuse.org/Emulators:Wine:Debian/Debian_10,n=Debian_10,l=Emulators:Wine:Debian,c=
     origin download.opensuse.org
 500 https://linux.teamviewer.com/deb stable/main i386 Packages
     release o=TeamViewer GmbH,a=stable,l=TeamViewer,c=main,b=i386
     origin linux.teamviewer.com
 500 https://linux.teamviewer.com/deb stable/main amd64 Packages
     release o=TeamViewer GmbH,a=stable,l=TeamViewer,c=main,b=amd64
     origin linux.teamviewer.com
 500 https://repo.skype.com/deb stable/main amd64 Packages
     release o=. stable,a=stable,n=stable,l=. stable,c=main,b=amd64
     origin repo.skype.com
 500 http://deb.playonlinux.com squeeze/main i386 Packages
     release v=6.0,o=PlayOnLinux,a=squeeze,n=squeeze,l=PoL,c=main,b=i386
     origin deb.playonlinux.com
 500 http://deb.playonlinux.com squeeze/main amd64 Packages
     release v=6.0,o=PlayOnLinux,a=squeeze,n=squeeze,l=PoL,c=main,b=amd64
     origin deb.playonlinux.com
 500 https://download.docker.com/linux/debian buster/stable amd64 Packages
     release o=Docker,a=buster,l=Docker CE,c=stable,b=amd64
     origin download.docker.com
 500 https://packagecloud.io/AtomEditor/atom/any any/main amd64 Packages
     release v=1,o=packagecloud.io/AtomEditor/atom,a=any,n=any,l=atom,c=main,b=amd64
     origin packagecloud.io
 500 http://deb.anydesk.com all/main i386 Packages
     release o=philandro Software GmbH,a=all,n=all,l=AnyDesk,c=main,b=i386
     origin deb.anydesk.com
 500 http://deb.anydesk.com all/main amd64 Packages
     release o=philandro Software GmbH,a=all,n=all,l=AnyDesk,c=main,b=amd64
     origin deb.anydesk.com
 500 https://dl.winehq.org/wine-builds/debian buster/main i386 Packages
     release o=dl.winehq.org,a=oldstable,n=buster,l=winehq,c=main,b=i386
     origin dl.winehq.org
 500 https://dl.winehq.org/wine-builds/debian buster/main amd64 Packages
     release o=dl.winehq.org,a=oldstable,n=buster,l=winehq,c=main,b=amd64
     origin dl.winehq.org
 500 https://apt.releases.hashicorp.com buster/main amd64 Packages
     release o=Artifactory,a=buster,n=buster,l=Artifactory,c=main,b=amd64
     origin apt.releases.hashicorp.com
 500 http://deb.debian.org/debian buster-updates/main i386 Packages
     release o=Debian,a=oldstable-updates,n=buster-updates,l=Debian,c=main,b=i386
     origin deb.debian.org
 500 http://deb.debian.org/debian buster-updates/main amd64 Packages
     release o=Debian,a=oldstable-updates,n=buster-updates,l=Debian,c=main,b=amd64
     origin deb.debian.org
 500 http://security.debian.org/debian-security buster/updates/main i386 Packages
     release v=10,o=Debian,a=oldstable,n=buster,l=Debian-Security,c=main,b=i386
     origin security.debian.org
 500 http://security.debian.org/debian-security buster/updates/main amd64 Packages
     release v=10,o=Debian,a=oldstable,n=buster,l=Debian-Security,c=main,b=amd64
     origin security.debian.org
 500 http://deb.debian.org/debian buster/main i386 Packages
     release v=10.12,o=Debian,a=oldstable,n=buster,l=Debian,c=main,b=i386
     origin deb.debian.org
 500 http://deb.debian.org/debian buster/main amd64 Packages
     release v=10.12,o=Debian,a=oldstable,n=buster,l=Debian,c=main,b=amd64
     origin deb.debian.org

# Вывод информации о версии установленного пакета и доступной для обновления версии пакета.
$ apt policy docker
docker:
  Установлен: (отсутствует)
  Кандидат:   1.5-2
  Таблица версий:
     1.5-2 500
        500 http://deb.debian.org/debian buster/main amd64 Packages
        500 http://deb.debian.org/debian buster/main i386 Packages
$ apt policy wine
wine:
  Установлен: (отсутствует)
  Кандидат:   4.0-2
  Таблица версий:
     4.0-2 500
        500 http://deb.debian.org/debian buster/main amd64 Packages
        500 http://deb.debian.org/debian buster/main i386 Packages
$ apt policy playonlinux
playonlinux:
  Установлен: 4.3.4
  Кандидат:   4.3.4
  Таблица версий:
 *** 4.3.4 500
        500 http://deb.playonlinux.com squeeze/main amd64 Packages
        500 http://deb.playonlinux.com squeeze/main i386 Packages
        100 /var/lib/dpkg/status


```

## apt list

```bash
# Вывести список установленных пакетов
apt list --installed

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