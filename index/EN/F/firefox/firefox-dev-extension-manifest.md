# About

Описание манифеста для расширения


## manifest.json

* content_scripts
```text
Описание скриптов, который внедряется в загружаемые страницы.
Скрипты имеют прямой доступ к содержимому загруженной страницы.
Оющаются с фоновым скриптом через события. 
```
* background
```text
Описание фонового скрипта расширения.
Этот скрипт запускается в единственном экземпляре на всех вкладках браузера.
Он не имеет прямого доступа к контенту вкладок.
Общается с content_scripts через события
```
* browser_action  
см. "Кнопка в панели инструментов" https://developer.mozilla.org/ru/docs/Mozilla/Add-ons/WebExtensions/user_interface/Toolbar_button
```text
Опция "browser_action" в файле manifest.json определяет значок, который будет отображаться на панели инструментов браузера. 
Это основной способ взаимодействия пользователя с расширением. 
Когда пользователь нажимает на этот значок, происходит действие, которое вы определите.
```

### content_scripts

Загружает список скриптов в страницу, если URL страницы найден в "content_scripts.matches"

```json
{
  "content_scripts": [
    {
      "matches": [
        "*://*.auto.ria.com/*"
      ],
      "js": [
        "content_scripts/index.js"
      ]
    }
  ]
}
```

### background


```json
{
  "background": {
    "scripts": [
      "background/index.js"
    ]
  }
}
```

### browser_action


* browser_action.default_icon

Путь к значку, который будет отображаться на панели инструментов.
Вы можете указать несколько размеров, чтобы браузер мог выбрать наиболее подходящий.

* browser_action.default_title

Текст, который появляется в виде всплывающей подсказки, когда
пользователь наводит курсор на значок расширения.

* browser_action.default_popup

Определяет действие при нажатии на кнопку.

Возможны два способа реакции на нажатие кнопки:
1. отправка события в background script расширения.  
В этом случае поле browser_action.default_popup не указывается.  
Событие отправляется браузером автоматически и его нужно перехватить в background скрипте.
Событие НЕ ГЕНЕРИРУЕТСЯ, если выбран режим 2 (в манифесте сконфигурирован browser_action.default_popup)
см. пример ниже
2. отображение всплывающего окна  
В этом режиме нужно сконфигурировать поле browser_action.default_popup 
см. пример ниже 
   
---

* Пример для режима "При клике отправить событие в background"

см:  
https://github.com/mdn/webextensions-examples/blob/master/bookmark-it/  
https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/API/browserAction  
https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/API/browserAction/onClicked  


**manifest.json**
```json
{
  "browser_action": {
    "default_icon": "icons/app-icon-38.png",
    "default_title": "Test action"
  },

  "background": {
    "scripts": ["background.js"]
  }
}
```

**Напрямую из скрипта "background" вы не можете получить доступ к DOM текущей вкладки.**

**background.js**
```js
function myListener(tab, data) {
    //.. при клике будет выполнен этот код
    // в аргумент tab попадет базовая информация об активной вкладке. !!! контент недоступен !!!
    console.log('tab.url', tab.url);       // tab.url https://auto.ria.com/uk/
    console.log('tab.title', tab.title);   // tab.title AUTO.RIA™ — Автобазар №1, купити та продати перевірене авто легко!
    console.log('tab.status', tab.status); // tab.status complete
}
browser.browserAction.onClicked.addListener(myListener); 
```

---

* Пример для режима "При клике показать всплывающее окно"

см. https://github.com/mdn/webextensions-examples/tree/master/beastify

```json
{
  "browser_action": {
    "default_icon": "icons/car-sale/32x32.png",
    "default_title": "auto-ria helper",
    "default_popup": "browser_action/popup/index.html"
  }
}
```

browser_action.default_popup - Путь к HTML-файлу, который будет открываться в маленьком 
всплывающем окне (popup) при нажатии на значок. 

Это очень распространённый способ, чтобы предоставить пользователю простой 
интерфейс для настройки или выполнения действий.

**Напрямую из скрипта "browser_action/popup/index.html" вы не можете получить доступ к DOM текущей вкладки.**

Скрипт всплывающего окна (popup) выполняется в изолированном контексте. 
Он имеет доступ к API расширений, но не к содержимому веб-страницы. Это сделано в целях безопасности, 
чтобы предотвратить несанкционированный доступ к данным на странице.
Для получения доступа к DOM текущей вкладки нужно загрузить "content_scripts" и установить с ним связь через события.

Например:
1. Скрипт в "browser_action/popup/index.html" отправляет событие "getContent"   
???во все открытые вкладки браузера|или в текущую активную???.
```js
// Отправляем сообщение сценарию содержимого
browser.tabs.query(
    {
        active: true, 
        currentWindow: true
    }
).then(
    (tabs) => {
        browser.tabs.sendMessage(
            tabs[0].id, 
            {
                command: "getContent"
            }
        ).then(
            (response) => {
                // Обработка ответа от сценария содержимого
                console.log(response.content);
            }
        );
    }
);
```
2. Скрипт "content_scripts/index.js"  
Ловит все сое события и отвечает только на "getContent"
```js
// Слушаем сообщения от popup.html
browser.runtime.onMessage.addListener(
    (request, sender, sendResponse) => {
        if (request.command === "getContent") {
            // Получаем заголовок страницы
            const pageTitle = document.title;
            // Отправляем ответ обратно в popup.html
            sendResponse({content: pageTitle});
        }
    }
);
```
