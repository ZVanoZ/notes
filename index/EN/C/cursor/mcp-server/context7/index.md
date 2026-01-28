# cursor: Context7

Информация об Context7 в связке с Cursor

---

## Ссылки 

Внутренние:
* [context7](../../context7) - Общая информация об Context7 без привязки к Cursor
* Geminy:
  * [Расскажи про Comntext7 MCP](geminy/tell-us-about-Comntext7-MCP.md)
  * [Как использовать Context7 в связке с "vanzan01/cursor-memory-bank"?](../cursor-memory-bank/github-vanzan01/geminy/how-to-use-Context7-in-conjunction-with-vanzan01_cursor-memory-bank.md)

Внешние:  
* https://github.com/upstash/context7
* AI RANEZ
  * [2025-04-29] Context7 - ЛУЧШИЙ MCP СЕРВЕР! | КАК РЕАЛЬНО УЛУЧШИТЬ РАЗРАБОТКУ В CURSOR
    https://www.youtube.com/watch?v=OE4F3SAz2zQ

---

## Установка(#install)

**Установка делается один раз и начинает работать после перезагрузки IDE во всех проектах.**

См. https://github.com/upstash/context7 раздел "Install in Cursor"
1. Идем в настройки.   
Settings -> Cursor Settings -> MCP -> Add new global MCP server.  
Откроется редактор файла "~/.cursor/mcp.json"  
2. Вставляем в него (mcp.json)
   * Для внешнего сервера
```json
{
    "mcpServers": {
        "context7": {
            "url": "https://mcp.context7.com/mcp",
            "headers": {
            "CONTEXT7_API_KEY": "YOUR_API_KEY"
        }
    }
    }
}
```
   * Для внутреннего сервера
```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp", "--api-key", "YOUR_API_KEY"]
    }
  }
}
```
   * **У меня так** ("Для внутреннего сервера" без API ключа)
```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp"]
    }
  }
}
```
3. Перезапускаем Cursor

---

## Использование.

1. Устанавливаем в Cursor плагин Context7 (единоразово).  <a id="install">см. #install</a>
2. В каждом prompt добавляем требование об использовании "Use Context7.".   
**Внимание! нужно использовать "context7" в том регистре, что в "~/.cursor/mcp.json"**
<details>
  <summary>демо ошибки</summary>

* Ошибка
```text
@Context7 Найди ID библиотеки "axios" и покажи описание.
```
```text
MCP error -32602: Input validation error: Invalid arguments for tool resolve-library-id: [
{
"code": "invalid_type",
"expected": "string",
"received": "undefined",
"path": [
"query"
],
```

* Правильно
```text
@context7 Найди ID библиотеки "axios" и покажи описание.
```
* Запрос 1
```json
{
  "server": "user-context7",
  "toolName": "resolve-library-id",
  "arguments": {
    "query": "Найди ID библиотеки axios и покажи описание",
    "libraryName": "axios"
  }
}
```
* Ответ 1
```json
{
  "status": "success",
  "results": [
    {
      "title": "Axios",
      "libraryId": "/axios/axios",
      "description": "Axios is a JavaScript library for making HTTP requests from the browser and Node.js, enabling seamless data fetching and API interactions.",
      "codeSnippets": 143,
      "sourceReputation": "Medium",
      "benchmarkScore": 68.3
    },
    {
      "title": "Axios",
      "libraryId": "/websites/axios-http",
      "description": "Axios is a promise-based HTTP client for the browser and Node.js that supports request/response interception, automatic data serialization, and cancellation.",
      "codeSnippets": 156,
      "sourceReputation": "High",
      "benchmarkScore": 54.3
    },
    {
      "title": "Axios",
      "libraryId": "/websites/axios-http_cn",
      "description": "Axios is a promise-based HTTP client library for making requests in both Node.js and browsers, supporting features like request/response interception, automatic data transformation, and request cancellation.",
      "codeSnippets": 67,
      "sourceReputation": "High",
      "benchmarkScore": 57.4
    },
    {
      "title": "axios-easy",
      "libraryId": "/greatauk/axios-easy",
      "description": "A modular TypeScript library extending Axios with composable interceptors and utilities to standardize HTTP request/response handling, offering plug-and-play solutions for authentication, error handling, and data processing in web applications.",
      "codeSnippets": 31,
      "sourceReputation": "High",
      "benchmarkScore": 88.7
    }
  ]
}
```

</details>



3. Отправляем запрос
```text
После этого выполнится цепочка:
* Запрос будет передан в Context7
* Context7 обратится к своей библиотеке документации и извлечет ту, что подходит для проекта (стадия: "Library" и "Documentation").
  Например, он извлечет из "package.json" зависимость "react": "^19.2.0" и подтянет документацию для этой версии.
  Каждый запрос нужно подтвердить. В чате будут сообщения вида: 
  - "Called MCP tool get_library_id"  
  - "Called MCP tool get_library_docs"  
* Context7 извлекает из документации разделы, которые нужны для решения задачи (стадия "Filters").
* Context7 обновит контекст используя скачанную документацию (Стадия "Inject"). 
При этом используется протокол MCP (Model Context Protocol).
* Запрос будет передан LLM.
* LLM сгенерирует ответ с учетом контекста, который был обновлен Context7.
```

---

## ...

---