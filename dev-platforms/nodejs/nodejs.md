# Node

@TODO: добавить базовое описание

<hr>

## Установка

**Debian**

[Установка Node.js в Debian 10](https://www.8host.com/blog/ustanovka-node-js-v-debian-10/)
```bash
# NodeJs 10 устарела, при этом в Debian она не устанавливается штатными средствами.
# Для исправления обновляем NodeJs при помощи NVM.
#
$ sudo apt remove nodejs
$ curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh -o install_nvm.sh
$ bash install_nvm.sh
$ source ~/.profile
$ nvm ls-remote
...
       v16.14.1   (Latest LTS: Gallium)
...
$ nvm install 16.14.1
$ nvm ls
... список установленных версий
$ nvm use 16.14.1
... переключились на версию 16.14.1
$ node -v
v16.14.1
$ type node
node является /home/ivan/.nvm/versions/node/v16.14.1/bin/node
```

<hr>

## Настройка

*@TODO: Описать как можно использовать NodeJs*

<hr>

## Менеджеры версий

* [nvm.md](nvm.md)

## Команды

````shell
# Запустить *.js на выполнение
node index.js
````