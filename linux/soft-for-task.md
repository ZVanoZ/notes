# [soft-for-task.md](soft-for-task.md)

Выбор ПО под задачу

## Просмотр файлов в HEX режиме

Зачем?:
* При формировании XLS в PHP с выводом warning полученные файлы поломаны.  
Нужна простая утилита для просмотра.  
Выбор: Ghex  
* Иногда встречаются непонятные файлы.  
Чтобы понять тип файла, нужно смотреть содержимое.  
Выбор: Ghex, wxHexEditor

**Для GUI**
```text
Название     : Описание                                             
-------------:----------------------------------------------------------
Ghex         : https://wiki.gnome.org/Apps(2f)Ghex.html
             : Простой просмотрщик. Вероятно, используется в doublecmd.
             : ~496 MB.
             :
wxHexEditor  : https://www.wxhexeditor.org/
             : https://github.com/EUA/wxHexEditor
             : Навороченный HEX редактор с яркой цветной подсветкой.
             : Предназначен для работы с большими файлами.  
             : В исходниках!  GPL-2.0 license 
             :
Okteta       : https://apps.kde.org/ru/okteta/
             : HEX редактор
             :
Bless        : https://community.linuxmint.com/software/view/bless
             : https://www.thinkpenguin.com/gnu-linux/bless-hex-editor
             : https://github.com/afrantzis/bless
             : Простой HEX редактор
             : В исходниках! GPL-2.0 license 
             :
```
**Для консоли**
```text
Команда      : Описание                                             
-------------:----------------------------------------------------------
xxd          : Xxd Hex Editor 
             :
hexedit      : Hexedit Hex Editor
             :
hexyl        : Hexyl Hex Editor
             :
рexcurse     : Hexcurse — Conx Hex Editor
             : на основе ncurses
             :
рexer        : Hexer Binary Editor
             :
```

* RU, 2024-12-06 [Gemini](https://g.co/gemini/share/7c7b69ec9cce)
Есть ли в linux графическая программа для просмотра файлов в шестнадцатиричном формате?
* RU, 2022-05-11 [Лучшие hex-редакторы для Linux](https://blog.sedicomm.com/2019/05/11/luchshie-hex-redaktory-dlya-linux/)

## Замена powergrep

https://www.powergrep.com/

@TODO: провести анализ альтернатив.
