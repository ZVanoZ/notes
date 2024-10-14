# sudo

sudo — выполнение команд от имени другого пользователя

## Примеры

```shell
man sudo &>sudo-man.txt
```
```shell
sudo --help &>sudo-help.txt
```

* Запустить от пользователя "zend" скрипт "update-sandbox.sh"
Весь вывод направить в домашнюю директория текущего пользователя (не "zend", а тот, кто вызывает команду).
```shell
sudo -u zend bash update-sandbox.sh &>update-sandbox.log
```