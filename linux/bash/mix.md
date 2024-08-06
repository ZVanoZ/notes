* Получение форматированной даты в переменную, либо в как результат выражения
````shell
createdAt=$(date +'%Y-%m-%dT%H:%I:%SZ')
echo  "createdAt='${createdAt}'" 
echo  "CREATED_AT='$(date +'%Y-%m-%dT%H:%I:%SZ')'" 
````
