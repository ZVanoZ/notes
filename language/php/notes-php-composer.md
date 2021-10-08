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
