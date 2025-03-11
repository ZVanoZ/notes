
## Системная информация

* Информация о команде
````shell
type chmod        &> chmod-type.txt
chmod --help      &> chmod-help.txt
chmod --version   &> chmod-version.txt
man chmod         &> chmod-man.txt
````

* Информация об установке
````shell
#sudo dpkg -i chmod     &> chmod-dpkg-i.txt
#dpkg --status chmod    &> chmod-dpkg-status.txt
#apt info chmod         &> chmod-apt-info.txt
````

## Шпаргалка

```text
          Владелец
           Группа
            Остальные
chmod -vR 700

________________________________________________
:   0   1   2   3      4     5     6     7     :
________________________________________________
:   -   x   w          r                       :
: --- --x  -w-  -wx    r--   r-x   rw-   rwx   :
:               2+1          3+1   4+2   4+2+1 :
________________________________________________

chmod -v 700        rwx------  
chmod -v 701        rwx-----x   
chmod -v 702        rwx----w-   
chmod -v 703        rwx----wx   
chmod -v 704        rwx---r--   
chmod -v 705        rwx---r-x   
chmod -v 706        rwx---rw-   
chmod -v 707        rwx---rwx   
```
