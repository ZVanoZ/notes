# alien

---

Утилита alien позволяет конвертировать установочные пакеты linux из одного формата в другой.
Например:

```text
# * rpm -> deb
#   $ sudo alien --to-deb <имя rpm пакета>
# * deb -> rpm
#   $ sudo alien --to-rpm <имя deb пакета>
```

---

## CMD

* Установка
```shell
sudo apt install -y alien
```
* help
```shell
alien --help &>alien-help.txt
```
* man
```shell
man alien &>alien-man.txt
```

* Конвертируем RPM пакет клиента Oracle в DEB для установки в Debian-базированных Linux

```shell
cd /mnt/zim-1tb/data/install/Oracle Client/11.2.0.4.0/linux
sudo alien --to-deb --scripts oracle-instantclient11.2-basic-11.2.0.4.0-1.x86_64.rpm
oracle-instantclient11.2-basic_11.2.0.4.0-2_amd64.deb generated
```

---
