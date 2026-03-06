# "tree"

[tree-help.txt](tree-help.txt)

## Demos

* Создать тестовое окружение
```shell
mkdir -vp ./tmp/1/1-1
echo '.0' > ./tmp/.0.txt
echo '0' > ./tmp/0.txt
echo '1-1' > ./tmp/1/1-1/1-1.txt
mkdir -vp ./tmp/1/1-2
mkdir -vp ./tmp/2/
```

* Базовая команда
```shell
tree
```
```shell
tree ./tmp
```

* Все файлы (в том числе скрытые ".*")
```shell
tree -a
```
```shell
tree -a ./tmp
```

* Только директории
```shell
tree -d
```
