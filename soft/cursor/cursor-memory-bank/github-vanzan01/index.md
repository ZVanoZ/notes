# Из https://github.com/vanzan01/cursor-memory-bank

@see: https://github.com/vanzan01/cursor-memory-bank/blob/ea4c04f847c3051d7172572935cabab6dfc321df/README.md

## Ссылки

* Домашняя
  * Сам проект (базовые *.md файлы и описание).  
    https://github.com/vanzan01/cursor-memory-bank
  * Блог    https://blog.vanzan01.org/
* [2025-06-05] Cursor Memory Bank - ЛУЧШИЙ ИНСТРУМЕНТ ДЛЯ КУРСОРА!  
  https://www.youtube.com/watch?v=RxEc1cIEVp8
* ...

## Структура

**Memory Bank System v0.8**

Структура каталогов в виде дерева
```text
<project-root>/
|>.cursor/
| |>commands/
| | |>archive.md
| | |>build.md
| | |>creative.md
| | |>plan.md
| | |>reflect.md
| | |>van.md
| | 
| |>rules/
|   |>isolation_rules/
|     |>Core
|     | |>*.mdc
|     |>Level1/
|     | |>*.mdc
|     |>Level2/
|     | |>*.mdc
|     |>Level3/
|     | |>*.mdc
|     |>Level4/
|     | |>*.mdc
|     |>Phases/
|     | |>*.mdc
|     |>visual-maps/
|     | |>*.mdc
|     |>main.mdc
|     
|>optimization-journey/
|>memory-bank/
  |>archive/
  | |>*.md
  |>creative/
  | |>*.md
  |>reflection/ 
  | |>*.md
  |>*.md 

```

Назначение каталогов
```text
  "<project-root>/.cursor/*" 
!Не меняем! 
Служебные файлы, скопированные из "vanzan01/cursor-memory-bank/.cursor"


  "<project-root>/optimization-journey/"
@TODO: разобраться

  "<project-root>/memory-bank/"
1. Правила для проекта, которые указывает пользователь.
2. Файлы, генерируемые системой "memory-bank".

```

---

...