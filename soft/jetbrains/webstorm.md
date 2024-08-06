# About

## Отладка

### По мануалу от разработчика.



[Running and debugging TypeScript](https://www.jetbrains.com/help/webstorm/running-and-debugging-typescript.html#ws_ts_debug)

````text
npm install --save-dev -g ts-node
npm install --save-dev ts-node

Для отладки TS нужно скомпилировать ts в js с генерацией sourceMap.

В корне проекта создаем файл [tsconfig.json]
{
  "compilerOptions": {
    "module": "commonjs",
    "target": "es5",
    "sourceMap": true
  },
  "exclude": [
    "node_modules"
  ]
}

После этого появится возможность ставить точки останова в *.ts файла и активируются иконки запуска.
Но запуск будет выдавать терминал TS.
Чтобы выполнялся текущий скрипт, нужно настроить интеграцию IDE.
1. Идем в "Run/Debug Configurations"
2. Жамкаем "+", Выбираем "Node.js"
3.  Выставляем опции
Node interpreter : [...                            ]
Node parametres  : [--require ts-node/register     ]
Working directory: [~/zim/work/ts-react-petrichenko]
JavaScript file  : [$FilePath$                     ] @see https://www.jetbrains.com/help/objc/built-in-macros.html     

````

* При запуске получаю ошибку "Error: Cannot find module ..."  
  Причина в том, что в опции "JavaScript file" было значение "$FilePathRelativeToProjectRoot$".  
  Почему с этой переменной не работает, непонятно. Во всех мануалах используют ее.  
````
/home/ivan/.nvm/versions/node/v21.7.1/bin/node --require ts-node/register /home/ivan/zim/work/ts-react-petrichenko
Error: Cannot find module '/home/ivan/zim/work/ts-react-petrichenko'
    at Function.Module._resolveFilename (node:internal/modules/cjs/loader:1142:15)
    at Function.Module._resolveFilename.sharedData.moduleResolveFilenameHook.installedValue [as _resolveFilename] (/home/ivan/zim/work/ts-react-petrichenko/node_modules/@cspotcode/source-map-support/source-map-support.js:811:30)
    at Function.Module._load (node:internal/modules/cjs/loader:983:27)
    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:142:12)
    at node:internal/main/run_main_module:28:49 {
  code: 'MODULE_NOT_FOUND',
  requireStack: []
}

Process finished with exit code 1
````

* Error: Cannot find module 'ts-node/register'  
  Иногда настройки слетают и при запуске получаем ошибку несмотря на то, что модуль "ts-node" установлен глобально.
````
~/.nvm/versions/node/v21.7.1/bin/node --require ts-node/register ~/work/ts-react-petrichenko
node:internal/modules/cjs/loader:1145
  throw err;
  ^

Error: Cannot find module 'ts-node/register'
Require stack:
- internal/preload
    at Module._resolveFilename (node:internal/modules/cjs/loader:1142:15)
    at Module._load (node:internal/modules/cjs/loader:983:27)
    at internalRequire (node:internal/modules/cjs/loader:174:19)
    at Module._preloadModules (node:internal/modules/cjs/loader:1573:5)
    at loadPreloadModules (node:internal/process/pre_execution:737:5)
    at setupUserModules (node:internal/process/pre_execution:204:5)
    at prepareExecution (node:internal/process/pre_execution:160:5)
    at prepareMainThreadExecution (node:internal/process/pre_execution:54:10)
    at node:internal/main/run_main_module:11:19 {
  code: 'MODULE_NOT_FOUND',
  requireStack: [ 'internal/preload' ]
}

Node.js v21.7.1
````


### Через плагин [Run Configuration for TypeScript](https://plugins.jetbrains.com/plugin/10841-run-configuration-for-typescript)

1. Идем в Settings/Plugins
2. Ищем плагин по названию "Run Configuration for TypeScript" и жмем Install
3. Жамкаем правой кнопкой на *.ts в дереве проектов и жмем "Run ...".  
При этом создастся конфигурация конкретно для выбранного файла.  
В создании отдельной конфигурации есть свои плюсы и минусы.  
(+) Можно настроить запуск для отдельно взятого *.ts при прохождении учебного курса.  
(-) Плодятся конфигурации, что немного напрягает.



