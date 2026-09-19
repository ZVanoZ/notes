# "jetbrains.md"

---

* Вопрос
Как в PhpStorm при сравнении каталогов инструментом "Diff Tool" указать фильтр по нескольким маскам?

* Ответ
Следует разделять маски символами "&" и "|"

* Пример: сравнить все, кроме каталогов  ".idea", "data", "dev", "tests"

```text
!.idea/* &  !data/* &  !dev/* &  !tests/*

!.idea/* & !*tmp/* & !*data/* & !*public/cache/* & !node_modules/*  & !*vendor/*
```

* Пример: сравнить только каталоги "application", "library"

```text
application/* | library/*
```

* Другое ...

```text
# tpl-back-app
!.idea/* & !*tmp/*& !*logs/*.log   & !node_modules/*  & !*vendor/*

# tpl-front-components
!.idea/* & !*tmp/*& !*logs/*.log   & !node_modules/*  & !*app/vendor/*  & !*build/cache/*
```

---

* Вопрос
Почему PhpStorm переходит на связанный файл в той же вкладке и как это изменить?
Т.е. в дереве файлов делаем двойной клик по файлу, а он в редакторе заменяет текущую вкладку.

* Ответ
  
```text
Для версии PhpStorm-2024.*  

Снимаем галку с опции.
Settings/Advanced Settings/Editor Tabs/When navigating to a file, prefer selecting existing tab in inactive split pane
Примечание: иногда помогает, иногда нет. Для исправления ставим галку жмем "apply", а потом снимаем галку и снова жмем "appply".
```
---

* Вопрос
Почему в PhpStorm при одинарном клике по файлу в дереве проекта этот файл открывается в редакторе?
Как сделать, чтобы файл открывался в редакторе по двойному клику?

* Ответ
```text
Для версии PhpStorm-2024.*
  
В дереве проекта, в правом верхнем углу иконка с троеточием.
"Behaviour/Enable Preview Tab" - снимаем галку.
```

---



* Вопрос
  Как в PhpStorm изменить подсветку активной вкладки редактора

* Ответ
```text
Для версии PhpStorm-2024.*
  
1. Settings/Editor/Color Scheme/Feneral
2.1. Editor/Tabs/Selected Tab
Background - [9A9797] - задает цвет фона в активной вкладке.
2.2. Editor/Tabs/Underline
Background - [F0F1F3] - задает цвет линии под активной вкладкой. 
```

---

* Вопрос

```text
В редакторе markdown через CTRL нажимаю на ссылку.
Файл открывается в той же вкладке.
Ожидаю что окткроется новая вкладка.

```

* Ответ

```text
Такое поведение — классический сценарий работы встроенного механизма Preview Tab (Вкладки предпросмотра) в IDE от JetBrains.

Варианты решения:

1. Отключить режим "Preview Tab" для текущей вкладки.
Для этого нужно нажать крестик рядом с надписью "Preview Mode" в правом верхнем углу вкладки.

2. Отключить режим "Preview Tab" в настройках IDE.
2.1. Нажмите Ctrl + Alt + S (Settings) -> Editor -> General -> Editor Tabs.
2.2. В блоке Opening Policy снимите галочку с Enable Preview Tab.
```


---
