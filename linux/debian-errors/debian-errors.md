
<hr>

## debian 12

* Нет сертификата для "https://" репозитария
Ошибка:
````bash
sudo apt update
# E: https://download.docker.com/linux/debian bookworm InRelease is not (yet) available (Certificate verification failed: The certificate is NOT trusted. The certificate issuer is unknown.  Could not handshake: Error in the certificate verification. [IP: 108.138.51.79 443])
````
Причина:
````bash
# Причина в том, что в системе не хватает сертификата CA, который заверил  https://*.docker.com
cat /etc/apt/sources.list.d/docker.list
#--
# deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable
#--
````
Решение:
````bash
# Исправляем отметкой нужных сертификатов (или всех) вызвав "dpkg-reconfigure ca-certificates"
sudo dpkg-reconfigure ca-certificates
# Updating certificates in /etc/ssl/certs...
# rehash: warning: skipping ca-certificates.crt,it does not contain exactly one certificate or CRL
# 84 added, 0 removed; done.
# Обрабатываются триггеры для ca-certificates (20230311) …
# Updating certificates in /etc/ssl/certs...
# 0 added, 0 removed; done.
# Running hooks in /etc/ca-certificates/update.d...
# done.
# Обрабатываются триггеры для ca-certificates-java (20230710~deb12u1) …
# done.

sudo apt update
# Сущ:1 http://deb.debian.org/debian bookworm InRelease
# Сущ:2 http://deb.debian.org/debian-security bookworm-security InRelease                              
# Сущ:3 http://deb.debian.org/debian bookworm-updates InRelease                                        
# Пол:4 https://download.docker.com/linux/debian bookworm InRelease [43,3 kB]                          
# Пол:5 https://download.docker.com/linux/debian bookworm/stable amd64 Packages [21,6 kB]
# Получено 65,0 kB за 1с (115 kB/s)   
# Чтение списков пакетов… Готово
# N: Репозиторий «Debian bookworm» изменил значение поля «firmware component» с «non-free» на «non-free-firmware»
# N: Дополнительные сведения об этом можно найти в «Информации о выпуске» по адресу: https://www.debian.org/releases/bookworm/amd64/release-notes/ch-information.html#non-free-split
````

<hr>