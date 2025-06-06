# "ipcalc"

[ipcalc-help.txt](ipcalc-help.txt)

## Системная информация

* Поиск
```shell
apt search ipcalc        &> ipcalc-apt-search.txt
```

* Установка
```shell
sudo apt install -y ipcalc/stable
```

* Информация о команде
````shell
type ipcalc        &> ipcalc-type.txt
ipcalc --help      &> ipcalc-help.txt
ipcalc --version   &> ipcalc-version.txt
man ipcalc         &> ipcalc-man.txt
````

* Информация об установке
````shell
#sudo dpkg -i ipcalc     &> ipcalc-dpkg-i.txt
#dpkg --status ipcalc    &> ipcalc-dpkg-status.txt
apt info ipcalc         &> ipcalc-apt-info.txt
````


## Demos

```shell
ipcalc 192.168.0.1/24
ipcalc 192.168.0.1/23
```
```text
Address:   192.168.0.1          11000000.10101000.00000000. 00000001  <--->  Address:   192.168.0.1          11000000.10101000.0000000 0.00000001 
Netmask:   255.255.255.0 = 24   11111111.11111111.11111111. 00000000  <--->  Netmask:   255.255.254.0 = 23   11111111.11111111.1111111 0.00000000 
Wildcard:  0.0.0.255            00000000.00000000.00000000. 11111111  <--->  Wildcard:  0.0.1.255            00000000.00000000.0000000 1.11111111 
=>                                                                    <--->  =>
Network:   192.168.0.0/24       11000000.10101000.00000000. 00000000  <--->  Network:   192.168.0.0/23       11000000.10101000.0000000 0.00000000 
HostMin:   192.168.0.1          11000000.10101000.00000000. 00000001  <--->  HostMin:   192.168.0.1          11000000.10101000.0000000 0.00000001 
HostMax:   192.168.0.254        11000000.10101000.00000000. 11111110  <--->  HostMax:   192.168.1.254        11000000.10101000.0000000 1.11111110 
Broadcast: 192.168.0.255        11000000.10101000.00000000. 11111111  <--->  Broadcast: 192.168.1.255        11000000.10101000.0000000 1.11111111 
Hosts/Net: 254                   Class C, Private Internet            <--->  Hosts/Net: 510                   Class C, Private Internet













```