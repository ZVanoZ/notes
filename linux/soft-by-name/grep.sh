# 1. Найти "221" в результате вывода ifconfig
# 2. Вывести 8 строк после найденой позиции и 9 после
ifconfig |grep 221 -A 8 -B 9
# -- Результат
# br-a822f5f24767: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
#         inet 172.22.0.1  netmask 255.255.0.0  broadcast 172.22.255.255
#         ether 02:42:1b:22:d8:a5  txqueuelen 0  (Ethernet)
#         RX packets 0  bytes 0 (0.0 B)
#         RX errors 0  dropped 0  overruns 0  frame 0
#         TX packets 0  bytes 0 (0.0 B)
#         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
# 
# br-b953faa20d59: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
#         inet 192.168.221.1  netmask 255.255.255.240  broadcast 192.168.221.15
#         inet6 fe80::42:73ff:fe8e:56e  prefixlen 64  scopeid 0x20<link>
#         ether 02:42:73:8e:05:6e  txqueuelen 0  (Ethernet)
#         RX packets 144  bytes 301916 (301.9 KB)
#         RX errors 0  dropped 0  overruns 0  frame 0
#         TX packets 256  bytes 33838 (33.8 KB)
#         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
# 
# br-bcf16656a872: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500



# Найти все файлы с заданным текстом
# https://ru.stackoverflow.com/questions/639486/%D0%9A%D0%B0%D0%BA-%D0%BD%D0%B0%D0%B9%D1%82%D0%B8-%D0%B2%D1%81%D0%B5-%D1%84%D0%B0%D0%B9%D0%BB%D1%8B-%D1%81%D0%BE%D0%B4%D0%B5%D1%80%D0%B6%D0%B0%D1%89%D0%B8%D0%B5-%D0%B8%D1%81%D0%BA%D0%BE%D0%BC%D1%8B%D0%B9-%D1%82%D0%B5%D0%BA%D1%81%D1%82-%D0%BD%D0%B0-linux
grep -rnw '/путь/к/папке/с/файлами' -e "шаблон"
grep -rnw ./ -e "0012"
grep -rnw ./ -e "\d{4,}"
