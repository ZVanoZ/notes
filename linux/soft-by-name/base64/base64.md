# "base64"

[base64-help.txt](base64-help.txt)

## Системная информация 

* Информация о команде 
````shell
type base64        &> base64-type.txt
base64 --help      &> base64-help.txt
base64 --version   &> base64-version.txt
man base64         &> base64-man.txt
````

* Информация об установке
````shell
#sudo dpkg -i base64     &> base64-dpkg-i.txt
#dpkg --status base64    &> base64-dpkg-status.txt
#apt info base64         &> base64-apt-info.txt
````


## Demos

* Кодировать
```shell
echo '123' | base64
```
`MTIzCg==`
* Декодировать
```shell
echo 'MTIzCg==' | base64 -d
```
`123`