# "nslookup"

[nslookup-help.txt](nslookup-help.txt)

## Примеры

* IPv6 к DNS от cloudflare
```shell
nslookup  ipv6.google.com 2606:4700:4700::1111
```
```text
;; UDP setup with 2606:4700:4700::1111#53(2606:4700:4700::1111) for ipv6.google.com failed: network unreachable.
;; no servers could be reached
;; UDP setup with 2606:4700:4700::1111#53(2606:4700:4700::1111) for ipv6.google.com failed: network unreachable.
;; no servers could be reached
;; UDP setup with 2606:4700:4700::1111#53(2606:4700:4700::1111) for ipv6.google.com failed: network unreachable.
;; no servers could be reached
```

* IPv6 к локальному DNS "dns-proxy-nodejs"

```shell
nslookup  ipv6.google.com fd00:0:0:1::13
```
```text
;; Warning: query response not set
Server:         fd00:0:0:1::13
Address:        fd00:0:0:1::13#53

ipv6.google.com canonical name = ipv6.l.google.com.
** server can't find ipv6.l.google.com: FORMERR

```

