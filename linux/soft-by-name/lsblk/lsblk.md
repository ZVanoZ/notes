# "lsblk"

[lsblk-help.txt](lsblk-help.txt)

## Системная информация 

* Информация о команде 
````shell
type lsblk        &> lsblk-type.txt
lsblk -h          &> lsblk-help.txt
lsblk --version   &> lsblk-version.txt
man lsblk         &> lsblk-man.txt
````

* Информация об установке
````shell
#sudo dpkg -i lsblk     &> lsblk-dpkg-i.txt
#dpkg --status lsblk    &> lsblk-dpkg-status.txt
#apt info lsblk         &> lsblk-apt-info.txt
````


## demos 

* Информация о всех устройствах: краткая
```shell
lsblk
```

* Информация о всех устройствах: файловая система; точка монтирования объем; свободное место
```shell
lsblk -f
```

* Информация об устройстве "sdc"
```shell
lsblk -f /dev/sdc
```

* Информация об устройстве /dev/sda

в виде таблицы
```shell
lsblk -a /dev/sda
```

в формате JSON
```shell
lsblk -Ja /dev/sda
```

* Ключевая информация о разделах "sda" и "sdb".  
Название, объем, использовано, доступно, тип файловой системы, точка монтирования 
```shell
lsblk -J -o NAME,SIZE,FSUSED,FSAVAIL,FSTYPE,MOUNTPOINT /dev/sda /dev/sdb
```