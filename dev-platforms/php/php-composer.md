<hr/>
# О файле

Тут заметки по использованию утилиты composer для PHP 

<hr/>

## Ссылки на документацию к php-composer

* Официальные ресурсы 
  * https://getcomposer.org/
  * https://getcomposer.org/doc/
  * https://getcomposer.org/doc/05-repositories.md
  * https://getcomposer.org/doc/articles/authentication-for-private-packages.md
* [Composer на русском](https://mb4.ru/programms/programs-for-automation/composer.html)
  * [Настройка Composer в composer.json. Раздел config в composer.json](https://mb4.ru/programms/programs-for-automation/composer/1923-config.html)
  * [Аутентификация для приватного размещенных пакетов и репозиториев в Composer](https://mb4.ru/programms/programs-for-automation/composer/1960-authentication-for-private-packages.html)
  * [Версии и ограничения. Объяснение работы с версиями в Composer.](https://mb4.ru/programms/programs-for-automation/composer/2039-versions.html)

<hr/>

## Консоль

Установка зависимостей в PROD-режиме.
```shell
composer install -vvv --no-dev
```

<hr/>

## Авторизация на приватных репозитариях. Есть 4 способа.

* Автоматическая авторизация по токену в github  

```js
// "~/.composer/auth.json"
{
  "http-basic": {
  },
  "github-oauth": {
    "github.com": "ТутТокен"
  }
}
```

* Автоматическая авторизация по паролю в SVN репозитарии

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
// Вариант 2
// Грузим библиотеку "mycompany/tcpdf-fonts": "trunk" из  "url": "http://svn.my-company.local/svn/web/libs/tcpdf-fonts/trunk",
{
  "require-dev": {
    "mycompany/tcpdf-fonts": "trunk"
  },
 "repositories": [
   "config" : {
    "secure-http": false
  },
  "repositories": [
    {
      "type": "package",
      "package": {
        "name": "mycompany/tcpdf-fonts",
        "version":"trunk",
        "source": {
          "url": "http://svn.my-company.local/svn/web/libs/tcpdf-fonts/trunk",
          "type": "svn",
          "reference": "trunk"
        }
      }
    }
  ]
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
<hr />

## Использование GIT репозитария для затягивания форка пакета и его подключение вместо стандартного

* Вариант когда структура репозитария верна

````text
Правильная структура должна содержать теги с правильными именами.
@TODO: разобраться в теме
@TODO: https://mb4.ru/programms/programs-for-automation/composer/1911-schema.html#version
@TODO: тут сказано что могут быть другие имена 

Ветки:
* master

Теги:
* "release-2.14.0" - релизная ветка. Позволяет использовать библиотеку в проектах с опцией "minimum-stability": "stable"

````

````js
// Пример конфига для использования либы
{
	"minimum-stability": "stable", // тег "release-2.14.0" позволит пройти проверку  
	"require": {
	    "php": "^8.1",
		"laminas/laminas-db": "^2.14"
    },
    "repositories": [
        {
            "type": "vcs",
            "url": "https://x-access-token:<TOKEN>@github.com/ZVanoZ/laminas-db.git"
        },
        {
            "packagist.org": false  // Если хотим отключить публичный репозитарий
        }
    ]
}
````

* Вариант, когда структура репозитария неверна

```js
// Рабочий пример подключения форка "laminas-db"
//
// Тут надо было не создавать ветку "2.14.dio", а пихать свой код в существующие ветки и время от времени подливать 
//   изменения из основного репозитария.

// composer.json
{
  "repositories": [
    {
      "type": "package", // Объявляем репозитарий
      "package": {
        "name": "zvanoz/laminas-db",   // Объявляем фейковое имя пакета (любое, которое не используется в packagist)
        "version":"dev-master",        // Объявляем версию пакета (любую. В данном случае "dev-master" но могла бы быть и такой"2.14.20211105")
        "source": {
          "url": "https://github.com/ZVanoZ/laminas-db.git",   // Указываем репозиторий
          "type": "git",                                       // Указываем тип репозитария
          "reference": "2.14.dio" // Указываем тег или ветку или хеш ревизии, которая будет затянута (должно соответствовать реальности)
        }
      }
    }
  ],
  "require": {
    "zvanoz/laminas-db": "dev-master" // Подключаем пакет по фейковому имени
  },
  "autoload": {
    "psr-4": {
      "Laminas\\Db\\": "vendor/zvanoz/laminas-db/src" // Переопределяем путь поиска "laminas-db" на наш фейковый пакет в папке "vendor"
    }

}
```

<hr/>

## FAQ

* Можно ли использовать в качестве репозитария VCS клон с локального диска?

Можно, но вероятно это не даст нужный результат.
````JS
// composer.json
{
  "require": {
    "zvanoz/laminas-db": "~1.6.0"
  },
  "repositories": [
      {
          "type": "vcs",
          "url": "./library/laminas-db/"
      }
  ]
}
````
В результате, папка "./library/laminas-db" будет скопирована в "./vendor/zvanoz/laminas-db".  
Она **НЕ БУДЕТ** линком на исходную.  
Поэтому изменения в "./library/laminas-db" не попадут в "./vendor/...".  
А также, папка в "./vendor/..." не будет иметь в origin ссылку на локальную копию (в origin будет URL первичного репозитария).  
Можно открыть в IDE папку  "./vendor/zvanoz/laminas-db" и вносить изменения в нее, но тогда зачем было указывать в URL локальный путь?    
В таком случае можно было бы сразу указать правильный URL в "composer.json".  

Следует отметить, что если попытаться использовать "type": "path" в роли "vcs", то тоже не добьемся нужного результата.  
php-composer будет считать, что текущее состояние репозитария однозначно соответствует запрошенной версии библиотеки.  
Он не будет переключаться между тегами и ветками.  
Зато в "composer.lock" запишет ту версию, что требуется в "composer.json".  
PS: этот вариант можно использовать, если вручную переключаться на нужную ветку.
````JS
// composer.json
{
  "require": {
    "zvanoz/laminas-db": "~1.6.0"
  },
  "repositories": [
      {
          "type": "path",
          "url": "./library/laminas-db/"
      }
  ]
}
````
````BASH
#------------------------------------------------------------------------------
# Выполняем обновление.
#-----
 
# По логу видим:
# 1. Создан линк на папку с исходниками 
# 2. Установлена версия "1.6.0"
# Типа, то что надо. Но на самом деле это не так. 
composer update -vvv
# Reading ./composer.lock (/var/www/composer.lock)
# Package operations: 0 installs, 1 update, 0 removals
# Updates: dio/dio-zf1future:1.6.0
#   - Removing dio/dio-zf1future (1.6.0)
# Executing async command (CWD): rm -rf '/var/www/vendor/zvanoz/laminas-db'
#   - Installing dio/dio-zf1future (1.6.0): Symlinking from ./library/laminas-db
# Generating autoload files

#------------------------------------------------------------------------------
# Проверяем
#----

# Смотрим создался ли линк.
#  OK. Линк создан и ссылается на нужную папку.
ls -l vendor/zvanoz/laminas-db
# lrwxrwxrwx 1 root root 28 May 10 08:54 vendor/zvanoz/laminas-db -> ../../library/laminas-db/

# Смотрим что на самом деле с переключением на нужную версию
cd vendor/dio/dio-zf1future/
# Смотрим какая ветка активна
# FAIL! Текущая ветка "master", а ожидаем "1.6.0"  
git branch 
# * master

# Смотрим, а доступна ли версия "1.6.0" в принципе
# Видим, что в "origin" есть ветка "1.6.0", но php-composer не переключился на нее.  
git branch --all
# * master
#   remotes/origin/1.6.0
#   remotes/origin/HEAD -> origin/master
#   remotes/origin/master
````

<hr/>
