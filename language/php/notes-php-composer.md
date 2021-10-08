<hr/>

## Ссылки на документацию к php-composer


* https://getcomposer.org/
* https://getcomposer.org/doc/
* https://getcomposer.org/doc/05-repositories.md

<hr/>

## Автоматическая авторизация по паролю в SVN репозитарии

```js
// Вносим авторизацию в конфиг "~/.composer/auth.json"
//> При совпадении "repositories.url" в package.json с "svn.example.org" будут 
//> использоваться "username" и "password" из "~/.composer/auth.json"
{
      "http-basic": {
        "svn.example.org": {
            "username": "логин",
            "password": "пароль" 
        }
    }
}
```

<hr/>


## Использование SVN репозитария

**@TODO: поэкспериментировать и описать подробнее**

```js
// my-app/composer.json
{
    "name": "company/project",
    "description": "Description",
    "minimum-stability": "stable",
    "config" : {
        "secure-http": false
    },
    {
        "repositories": [
            {
                "type": "vcs",
                "url": "http://svn.example.org/projectA/", // авторизация из  "~/.composer/auth.json"
                "trunk-path": "Trunk",
                "branches-path": "Branches",
                "tags-path": "Tags"
            }
        ]
    },
    "require": {    
//        ...@TODO: а как использовать то?
    }
}
```

<hr />

## Использование SVN репозитария для затягивания конкретного пакета

* https://getcomposer.org/doc/05-repositories.md#package-2

```js
// my-app/composer.json
{
    "name": "company/project",
    "description": "Description",
    "minimum-stability": "stable",
    "config" : {
        "secure-http": false
    },
    {
        "repositories": [
        {
            "type" : "package",
            "package"  : {
                "name"    : "mylibs/zendframework",
                "version" : "1.11.11",
                "dist"  : {
                    "type"  : "zip",
                    "url"  : "http://svn.example.org/svn/libs/archive/ZendFramework/ZendFramework-1.11.11.zip"  // авторизация из "~/.composer/auth.json"
                },
                "autoload": {
                    "psr-0" : {
                        "Zend" : "",
                        "ZendX" : ""
                    }
                },
                "include-path": [""]
            }
        },
        ]
    },
    "require": {
        "php": "^5.3.0",
        "mylibs/zendframework" :"1.11.11",
    }
}
```

* https://getcomposer.org/doc/05-repositories.md#artifact

Вроде, этот вариант правильнее. Но я его не использовал.

**@TODO: попробовать и описать**

```js
// my-app/composer.json
// Подключаем библиотеку "some-company/their-library": "10.3.5"
// Библиотека находится по пути "my-app/path/to/directory/with/zips/some-company-their-library-10.3.5.zip"
// Внимание! Название архива должно соответствовать формату 
// <"название компании"-"название библиотеки"-"версия библиотеки".zip>
{
    "repositories": [
        {
            "type": "artifact",
            "url": "path/to/directory/with/zips/"
        }
    ],
    "require": {
        "some-company/their-library": "10.3.5"
    }
}

```

<hr/>

## Подключаем пакет с "composer.json" из папки 

Такой вариант может пригодиться, когда разравбатываем прототип пакета.

Допустим, приложение имеет структуру
```TEXT
[my-app]
|>[library]
| \>[my-library]
|   |>[src]
|   | \> ...тут исходники библиотеки
|   \>composer.json  - конфиг библиотеки
|>[vendor]
| \>...
|>composer.json  - конфиг приложения
```
```js
// my-app/library/my-library/composer.json
{
  "name": "my-company/my-library",
  "type": "library",
  "version": "0.0.1",
  "autoload": {
    "psr-0": {
      "MyLibrary_": "src/"
    }
  }
}
```
Чтобы подключить эту библиотеку
```JS
// 1. Прописываем путь к ней в "composer.json" приложения
// "my-app/composer.json"
{
  // ...
  "repositories": [
    {
      "type": "path",
      "url": "library/my-library"   // утилита composer при установке пакетов будет искать в этой директории. Найдет тут "composer.json" и выполнит установку.
    }
  ],
  // ...
}
```
```BASH
# 2. Запускаем установку библиотеки через composer
# Внимание! Добавлять юиюлиотеку через вызов обязательно т.к. composer создает символичкскую ссылку 
# "my-app/vendor/my-company/my-library" которая ссылается на
# "my-app/library/my-company/my-library"
# Если добавить руками зависимость в "my-app/composer.json" 
#   require "my-company/my-library": "^0.0.1" 
# то ссылка не создается и автолоадер не работает.
cd my-app
docker run --rm -v $(pwd):/app  tomsowerby/php-5.3-composer require "my-company/my-library"
```

<hr/>
