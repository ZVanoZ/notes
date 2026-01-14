# "ip"

пакет net-tools

[ip-help.txt](ip-help.txt)

## Системная информация

* Информация о команде

````shell
type ip        &> ip-type.txt
ip --help      &> ip-help.txt
ip -V          &> ip-version.txt
man ip         &> ip-man.txt
````

* Информация об установке

````shell
#sudo dpkg -i ip     &> ip-dpkg-i.txt
#dpkg --status ip    &> ip-dpkg-status.txt
#apt info ip         &> ip-apt-info.txt
````

* Установка

````bash
apt search ip | grep --color=always "net-tools" -A1
# net-tools/stable,now 2.10-0.1 amd64 [установлен]
#  инструментарий для NET-3

# Установка
sudo apt install net-tools

````

## Примеры


Показать список сетевых интерфейсов
```bash
ip addr
```

Показать таблицу маршрутизации
```bash
ip route
```

@TODO: разобраться.
Увидеть IP и MAC -адрес, аналог Работа с ARP протоколом: очистка таблицы -a
```bash
ip neighbour show
```

Поиск маршрута для удаленного ip
142.251.140.46 = google.com
```bash
ip route get 142.251.140.46
```
```text
142.251.140.46 via 192.168.10.1 dev wlo1 src 192.168.10.13 uid 1000 
    cache 
```

@TODO: разобраться
Для все MAC задает состояние failed, в дальнейшем ядро Ос удалит помеченные так MAC записи из arp таблицы.
```bash
ip neigh flush all
```

Вывести запись о маршруте по умолчанию:
```bash
ip r | grep --color=always default
```
```text
default via 192.168.10.1 dev enp129s0 proto dhcp src 192.168.10.4 metric 100
```

Просмотр сетевых карт
```shell
ip link list
```

Сбросить кеш маршрутизатора
```shell
ip route flush cache
```

@TODO: разобраться
blackhole. Добавить «зануленный» маршрут (аналог «ip route … null0» в Cisco). 
Пакеты в сеть с таким маршрутом будут удалены с причиной «No route to host». 
Может быть полезно для подавление DDoS атаки с хоста
```shell
ip route add blackhole 10.56.50.0/27
```

C помощью команды ip addr add можно установить на сетевом интерфейсе как 
основной IP адрес, так и несколько дополнительных адресов. 

Удалить IP адрес
```shell
ip addr del 10.90.91.254 dev eth4
```
удалить все с интерфейса wlan1
```shell
ip addr flush wlan1
```

@TODO: разобраться
Вывести таблицы маршрутизации. 
Ядро принимает решение о применении той или иной таблицы на основании адреса источника пакета. 
Эти таблицы применимы для всех пакетов.
```shell
ip rule list
```
```text
# 0:      from all lookup local
# 32766:  from all lookup main
# 32767:  from all lookup defaul
```
Вывести содержимое таблицы local. 
```shell
ip route show table local
```
````