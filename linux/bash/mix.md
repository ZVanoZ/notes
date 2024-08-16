* Получение форматированной даты в переменную, либо в как результат выражения
````shell
createdAt=$(date +'%Y-%m-%dT%H:%I:%SZ')
echo  "createdAt='${createdAt}'" 
echo  "CREATED_AT='$(date +'%Y-%m-%dT%H:%I:%SZ')'" 
````

* Перенаправление stdout команды в лог-файл
```shell
echo 'Hello' >./tmp/echo-stdout-$(date +"%Y-%m-%d_%H-%M-%S").log
```
* Перенаправление stdout и stderr команды в лог-файл
```shell
mkdir ./tmp/dir-without-access
chown -vR root:root ./tmp/dir-without-access

find ./tmp/ -name "*" &>./tmp/echo-stdout-stderr-$(date +"%Y-%m-%d_%H-%M-%S").log
```