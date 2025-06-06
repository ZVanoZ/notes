# "md5sum"

[md5sum-help.txt](md5sum-help.txt)

## Системная информация

* Информация о команде
````shell
type md5sum        &> md5sum-type.txt
md5sum --help      &> md5sum-help.txt
md5sum --version   &> md5sum-version.txt
man md5sum         &> md5sum-man.txt
````

* Информация об установке
````shell
#sudo dpkg -i md5sum     &> md5sum-dpkg-i.txt
#dpkg --status md5sum    &> md5sum-dpkg-status.txt
#apt info md5sum         &> md5sum-apt-info.txt
````


## Demos

* Строка

```bash
echo -n "Hello World" | md5sum
```
```text
b10a8db164e0754105b7a99be72e3fe5  -
```


* Файлы

```bash
md5sum md5sum.md md5sum-help.txt
```
```text
99ebb0c6d210f6f670a4f8e64cc4917b  md5sum.md
7a1b83c04e072cf85c6ebfe2c9616930  md5sum-help.txt
```

```bash
md5sum -c md5sum-help.txt
```
