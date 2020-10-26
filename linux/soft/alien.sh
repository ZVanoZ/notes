#-------------------------------------------------------------------------------------------
# Утилита alien позволяет конвертирова установочные пакеты linux из одного формата в ругой.
# Например:
# * rpm -> deb
#   $ sudo alien --to-deb <имя rpm пакета>
# * deb -> rpm
#   $ sudo alien --to-rpm <имя deb пакета>

#-------------------------------------------------------------------------------------------

# Конвертируем RPM пакет клиента Oracle в DEB для установки в Debian-базированных Linux
$ cd /mnt/zim-1tb/data/install/Oracle Client/11.2.0.4.0/linux
$ sudo alien --to-deb --scripts oracle-instantclient11.2-devel-11.2.0.4.0-1.x86_64.rpm 
oracle-instantclient11.2-devel_11.2.0.4.0-2_amd64.deb generated

#-------------------------------------------------------------------------------------------
