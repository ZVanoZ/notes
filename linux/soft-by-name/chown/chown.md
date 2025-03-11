# "chown"

[chown-help.txt](chown-help.txt)

## Системная информация

* Информация о команде

````shell
type chown        &> chown-type.txt
chown --help      &> chown-help.txt
chown --version   &> chown-version.txt
man chown         &> chown-man.txt
````

* Информация об установке

````shell
#sudo dpkg -i chown     &> chown-dpkg-i.txt
#dpkg --status chown    &> chown-dpkg-status.txt
#apt info chown         &> chown-apt-info.txt
````

# Примеры

* Рекурсивно сменить владельца "/var/www..." на www-data   
  Опция -h сменяет владельца файла символической ссылки "/var/www/ht,l/www-demo"  
  Опция -L сменяет владельца файла перейдя по ссылке "/var/www/ht,l/www-demo" в целевую директорию "
  /docker-build/www-demo/"

````shell
chown -vRLh www-data:www-data /var/www
````