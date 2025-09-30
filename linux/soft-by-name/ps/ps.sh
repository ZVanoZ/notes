#!/bin/bash

# Вывести список процессов и команду запуска с аргументами
ps -fe
# UID          PID    PPID  C STIME TTY          TIME CMD
# root           1       0  0 фев29 ?     00:00:04 /sbin/init
# root           2       0  0 фев29 ?     00:00:00 [kthreadd]
# root           3       2  0 фев29 ?     00:00:00 [rcu_gp]
# root      734383       1  0 00:00 ?        00:00:00 /usr/sbin/cups-browsed
# lp        742401  734346  0 00:01 ?        00:00:00 /usr/lib/cups/notifier/dbus dbus://
