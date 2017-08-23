#!/bin/bash
cd $(dirname $(readlink -e $0)) #переход в директорию текущего скрипта
echo 'workDir='`pwd` # вывод текущего пути
sudo ./myApplication.elf # запуск приложения "myApplication.elf" из текущего каталога в режиме администратора
exit 0 #Выход с кодом 0 (удачное завершение работы скрипта)
