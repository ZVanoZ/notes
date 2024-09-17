````text
--------------------------------------------------------------------------------
-- Заметки о полезном софте
-- ABCDEFGHIJKLMNOPQRSTUVWXYZ
--------------------------------------------------------------------------------
-- Ссылки.
* https://www.opennet.ru/docs/RUS/LinuxShort/#h114-8
2.1 Основные пользовательские утилиты

--------------------------------------------------------------------------------
````

* [A] ABCDEFGHIJKLMNOPQRSTUVWXYZ
  * awk
````text
--------------------------------------------------------------------------------
-- [A] ABCDEFGHIJKLMNOPQRSTUVWXYZ

[awk]
Внутренняя.
Связанные команды: 

Описание: awk - это утилита/язык для извлечения данных. 
Для выполнения различных практических задач по обработке текста awk часто 
используется совместно с sed.
В зависимости от поставленной задачи вы можете использовать либо awk, либо Perl, 
хотя это в большей степени зависит от личных предпочтений. 
Как и sed, awk читает за один раз одну строку, выполняет определенные действия в 
зависимости от заданных опций, и выводит результат. 
Одним из самых простых и популярных способов использования awk является выбор 
столбца из текстового файла или из вывода другой команды.

Ссылки:
* http://rus-linux.net/MyLDP/consol/awk.html
Изучаем команды linux: awk
* http://dbserv.pnpi.spb.ru/~shevel/Book/node72.html
9.5 Встроенные функции языка awk

Примеры
* Поиск подстроки в строке
Ищем "-key2-" в "-key1-key2-key3-". Результат - найдено в позиции 7.
$ echo | awk '{print match("-key1-key2-key3-", "-key2-")}'
7
Ищем "-key0-" в "-key1-key2-key3-". Результат - не найдено.
$ echo | awk '{print match("-key1-key2-key3-", "-key0-")}'
0
$ echo | awk '{print index("-key1-key2-key3-", "-key2-")}'
7
````

* [B] A BCDEFGHIJKLMNOPQRSTUVWXYZ
````text
--------------------------------------------------------------------------------
-- [B] A BCDEFGHIJKLMNOPQRSTUVWXYZ
-------

[base64]
Внутренняя.
Связанные команды:
Описание: Кодирует-декодирует данные  используя формат BASE4

См.  linux/soft/base64.txt

-------

[bc]
Внутренняя.
Связанные команды:
Описание: консольный калькулятор.

-------

[bg]
Внутренняя.
Связанные команды: jobs, fg

Команда bg отправляет задачу в фоновый режим.
Либо — запустить её в обычном режиме, после чего нажать комбинацию ctrl+Z, 
отправив ей сигнал TSTR. 
Подробнее о сигналах — в статье Linux&FreeBSD: команды kill, 
nohup — сигналы и управление процессами. 
После этого — она появится в списке jobs с новым номером
$ tar cpf usr.lib.tar usr/lib 2>/dev/null
# ^Z
# 3
# [8]+  Stopped                 tar cpf usr.lib.tar usr/lib 2> /dev/null
````

---

* [C] ABC DEFGHIJKLMNOPQRSTUVWXYZ
````text
--------------------------------------------------------------------------------
-- [C] ABC DEFGHIJKLMNOPQRSTUVWXYZ
-------

[cat]

Вывод файла на экран
Ссылки:
Примеры:
$ cat /proc/loadavg
````

---

* chsh

НАЗВАНИЕ
chsh - изменяет регистрационную оболочку пользователя

СИНТАКСИС
chsh [параметры] [УЧЁТНАЯ_ЗАПИСЬ]


````shell
chsh --help
man chsh
````
````shell
chsh -s /bin/bash www-data
````

---

* [D] ABCD EFGHIJKLMNOPQRSTUVWXYZ
````text
--------------------------------------------------------------------------------
-- [D] ABCD EFGHIJKLMNOPQRSTUVWXYZ
-------

[diffuse]
Внешняя.
Связанные команды:

Графическая утилита для сравнения текстовых файлов. 

$ sudo apt install diffuse

Использование:

Удобно сравнивать исходники и конфиги.
Например:
1. Копируем оригинальный конфиг "/etc/squid/squid.conf"  в файл 
с именем "@orig.squid.conf". 
2. В "squid.conf" удаляем все закомментированные строки кроме 
разделов. Добавлям свои строчки конфигов.
3. В случае, когда нужно почитать описание опций и какие опции 
есть в разделе, запускаем сравнение в meld.
/etc/squid$ diffuse squid.conf @orig.squid.conf

-------

[df]

$ df --help
Использование: df [ПАРАМЕТР]… [ФАЙЛ]…
Показывает сведения о файловой системе, на которой расположен каждый
из ФАЙЛОВ, или, по умолчанию, обо всех файловых системах.

Показывает табличку с информацией об использовании дисков.

  -h, --human-readable    выводить размеры в степени 1024
                          (например, 1023M)
$ df -h
Файловая система       Размер Использовано  Дост Использовано% Cмонтировано в
udev                      12G            0   12G            0% /dev
tmpfs                    2,4G         2,4M  2,4G            1% /run
/dev/sde1                109G          21G   83G           21% /
tmpfs                     12G          17M   12G            1% /dev/shm
tmpfs                    5,0M         4,0K  5,0M            1% /run/lock
/dev/sda1                932G         879G   53G           95% /mnt/zim1tb.data
/dev/sdc1                299G         114G  185G           39% /mnt/zim320g.win
/dev/sdd1                1,8T         1,1T  666G           62% /mnt/dio2tb
tmpfs                    2,4G         6,4M  2,4G            1% /run/user/1000
/dev/sdf                  15G          14G  983M           94% /media/ivan/zim16g

  -a, --all               включать фиктивные, дублированные, недоступные
                          файловые системы
$ df -a
Файловая система        1K-блоков Использовано  Доступно Использовано% Cмонтировано в
sysfs                           0            0         0             - /sys
proc                            0            0         0             - /proc
nsfs                            -            -         -             - /run/docker/netns/1968b6936dd7

-------
[dmesg]

$ dmesg  --help
Display or control the kernel ring buffer.

# Запускаем мониторинг событий уровня ядра
# -w, --follow                wait for new messages
# -T, --ctime                 show human-readable timestamp (may be inaccurate!)
$ sudo dmesg -wT
Выводит информацию о подключении/отключении устройств и ошибках в работе.
Весьма полезно, когда нужно выяснить что за хрень творится в системе.

[dpkg]
# Утилита для установки deb-пакетов.

# Вывод информации об архитектуре процессора.
$ dpkg --print-architecture
amd64


[dpkg-reconfigure]
Внутренняя.
Связанные команды:

dpkg-reconfigure - перенастраивает заново уже установленный пакет

--
# Управление доверенными CA-сертификатами.
# В Ubuntu сканирует каталог "/usr/share/ca-certificates" и ищет в нем файлы "*.crt" 
# После этого выдает консольное диалоговое окно, в котором можно отметить сертификаты.
$ sudo dpkg-reconfigure ca-certificates
````

* [E] ABCDE FGHIJKLMNOPQRSTUVWXYZ
````text
--------------------------------------------------------------------------------
-- [E] ABCDE FGHIJKLMNOPQRSTUVWXYZ
-------

[expr]
Внутренняя.
Связанные команды: 

Описание: 

Ссылки:
* http://www.gnu.org/software/coreutils/manual/html_node/expr-invocation.html#expr-invocation

Примеры:
* Вычислить выражение
$ expr 1 + 2
3
* Вывод количества символов в строке
$ expr 'abcd' : '.*'
4
* Сравнение чисел
1 - true
0 - false
$ expr 5 \> 1
1
$ expr 5 \> 5
0
$ expr 5 \> 7
0
$ expr 5 \!= 7
1
$ expr 5 \!= 5
0
````

* [F] ABCDEF GHIJKLMNOPQRSTUVWXYZ
````text
--------------------------------------------------------------------------------
-- [F] ABCDEF GHIJKLMNOPQRSTUVWXYZ
-------

[find]
Поиск файлов м папок.

-- Ищет в субдиректориях "~" файлы и папки по маске "*agent*.jar" с учетом регистра
find ~ -name *agent*.jar

-- Ищет в субдиректориях "~" файлы и папки по маске "*agent*.jar" без учета регистра
find ~ -iname *agent*.jar

-- найти файлы
find ~ -type f -iname *cache*
-- найти директории
find ~ -type d -iname *cache*

[fg]
Внутренняя.
Связанные команды: jobs, bg 

Что бы вывести задачу из фонового режима — используется команда fg (foreground), которой можно 
либо передать номер задачи в качестве аргумента, либо — запустить без аргументов. 
В последнем случае — будет выведена задача, отмеченная знаком + в списке jobs, 
т.е. — последняя отправленная «в фон» задача.
````

* [G] ABCDEFG HIJKLMNOPQRSTUVWXYZ
````text
--------------------------------------------------------------------------------
-- [G] ABCDEFG HIJKLMNOPQRSTUVWXYZ
-------

[glances]
?Внутренняя. 20200812 уже не внутренняя в "4.15.0-112-generic #113-Ubuntu"
Связанные команды:

В консоли в виде таблицы отображает информацию о загрузке системы.
Использование CPU (пользователь, система, ожидание).
Использование сети по интерфейсам.
Использование диска по точкам монтирования.

$ sudo apt install glances

Ссылки:
https://www.tecmint.com/understand-linux-load-averages-and-monitor-performance/

Примеры:
$ glances

````

* [H] ABCDEFGH IJKLMNOPQRSTUVWXYZ
````text
--------------------------------------------------------------------------------
-- [H] ABCDEFGH IJKLMNOPQRSTUVWXYZ
-------

[hexdump]
Внутренняя.
Связанные команды:

Позволяет просматрифайть файлы в шестнадцатиричном виде

-- Например, можно заглянуть внутрь бинарного JPG-файла
$ hexdump /~/images/myImage.jpg
0000000 d8ff e0ff 1000 464a 4649 0100 0101 6000
0000010 6000 0000 dbff 4300 0500 0404 0404 0503
0000020 0404 0604 0505 0806 080d 0708 0807 0b10
...

-------
````

* [I] ABCDEFGHI JKLMNOPQRSTUVWXYZ
````text

--------------------------------------------------------------------------------
-- [I] ABCDEFGHI JKLMNOPQRSTUVWXYZ
-------

[id]
Выводит информацию о пользователе.

$ id --help
Использование: id [ПАРАМЕТР]… [ПОЛЬЗОВАТЕЛЬ]…
Print user and group information for each specified USER,
or (when USER omitted) for the current process.

  -a              игнорируется, для совместимости с другими версиями
  -Z, --context   вывести только контекст безопасности процесса
  -g, --group     вывести только действующий ID группы
  -G, --groups    вывести все ID групп
  -n, --name      вывести имя вместо номера, для параметров -ugG
  -r, --real      вывести действительные, а не действующие ID, для -ugG
  -u, --user      вывести только действующий ID пользователя
  -z, --zero      разделять записи символами NUL, а не пробельными;
                  не допускается для формата по умолчанию
      --help        display this help and exit
      --version     output version information and exit

$ id -g
1000

$ id -u
1000

[ifconfig]

$ ifconfig | grep 172.17.0.1 -A 6 -B2


[iostat]
Внутренняя.
Связанные команды:

Консольная утилита.
Показывает статистику по нагрузке на диски.

Установка:
$ sudo apt install sysstat
Запуск:
$ iostat -x -t -m 5

-------
````

* [J] ABCDEFGHIJ KLMNOPQRSTUVWXYZ
````text
````

* [K] ABCDEFGHIJK LMNOPQRSTUVWXYZ
````text
````

* [L] ABCDEFGHIJKL MNOPQRSTUVWXYZ
````text
--------------------------------------------------------------------------------
-- [L] ABCDEFGHIJKL MNOPQRSTUVWXYZ
-------

[ln]
Внутренняя.
Связанные команды: unlink

Создает  символическую ссылку.

-- Например: Для папки "inp-dir-for-link" создать символическую ссылку "linked-dir".
$ ln -s /mnt/dio-zim-1tb/links/link.var.www/inp-dir-for-link/ /var/www/linked-dir

$ ln --help
Использование: ln [ПАРАМЕТР]… [-T] ЦЕЛЬ ИМЯ_ССЫЛКИ
  или:  ln [ПАРАМЕТР]… ЦЕЛЬ
  или:  ln [ПАРАМЕТР]… ЦЕЛЬ... КАТАЛОГ
  или:  ln [ПАРАМЕТР]… -t КАТАЛОГ ЦЕЛЬ…
В первой форме создаётся ссылка на ЦЕЛЬ с указанным ИМЕНЕМ_ССЫЛКИ.
Во второй форме создаётся ссылка на ЦЕЛЬ в текущем каталоге.
В третьей и четвёртой формах создаются ссылки на каждую ЦЕЛЬ в КАТАЛОГЕ.
По умолчанию создаются жёсткие ссылки, а с параметром --symbolic — символьные.
По умолчанию, каждая цель (имя новой ссылки) не должна существовать.
При создании жёстких ссылок каждая ЦЕЛЬ должна существовать.
Символьные ссылки могут содержать произвольный текст; при разыменовании
относительная ссылка интерпретируется относительно родительского каталога.

Аргументы, обязательные для длинных параметров, обязательны и для коротких.
      --backup[=КОНТРОЛЬ]  создать резервную копию для каждого целевого файла
  -b                       то же, что и --backup, но не принимает аргумент
  -d, -F, --directory      позволить суперпользователю создавать жесткие
                           ссылки на каталоги (замечание: вероятно, это не
                           получится из-за системных ограничений, даже для
                           суперпользователя)
  -f, --force              удалять существующие целевые файлы
  -i, --interactive        спрашивать перед удалением целей
  -L, --logical            разыменовывать ЦЕЛИ, являющиеся
                           символьными ссылками
  -n, --no-dereference     рассматривать ИМЯ_ССЫЛКИ, как обычный
                           файл, если это символьная ссылка на каталог
  -P, --physical           создавать жёсткие ссылки непосредственно на
                           символьные ссылки
  -r, --relative           с -s, создавать ссылки относительно
                           расположения ссылки
  -s, --symbolic           создавать символьные ссылки, вместо жёстких ссылок
  -S, --suffix=СУФФИКС     переопределяет обычный суффикс резервных копий
  -t, --target-directory=КАТ указать КАТАЛОГ, в котором создавать ссылки
  -T, --no-target-directory  всегда считать ИМЯ_ССЫЛКИ обычным файлом
  -v, --verbose            печатать имя каждого файла при создании ссылки
      --help        display this help and exit
      --version     output version information and exit

-------

[lsof]
Внутренняя.
Связанные команды:

Встроенная консольная команда. 
Отображает список открытых файлов.

# Показать список ip/порт, на которых висят слушатели
$ lsof -iTCP -sTCP:LISTEN -P

-------

[lsblk]
Внутренняя.
Связанные команды:

Выводит список блочных устройств.
В основном диски, в том числе виртуальные (truecrypt).

-------

[lscpu]
- display information about the CPU architecture

-- Например
$ lscpu
Architecture:        x86_64
CPU op-mode(s):      32-bit, 64-bit
Byte Order:          Little Endian
CPU(s):              4
On-line CPU(s) list: 0-3
Thread(s) per core:  2
Core(s) per socket:  2
Socket(s):           1
NUMA node(s):        1
Vendor ID:           GenuineIntel
CPU family:          6
Model:               37
Model name:          Intel(R) Core(TM) i5 CPU         650  @ 3.20GHz
Stepping:            2
CPU MHz:             1790.348
CPU max MHz:         3201,0000
CPU min MHz:         1200,0000
BogoMIPS:            6426.76
Virtualization:      VT-x
L1d cache:           32K
L1i cache:           32K
L2 cache:            256K
L3 cache:            4096K
NUMA node0 CPU(s):   0-3
Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm sse4_1 sse4_2 popcnt aes lahf_lm pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid dtherm ida arat flush_l1d
[lsipc]
- show information on IPC facilities currently employed in the system
DESCRIPTION
       lsipc shows information on the inter-process communication facilities for which the calling process has read access.

$ man lsipc
$ lsipc
$ lsipc -J

-------

[lspci]
Внутренняя.
Связанные команды:

Выводит список PCI-устройств.

-------

[lsusb]
Внутренняя.
Связанные команды:

Выводит список USB-устройств
````

* [M] ABCDEFGHIJKLM NOPQRSTUVWXYZ
````text
--------------------------------------------------------------------------------
-- [M] ABCDEFGHIJKLM NOPQRSTUVWXYZ 
------

[mesg]
Внутренняя.
Связанные команды: write

Команда "mesg" позволяет
1. узнать разрешена ли отправка сообщений для текущего пользователя
2. изменить разрешение на прием сообщений для текущего пользователя
@TODO: разобраться что за сообщения, для чего и как использовать.

Узнать свой статус
$ mesg
is y - Разрешено
is n - Запрещено

Разрешить текущему пользователю принимать сообщения от других пользователей
$ mesg y

-------

[mv]
Внутренняя.
Связанные команды: rename

Команда "mv" позволяет переносить и переименовывать файлы и каталоги.

Примеры:
$ mv -v 'link.txt' 't_file.txt'
renamed 'link.txt' -> 't_file.txt'
$ mkdir -v myDir1 ; mv -v myDir1 myDir2 ; ll -v myDir2
````

* [N] ABCDEFGHIJKLMN OPQRSTUVWXYZ
````text
--------------------------------------------------------------------------------
-- [N] ABCDEFGHIJKLMN OPQRSTUVWXYZ
------

[nmap]
# Проверить доступен ли порт на компе с заданным IP
$ nmap -p T:139 10.10.10.21
````
* [O] ABCDEFGHIJKLMNO PQRSTUVWXYZ
````text
````

* [P] ABCDEFGHIJKLMNOP QRSTUVWXYZ
````text
--------------------------------------------------------------------------------
-- [P] ABCDEFGHIJKLMNOP QRSTUVWXYZ
-------

[ping]

$ apt install inetutils-ping
````

* [Q] ABCDEFGHIJKLMNOPQ RSTUVWXYZ
````text
````

* [R] ABCDEFGHIJKLMNOPQR STUVWXYZ
````text
--------------------------------------------------------------------------------
-- [R] ABCDEFGHIJKLMNOPQR STUVWXYZ
-------

[rename]
Внутренняя.
Связанные команды: mv

Переименовывает множество файлов.

Примеры.

-- Тест на переименование (ключ -n).
1. Создаются тестовые файлы: myFile1.txt  myFile2.txt  myFileF.txt.
2. Выводится их список
3. Тест на переименование.
$ touch myFile1.txt myFile2.txt myFile321.txt myFileF.txt ; ls myFile* ; rename -n 's/\d.txt/*123*.txt/' *.*
myFile1.txt  myFile2.txt  myFileF.txt
rename(myFile1.txt, myFile*123*.txt)
rename(myFile2.txt, myFile*123*.txt)

-- То же, что и предыдущий пример, но длинна числового фрагмента должна быть от 2 до 5 символов
$ touch myFile1.txt myFile2.txt myFile321.txt myFileF.txt ; ls myFile* ; rename -n 's/\d{2,5}.txt/*123*.txt/' *.*
rename(myFile321.txt, myFile*123*.txt)

-------
````

* [S] ABCDEFGHIJKLMNOPQRS TUVWXYZ

  * [sleep]

````text
Делает паузу на заданное время.

Использование: sleep ЧИСЛО[СУФФИКС]…
       или:    sleep ПАРАМЕТР
Приостанавливает выполнение на заданное ЧИСЛО секунд.
 
СУФФИКС можетпринимать значение 
    «s», что означает секунды (применяется по умолчанию) 
    «m» — минуты 
    «h» — часы
    «d» — дни 

ЧИСЛО может быть не целым.
Если задано несколько аргументов, выполнение приостанавливается на период,
равный сумме их значений
````
````shell
echo $(date +"%Y-%m-%d_%H-%M-%S")

sleep 1

echo $(date +"%Y-%m-%d_%H-%M-%S")

sleep 1s

echo $(date +"%Y-%m-%d_%H-%M-%S")

sleep 0.1m

echo $(date +"%Y-%m-%d_%H-%M-%S")

sleep 0.1m 3s

echo $(date +"%Y-%m-%d_%H-%M-%S")

````

  * [ssh]

````text
  [ssh]
Внутренняя.
Связвнные команды: openssh-server

ssh-клиент. Позволяет установить соединение по ssh.

Подклюючиться по ssh пользователем "ivan" к своему же компьютеру.
$ ssh ivan@localhost
````

  * [sslscan]

````text
[sslscan]
Внутренняя.
Связанные команды:

Позволяет посмотреть какие версии SSL поддерживаются веб-сервером.
Проект тут https://github.com/rbsec/sslscan

Установка 
$ sudo apt install sslscan

Информация о версии 
$ sslscan
1.11.5
OpenSSL 1.0.2n  7 Dec 2017

Использование
$ sslscan https://google.com
````

  * [systemctl]

````text
[systemctl]
Внутренняя.

Systemctl — это системный менеджер служб, который используется в операционных системах на основе Linux, таких как Fedora, CentOS, Red Hat и Ubuntu. Он используется для управления различными аспектами системных служб, включая их запуск, остановку, перезапуск и мониторинг.

Использование
$ systemctl status openvpn
$ systemctl stop openvpn
$ systemctl restart openvpn
````

  * [su]

````text
[su]
Сменить текущего пользователя

$su ivan
$su -
````


* [T] ABCDEFGHIJKLMNOPQRST UVWXYZ
````text

--------------------------------------------------------------------------------
-- [T] ABCDEFGHIJKLMNOPQRST UVWXYZ
------

[tar]
Внутренняя.
Связанные команды:

Встроенная консольная утилита.
Позволяет упаковывать и распаковывать файлы и директории.
Основные ключи:
x  - распаковать
-C - директория назначения, куда распаковать
-v - многословный режим - выводит информацию по каждому копируемому файлу

# Распаковать Java JDK в указанную директорию
$ sudo tar xfvz jdk-7u80-linux-x64.tar.gz -C  /usr/lib/jvm/

------

[telnet]

apt install inetutils-telnet

$ telnet 172.17.0.1 9000
> close

Если находимся в режиме ожидания ответа, то для прерывания жмем CTRL + ]

------

[test]
Внутренняя.
Связанные команды:

Описание: Проверяет типы файлов и сравнивает значения.
0 - true
1 - false

Ссылки:
* https://www.ibm.com/developerworks/ru/library/l-bash-test/index.html
Функции сравнения и тестирования в Bash

Примеры: См. "soft-test.txt".
$ test 3 -eq 3; echo $?
0
$ test 3 -eq 4; echo $?
1
Если "tmp" каталог
if [ -d "tmp/" ]; then echo "TRUE"; else echo "FALSE"; fi
Если "dest.txt" НЕ каталог.
if [ ! -d "tmp/" ]; then echo "TRUE - это НЕ каталог"; else echo "FALSE - Это каталог "; fi

------

[top]

Вывести топ процессов
$top

-------
````

* [U] ABCDEFGHIJKLMNOPQRSTU VWXYZ
````text

--------------------------------------------------------------------------------
-- [U] ABCDEFGHIJKLMNOPQRSTU VWXYZ
------

[unlink]
Внутренняя.
Связанные команды:

Удаляет символическую ссылку.

Например:
$ unlink /var/www/linked-dir

-------

[uptime]
Внутренняя.
Связанные команды:

Возвращает информацию о времени непрерывной работы и средней загрузке ОС.
$ uptime
07:13:53 up 8 days, 19 min,  1 user,  load average: 1.98, 2.15, 2.21
load average - средняя загрузка за минуту, 5 минут, 15 минут.

-------
````

* [V] ABCDEFGHIJKLMNOPQRSTUV WXYZ
````text
````


* [W] ABCDEFGHIJKLMNOPQRSTUVW XYZ
````text
--------------------------------------------------------------------------------
-- [W] ABCDEFGHIJKLMNOPQRSTUVW XYZ
------

[who]
Внутренняя.
Связанные команды:

Выводит список пользователей, работающих в системе

$ who
$ who
ivan     tty1         2020-02-07 10:42
ivan     tty7         2020-02-03 09:05 (:0)
ivan     pts/12       2020-02-07 10:53 (127.0.0.1)

[write]
Внутренняя.
Связвнные команды: mesg

write ivan pts/12

-------
````


* [X] ABCDEFGHIJKLMNOPQRSTUVWX YZ
````text
````


* [Y] ABCDEFGHIJKLMNOPQRSTUVWXY Z
````text
````


* [Z] ABCDEFGHIJKLMNOPQRSTUVWXYZ
````text
````
