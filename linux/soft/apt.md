<h1>apt</h1>

https://ravesli.com/difference-between-apt-and-apt-get-in-linux/

<h2>apt cache</h2>

```bash
# @TODO: добавить примеры использования
```

<h2>apt policy</h2>
  
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
$ apt policy anydesk
anydesk:
  Установлен: 6.1.1
  Кандидат:   6.1.1
  Таблица версий:
 *** 6.1.1 500
        500 http://deb.anydesk.com all/main amd64 Packages
        100 /var/lib/dpkg/status

```
