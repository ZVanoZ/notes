# Context7

Общая информация об Context7 без привязки к IDE

---

## Ссылки 

Внутренние: 
* [сontext7](../cursor/%D1%81ontext7) - Информация об Context7 в связке с Cursor

Внешние:
* Домашняя https://context7.com/

---


## Примеры контекстов

* *"Ext JS 3.4.0"* https://context7.com/websites/sencha_extjs_3_4_0
* *Material UI* https://context7.com/websites/v5_mui_material-ui

---

## Получение токена

1. Регистрируемся на https://context7.com (выбираем план FREE).
Этот план дает 1000 запросов
2. Идем в  dashboard https://context7.com/dashboard
3. Ищем раздел "API Keys" и жмем кнопку "Create API Key...".
4. Вбиваем "API Key Name (optional)" (напр. "education-key") и жмем кнопку "Create API Key".
```text
Появится окошко с полем "API Key": [......]
Копируем это значение и сохраняем у себя.
```
5. Жмем "Done"


---

## Проверка работоспособности ключа 

1. Выполняем команду **подставив свой ключ вместо YOUR_API_KEY**  
```sh
claude mcp add --transport http context7 https://mcp.context7.com/mcp \
--header "CONTEXT7_API_KEY: ${YOUR_API_KEY}"
```
2. Получим JSON вида:
<details>
  <summary>фрагмент...</summary>

```json
{
  "results": [
    {
      "id": "/websites/nextjs",
      "title": "Next.js",
      "description": "Next.js is a React framework for building full-stack web applications. It provides additional features and optimizations, automatically configuring lower-level tools to help developers focus on building products quickly.",
      "branch": "main",
      "lastUpdateDate": "2026-01-19T15:46:37.999Z",
      "state": "finalized",
      "totalTokens": 642761,
      "totalSnippets": 4960,
      "stars": -1,
      "trustScore": 10,
      "benchmarkScore": 83.5,
      "versions": [],
      "score": 0.8437516,
      "vip": true,
      "verified": false
    },
    {
      "id": "/vercel/next.js",
      "title": "Next.js",
      "description": "Next.js enables you to create full-stack web applications by extending the latest React features and integrating powerful Rust-based JavaScript tooling for the fastest builds.",
      "branch": "canary",
      "lastUpdateDate": "2026-01-27T07:33:02.288Z",
      "state": "finalized",
      "totalTokens": 575079,
      "totalSnippets": 2136,
      "stars": 131745,
      "trustScore": 10,
      "benchmarkScore": 92.9,
      "versions": [
        "v14.3.0-canary.87",
        "v13.5.11",
        "v15.1.8",
        "v15.4.0-canary.82",
        "v12.3.7",
        "v11.1.3",
        "v16.0.3",
        "__branch__01-02-copy_58398",
        "v16.1.0",
        "v16.1.1",
        "v15.1.11",
        "v16.1.5"
      ],
      "score": 0.78336734,
      "vip": true,
      "verified": false
    }
  ]
}
```

</details>

3. В [dashboard](https://context7.com/dashboard) значение поля Requests увеличится на 1.  

---


