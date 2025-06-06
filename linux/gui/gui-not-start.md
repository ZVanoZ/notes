* Суть проблемы

Внезапно после перезагрузки системы пропал графический интерфейс.
Появилась консоль с предложением авторизации.
Авторизация успешна.
При вызове команды startx появляется графический интерфейс.

* Вводная информация

см. [x-window.md](../x-window/x-window.md)

В основе графического интерфейса лежит Xorg.

См. [Topic 106: User Interfaces and Desktops/106.1 Install and configure X11/106.1 Lesson 1](https://learning.lpi.org/en/learning-materials/102-500/106/106.1/106.1_01/)

Поверх Xorg работают оконные менеджеры типа: GNOME; KDE; XFCE, MATE, LXDE, Cinnamon,...
Графические окружения предоставляют пользователю привычный интерфейс с окнами, меню, 
иконками и другими элементами. 
Они основаны на Xorg и предоставляют различные наборы приложений и настроек.

Диспетчеры входа - это программы, которые отвечают за отображение экрана входа в систему и запуск выбранной пользователем сессии (графического окружения).
GDM     - Gnome Display Manager
          Диспетчер входа, который используется по умолчанию в большинстве дистрибутивов на базе GNOME.
LightDM - Light Display Manager
        Более легкий и гибкий диспетчер входа, который поддерживает множество графических сред.

* Причина
  Битая ссылка.
  Проверяем командой
  ```shell
  # Файл должен вести на один из "/lib/systemd/system/*.service"
  ls -la /etc/systemd/system/display-manager.service

  # В моем случае это "/lib/systemd/system/gdm3.service"
  # Он отсутствует в "/lib/systemd/system/"
  ls -la /lib/systemd/system | egrep ".*gdm.*\.service"
  ```
  * Чтобы разобраться, почему так произошло, нужно покопаться в конфигах и логах
  ```shell
  ls -la /etc/gdm3/
  cat /etc/gdm3/daemon.conf 

  sudo journalctl -xe
  ```

# Исправление

Я не стал разбираться в первопричине.
Вместо "gdm3" включил "lightdm" и все заработало.
```text
# Отключаем автозапуск "gdm3" 
systemctl disable gdm3

# Убираем битую ссылку 
unlink /etc/systemd/system/display-manager.service

#  Отключаем автозапуск "lightdm" вместо "gdm3"
systemctl enable lightdm

# Проверяем куда ведет ссылка
ls -la /etc/systemd/system/display-manager.service

# Перезагружаем систему
reboot
```