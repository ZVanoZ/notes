# ip
пакет net-tools

````bash
apt search ip | grep --color=always "net-tools" -A1
# net-tools/stable,now 2.10-0.1 amd64 [установлен]
#  инструментарий для NET-3

# Установка
sudo apt install net-tools


````

## Примеры

````bash
# Показать список сетевых интерфейсов
ip addr

# Показать таблицу маршрутизации
ip route

# @TODO: разобраться
# Увидеть IP и MAC -адрес, аналог Работа с ARP протоколом: очистка таблицы -a 
ip neighbour show

# Поиск маршрута для удаленного ip
# 142.251.140.46 = google.com
ip route get 142.251.140.46
# 142.251.140.46 via 192.168.10.1 dev enp129s0 src 192.168.10.4 uid 1000 
#    cache 

# @TODO: разобраться
# Для все MAC задает состояние failed, в дальнейшем ядро Ос удалит помеченные так MAC записи из arp таблицы.
ip neigh flush all

# Вывести запись о маршруте по умолчанию:
ip r | grep --color=always default
# default via 192.168.10.1 dev enp129s0 proto dhcp src 192.168.10.4 metric 100

# Просмотр сетевых карт
ip link list

# Сбросить кеш маршрутизатора
ip route flush cache

# @TODO: разобраться
# blackhole. Добавить «зануленный» маршрут (аналог «ip route … null0» в Cisco). 
# Пакеты в сеть с таким маршрутом будут удалены с причиной «No route to host». 
# Может быть полезно для подавление DDoS атаки с хоста
ip route add blackhole 10.56.50.0/27

# C помощью команды ip addr add можно установить на сетевом интерфейсе как основной IP адрес, так и 
# несколько дополнительных адресов. 
## Удалить IP адрес
ip addr del 10.90.91.254 dev eth4
## удалить все с интерфейса wlan1
ip addr flush wlan1

# @TODO: разобраться
# Вывести таблицы маршрутизации. 
# Ядро принимает решение о применении той или иной таблицы на основании адреса источника пакета. 
# Эти таблицы применимы для всех пакетов. 
ip rule list
# 0:      from all lookup local
# 32766:  from all lookup main
# 32767:  from all lookup defaul
# Вывести содержимое таблицы local. 
ip route show table local
````