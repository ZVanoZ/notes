-------------------------------------------------------------------------------
-- Полезные ссылки
-----

* https://www.jetbrains.com/help/phpstorm/date-formats-settings.html

Настройка формата даты.
-> File | Settings | Appearance and Behavior | System Settings | Date Formats for Windows and Linux
Полезно при копировании информации о коммитах в истории GIT.



* https://www.jetbrains.com/help/phpstorm/viewing-structure-of-a-source-file.html
  Source file structure
  Описывает инструмент "структура текущего файла"

* https://www.jetbrains.com/help/phpstorm/analyzing-data-flow.html#dataflowresults
  Analyzing data flow
  Этот инструмент позволяет увидеть в кратком виде, где объявлена переменная и где
  она переопределялась.

-------------------------------------------------------------------------------
-- Горячие клавиши
-- https://www.jetbrains.com/help/phpstorm/mastering-keyboard-shortcuts.html
-- https://www.jetbrains.com/help/phpstorm/viewing-structure-and-hierarchy-of-the-source-code.html
-----

* Build a type hierarchy
  Выводит иерархию текущего класса.
  ** KDE - "CTRL+H"

* Build a method hierarchy
  Устанавливаем курсор на метод, жмем комбинацию и получаем список классов, в
  которых переопределялся метод.
  Выводится все дерево наследования класса.
  Иконка с зеленым плюсиком означает чтьо в этом классе было переопределение
  метода.
  Иконка с красным минусом означает, что в этом классе метод не переопределялся.
  ** KDE - "Ctrl+Shift+H"

* Build a call hierarchy
  Удобно искать откуда вызывается метод.
  Долго сканирует проект, зато потом можно увидеть даже косвенные вызовы.
  Активно используется при рефакторинге.
  ** KDE - "Ctrl+Alt+H"

* переопределить метод.
  Выводит список методов текущего класса и родителей.
  При выборе из списка генерирует код с переопределением.
  ** KDE - "CTRL+O"

* имплементировать метод
  Выводит список методов, которые можно внедрить(напр.: "__construct"; "__get")
  ** KDE - "CTRL+I"

* поиск мест, где используется метод или класс.
  ** KDE - "CTRL+B"

* поиск мест, где используется метод или класс в области "Project Files"
  ** KDE - "CTRL+ALT+7"


-------------------------------------------------------------------------------
