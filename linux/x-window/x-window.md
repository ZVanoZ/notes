# Ссылки

* [Linux Professional Institute](https://learning.lpi.org/uk/)
  * UA [Розділ 106: Інтерфейси користувача та робочі столи](https://learning.lpi.org/uk/learning-materials/102-500/106/)
  * EN [Topic 106: User Interfaces and Desktops/106.1 Install and configure X11/106.1 Lesson 1](https://learning.lpi.org/en/learning-materials/102-500/106/106.1/106.1_01/)


# Кратко своими словами

1. Ядро Linux при помощи драйверов взаимодействует с устройствами ввода-вывода (дисплей, клавиатура, мышь и т.д.).
2. Поверх ядра Linux запущен процесс "X-Server".
   "X-Server" получает информацию от ядра (нажатие клавиш; положение мыши).
   "X-Server" может передавать ядру графику для вывода на дисплее.
   "X-Server" может открыть сокет для доступа из сети.
   "X-Server" может загружать "Xorg Extensions"
3. Есть так называемые "X client".
   "X client" это приложения, которые могут быть запущены как на компьютере с "X-Server", так и за его пределами на
   других компьютерах.
   "X client" для рисования окошек использует графические библиотеки типа GTK+ и Qt.
   Графические библиотеки через библиотеки "Xlib" или "xcb" взаимодействуют с "X-Server".
   "X client" подключается к "X-Server" одним из способов:
    1. ??? Напрямую (процесс запускается одновременно с "X-Server") ???
       Это как-то связано с "Display Manager" и авторизацией.
       "Display Manager" может взаимодействовать с "X-Server" по сети.
    2. Локально по "X11 Protocol" через "Xorg Extensions".
        1. "Window Manager"/"Desktop Environment"
        2. "Web Browser" - @TODO: разобраться.
    3. По сети
       1. "X client" Linux
       2. "X client" другой ОС
