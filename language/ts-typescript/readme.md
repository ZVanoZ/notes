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