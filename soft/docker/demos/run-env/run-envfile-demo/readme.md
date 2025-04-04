# run-envfile-demo

Передача переменных окружения из ".env" с использованием аргумента "--env-file"  

```shell
docker run --rm -it --env-file ./.env ubuntu bash -c 'env | grep app_'
```