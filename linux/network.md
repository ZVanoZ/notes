# Настройка DNS 

/etc/systemd/resolved.conf 
```conf
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
