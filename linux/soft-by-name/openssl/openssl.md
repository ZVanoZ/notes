
````bash
# Получить список CA, которым доверяет openssl на текущем компьютере
awk -v cmd='openssl x509 -noout -subject' '/BEGIN/{close(cmd)};{print | cmd}' < /etc/ssl/certs/ca-certificates.crt

# Получить информацию о цепочке сертификатов для https://download.docker.com
## В виде листинга
openssl s_client -connect download.docker.com:443
## В виде дерева 
openssl s_client -connect download.docker.com:443 </dev/null 2>/dev/null | openssl x509 -inform pem -text
````