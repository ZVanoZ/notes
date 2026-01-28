
* Сборка
```shell
clear && docker image build --progress plain  --no-cache --rm -t local/multistage-php:20250311 -f ./ci/Dockerfile .
```
* Консоль в среде созданного образа
```shell
docker run --rm -it local/multistage-php:20250311 bash
```
* Запустить образ как есть
```shell
docker run --rm -it -p 5080:80 local/multistage-php:20250311
```
* Запустить образ смонтировав в него html
```shell
docker run --rm -it -p 5080:80 -v ./www/html:/var/www/html local/multistage-php:20250311
```