# Настройка DNS 

```bash
# Смотрим статус
$ systemd-resolve --status 
````
```text
 systemd-resolve --status 
Global
       Protocols: +LLMNR +mDNS -DNSOverTLS DNSSEC=no/unsupported
resolv.conf mode: uplink
     DNS Servers: 10.2.0.1 10.10.10.183
      DNS Domain: my-company.local
      
Link 3 (wlx64eeb7164314)
Current Scopes: DNS LLMNR/IPv4 LLMNR/IPv6
     Protocols: +DefaultRoute +LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
   DNS Servers: 192.168.43.184      << Этот DNS автоматически выдал Lifecell.        

````

/etc/systemd/resolved.conf 
```ini
[Resolve]
# Через пробел
# DNS=10.2.0.1 10.10.10.183 
DNS=10.10.10.183

#DNSOverTLS=yes
Domains=my-company.local
#FallbackDNS=8.8.8.8 10.2.0.1 10.10.10.183
#ReadEtcHosts=yes

#FallbackDNS=
#Domains=
#DNSSEC=no
#DNSOverTLS=no
#MulticastDNS=yes
#LLMNR=yes
#Cache=yes
#DNSStubListener=yes
#DNSStubListenerExtra=
#ReadEtcHosts=yes
#ResolveUnicastSingleLabel=no

```

````bash
# Перезапускаем демона.
# При этом обновляется содержимое "/etc/resolv.conf"
sudo service systemd-resolved restart
````
