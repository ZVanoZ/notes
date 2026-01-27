# About

@TODO: Добавить описание

## Связанные ресурсы в текущем репозитарии

* [dev-platforms/ts-typescript](../../dev-platforms/ts-typescript)

## RUN


````shell

# Создание "tsconfig.json" с базовыми настройками
tsc --init

# Компиляция *.ts
# При Этом используются настройки "tsconfig.json" из текущего каталога, либо выше
tsc index.ts

# Скомпилировать "index.ts" и выполнить
ts-node index.ts
````

## Errors

* Error: Cannot find module 'ts-node/register'

Возникает при запуске скрипта из IDE.  
Причина в том, что "ts-node/register" используется только из локальной области.  
1. Нужно проверить путь к рабочей директории в настройках запуска.  
Путь должен быть абсолютным и вести в директорию с "package.json".
2. Нужно проверить наличие файла "node_modules/.bin/ts-node".

````shell
node --require ts-node/register ./src/types-list.ts
````
