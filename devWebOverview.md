# Краткий справочник по технологиям Web-разработки

Описываем то, что могут потребовать от Web-овца с направлением PHP + JavaScript.

# Терминология (применительно к Web)

* Frontend - то, что работает в браузере пользователя. 

HTML, CSS, JavaScript, VB для IE

* Backend - то что работает на серверной стороне

** Серверные языки

PHP, серверный JavaScript, PERL, Ruby, Java и т.д.

** Базы данных

MySQL, PostgeSQL, Oracle и т.д.
Впрочем, могут быть и NoSQL базы.

* Deploy - проливка

Процесс копирования програмного кода и данных на сервер.

# Frontend

* React.js

Библиотека позволяющая строить интерфейсы Web-приложений.
Характерные черты: компонентный подход, композиция,  ререндеринг DOM по изменению состояния компонент
http://learn.javascript.ru/screencast/react

* Bootstrap

Он же Twitter Bootstrap

* Babel

Конвертер различных синтаксисов в JavaScript.
.JSCS => .JS для reactJS

* Webpack

Сборщик JS и CSS.
Написан на JavaScript
http://learn.javascript.ru/screencast/webpack

# Backend

* Twig

Шаблонизатор для PHP

* Yii2

PHP фреймворк.

* Slim

PHP фреймворк.
Позиционируется как маленький быстрый и простой.
https://www.slimframework.com/

# Проливка (Deploy)

* Deployer

Утилита на PHP для проливки проектов. 
Умеет подключаться по SSH к различным серверам и выполнять проливку.
Команды выполняются на удаленном сервере с правами подключившегося пользователя. 

* Gulp
Таск-менеджер типа Deployer, но под JavaScript.
Распространяется под NPM, который входит в состац NodeJS
http://learn.javascript.ru/screencast/gulp

* Docker

Docker — программное обеспечение для автоматизации развёртывания и управления приложениями в среде виртуализации на уровне операционной системы.
Написан на языке Go (т.е. компилируется). 
https://ru.wikipedia.org/wiki/Docker



# @TODO:

* Node.JS



