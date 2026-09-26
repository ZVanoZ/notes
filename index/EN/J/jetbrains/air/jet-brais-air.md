# About

IDE для разработки  при помощи AI.

JetBrains Air is the Agentic Development Environment where Codex, Claude Agent, Gemini CLI, and Junie execute independent task loops without interfering with each other.

## Links

* Домашняя 
https://air.dev/
* Getting started
https://www.jetbrains.com/help/air/getting-started.html

## Install

* Установка через toolbox (см. [jet-brains-toolbox.md](../toolbox/jet-brains-toolbox.md))
https://www.jetbrains.com/toolbox-app/

* Страница загрузки

https://air.dev/download

Установка в linux  из терминала с использованием curl
```shell
curl -fsSL https://jb.gg/air-install.sh | sh
```

## Run

После установки в главном меню OS появляется пункт Air.

Тыкаем на него.

Открывается IDE и предлагает авторизироваться при помощи одного из трех AI сервисов.
```text
1. Anthropic
Clasude Agent

2. OpenAI
Codex

3. Google
???
```

Я выбрал Google Geminy.

Открылось окно авторизации с вариантами "По eMail" и "API-KEY".
* "Google Account (Personal or Workspace)"
```text
"По eMail" - не удалось авторищироваться.  

-- В браузере:
---- 1.
Войдите в аккаунт Google
Убедитесь, что вы скачали приложение из сервиса Google
<e-mail...>

Не выполняйте вход в приложение "Gemini Code Assist and Gemini CLI", если вы скачали его не из сервиса Google.
Если вы скачали приложение "Gemini Code Assist and Gemini CLI" из сервиса Google, оно может запросить повторный вход после недавнего обновления.
Если вы не уверены, что скачали приложение "Gemini Code Assist and Gemini CLI" из сервиса Google, вам следует удалить его.
---- 2.
authorization successful
You will now be redirected to Air"

-- В IDE Air
unable to log in with google
Feminy Code Assist for individuals: This client is no longer suppported for Geminy Code Assist for individuals.
To continue using Geminy, please migrate to the Antigravity suite of progects: https://antigravity.google

[Try Again]
```
* "API-KEY" - удалось.  Ключ сгенерировал на странице https://aistudio.google.com/api-keys
```text
Вбиваем ключ, нажимаем ОК.
Появляется предыдущее окно, но в нем подсвечен зеленым блок "Google API Key".

```

## Начало работы.

Тыкаем кнопку "Открыть папку".

Окно делится на 3 части, подобно IDE "Cursor".
* Слева - список чатов.
* Центр - текущий чат.
* Справа - дерево пректа.

В чате вбиваем PROMPT
```text
Просканируй директорию. О чем проект?
```
* "Geminy 3.1 Pro (Default)" - ошибка. Платная модель?
* "Geminy 3.6 Flash" - работает. Лимиты нормальные. Ответы нормальные.
* "Gemini 3.7 Flash" - работает. Лимиты быстро исчерпались. Ответы нормальные.
* "Gemini 3.1 Flash Lite" - работает.   
Качество не очень - делает не то, что просили.   
Возможно, причина в переключении с модели на модель (результате чего потрялся контекст).
UPD: Снова галлюцинирует. Заставил перечитать задачу. Ответ нормальный.