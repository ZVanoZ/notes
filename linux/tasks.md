<h1>Сценарии решения различных проблем в Linux</h1>

<hr/>

# Узнать какой дистрибутив установлен

## Раз

```BASH
uname -a
```
```TEXT
Linux 00821c2bcae8 4.19.0-18-amd64 #1 SMP Debian 4.19.208-1 (2021-09-29) x86_64 GNU/Linux
```

## Два

```BASH
cat /etc/os-release
```
Получим что-то типа
```TEXT
RETTY_NAME="Debian GNU/Linux jessie/sid"        № Вот это нас и интересует. Гуглим "debian jessy"
NAME="Debian GNU/Linux"
ID=debian
ANSI_COLOR="1;31"
HOME_URL="http://www.debian.org/"
SUPPORT_URL="http://www.debian.org/support/"
BUG_REPORT_URL="https://bugs.debian.org/"
```

<hr/>

# В терминале переключиться на рута 

```BASH
sudo su -
exit
```	
<hr/>

# Настроить монтирование дисков при старте системы

## 0. Смотрим что у нас вообще есть из дисков

```BASH
sudo blkid 
```
Получим что-то типа такого	
```TEXT
/dev/sda1: UUID="bd2dcca7-e963-40f2-bf7c-5c89640d7abc" TYPE="ext4" PARTUUID="95e3d9c4-01"
/dev/sda5: UUID="0e3e7559-9627-45e9-8daa-cd40e2f799b7" TYPE="swap" PARTUUID="95e3d9c4-05"
/dev/sdc: LABEL="dio-zim-1tb" UUID="933438ad-8152-44e9-937a-86f62a8eaa94" TYPE="ext4"
/dev/sdb1: UUID="b1e8618b-8074-4654-8dd6-eea602e7fed5" TYPE="ext4" PARTUUID="6a1e9125-01"
/dev/sdd: LABEL="zim16g" UUID="3C16265916261484" TYPE="ntfs"
/dev/mapper/truecrypt1: UUID="D27EFF1B7EFEF757" TYPE="ntfs"
```
	
## 1. Назначаем метки, если требуется .

```BASH
sudo e2label /dev/sdb1 dio-zim-120g-sys
# 2. Создаем каталоги для монтирования в них дисков
sudo mkdir /media/dio-zim-1tb
sudo mkdir /media/dio-zim-120g-sys
```

## 3. Прописываем монтирование в "/etc/fstab"

```BASH
sudo mcedit /etc/fstab
```
	
```TEXT
# Вносим строчки
# mount /mnt/dio-zim-1tb по "uuid"
#/dev/disk/by-uuid/933438ad-8152-44e9-937a-86f62a8eaa94 /mnt/dio-zim-1tb auto nosuid,nodev,nofail,x-gvfs-show 0 0

# mount /mnt/dio-zim-1tb по "label" (см. п.1)
/dev/disk/by-label/dio-zim-1tb /media/dio-zim-1tb auto nosuid,nodev,nofail,x-gvfs-show 0 0

# SSD 120
/dev/disk/by-label/dio-zim-120g-sys /media/dio-zim-120g-sys auto nosuid,nodev,nofail,x-gvfs-show 0 0
```
	
4. Монтируем, чтобы не перегзаружать систему (в дальнейшем монтирование будет происходить автоматически)
```BASH
sudo mount -a
```

<hr/>

# Добавить поддержку локали

Debian 10, PhpStorm 2019.2, svn 1.10.4 (r1850624)
При обновлении проекта из PhpStorm получаю ошибку:
09:15	Can't use Subversion command line client: svn
			svn: warning: cannot set LC_CTYPE locale
			svn: warning: environment variable LC_ALL is en_US.UTF-8
			svn: warning: please check that your locale name is correct
      
Решение:
Раскомментировать локаль "en_US.UTF-8 UTF-8" в "/etc/locale.gen"

Выполняем
```bash
sudo mcedit /etc/locale.gen 
```
Находим строчки и раскомментируем
```TEXT
en_US.UTF-8 UTF-8
ru_UA.UTF-8 UTF-8
```
Запускаем
```BASH
sudo locale-gen
```
Видим
```TEXT
Generating locales (this might take a while)...
  en_US.UTF-8... done
  ru_UA.UTF-8... done
```

<hr/>

# Вывести список установленных пакетов, которые не являются родными для Debian
```
# Эти пакеты рекомендуется удалить перед большим обновлением системы (например, Debian 10 на 11)
# $ sudo apt install aptitude 
$ aptitude search '?narrow(?installed, ?not(?origin(Debian)))'
...
i   atom                        - A hackable text editor for the 21st Century.                                                                                             
i   containerd.io               - An open and reliable container runtime                                                                                                   
i   docker-ce                   - Docker: the open-source application container engine                                                                                     
i   docker-ce-cli               - Docker CLI: the open-source application container engine                                                                                 
i A docker-ce-rootless-extras   - Rootless support for Docker.                                                                                                             
i A docker-scan-plugin          - Docker scan cli plugin.                                                                                                                  
i   eusw                        - IIT End User CA-1. Sign (web)                                                                                                            
i   jdk-17                      - Java Platform Standard Edition Development Kit                         
```
