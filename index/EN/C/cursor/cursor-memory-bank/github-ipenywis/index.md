# Из "github:ipenywis" проект "ipenywis/aimemory"

Этот вариант предполагает установку расширения VSCode.

Смотри: 
* https://github.com/ipenywis/aimemory
* https://github.com/ipenywis/aimemory/blob/main/src/lib/rules/memory-bank-rules.md   
  Это и есть документация к реализации «Memory Bank» для Cursor от "ipenywis/aimemory".

## Установка расширения

1. Через "Cursor Extension Panel" (рекомендуемый способ)


Расширение в marketplace: https://marketplace.visualstudio.com/items?itemName=CoderOne.aimemory

```text
* Открыть Cursor
* Перейти в Extensions view (Ctrl+Shift+X / Cmd+Shift+X)
* Выполнить поиск "AI Memory"
@TODO: разобраться. Выпадает большой список расширений VSCode и непонятно какое устанавливать/ 
* Нажать "Install"
```
2. Из VSIX файла (альтернативный способ)

```text
* Загружаем файл
https://github.com/Ipenywis/aimemory/releases
* В Cursor, открываем Command Palette (Ctrl+Shift+P / Cmd+Shift+P)
* Запускаем "Extensions: Install from VSIX..." и выбираем загруженный файл
```

3. Копипаст правил с github
```text
См. видео Memory Bank - LLM БОЛЬШЕ НЕ ЗАБЫВАЕТ!
https://youtu.be/8R8w_yWLDPs?t=349
Позиция 05:49
```

## Инициализация в проекте

Если устанавливали расширение:
```text
* Открываем в Cursor проект или папку
* Открываем Command Palette (Ctrl+Shift+P / Cmd+Shift+P)
* Вносим текст "Start MCP" и нажимаем ENTER
```

Если копировали правила вручную
```text
* Открывыем чат AI
* Вносим текст "Initialize memory bank" и нажимаем RUN
```

Результат инициализации
```text
1. Создаст папку "memory-bank" в рабочем корне проекта (если не существует).
В этой папке создаст 6 основных файлов.
2. Запустит "MCP server" (default port: 7331, fallback: 7332)
3. Автоматически обновит Вашу конфигурацию "Cursor MCP configuration" для соединения к "MCP server"
```

## Использование

@TODO: разобраться и описать

??? Для использования расширения нужно вбивать команды в <хз-где>  

## Структура файлов

**Классическая, с минимальным набором файлов**

<project>/memory-bank/*.md
1. projectbrief.md:     Глобальная цель проекта. Что мы строим и для кого?
    <details>
      <summary>например</summary>
   
      ```md
      Проект для проксирования DNS-запросов.
      Получает DNS запрос от клиента, анализирует и перенаправляет конечному DNS-серверу.
      ```
    </details>
2. productContext.md:   Почему этот проект существует, какие проблемы решает и как должен работать пользовательский опыт.
    <details>
      <summary>например</summary>
   
      ```md
      @TODO
      ```
    </details>
3. systemPatterns.md:   Техническая архитектура, паттерны проектирования, выбранные библиотеки и стандарты кода.
    <details>
      <summary>например</summary>

      ```md
      Предпочитать объектно ориентированный подход.
      Разрешен функциональный подход для unit-тестов
      ```
    </details>
4. techContext.md:      Стек технологий, версии зависимостей, особенности настройки среды.
    <details>
      <summary>например</summary>

      ```md
      Базируется на NodeJS ^20. 
      Язык TypeScript.
      ```
    </details>
5. activeContext.md:    Самый важный файл. Что происходит прямо сейчас? Над какой фичей мы работаем? Какие есть проблемы?
    <details>
      <summary>например</summary>

      ```md
      Покрытие кода unit-тестами.
      ```
    </details>
6. progress.md:         Список выполненных задач и план на будущее (Roadmap).
    <details>
      <summary>например</summary>

      ```md
      1. [+] Написание базового функционала
      2. [ ] Создание Unit-тестов
        1. [+] Создание окружения для тестирования
        2. [+] Тест на доступность DNS-сервера
        3. [ ] Тест на устойчивость под нагрузкой 
      ```
    </details>

---

## Алгоритм работы

см. https://github.com/ipenywis/aimemory/blob/main/src/lib/rules/memory-bank-rules.md


---

...