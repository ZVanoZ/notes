# "pandoc"

[pandoc-help.txt](pandoc-help.txt)

## Установка

```shell
sudo apt update && sudo apt install -y pandoc
```

## Системная информация

* Информация о команде 
````shell
type pandoc        &> pandoc-type.txt
pandoc --help      &> pandoc-help.txt
pandoc -v          &> pandoc-version.txt
man pandoc         &> pandoc-man.txt
````

* Информация об установке
````shell
apt info pandoc          &> pandoc-apt-info.txt
#sudo dpkg -i pandoc     &> pandoc-dpkg-i.txt
#dpkg --status pandoc    &> pandoc-dpkg-status.txt
````

## Demos

```shell
pandoc -v -c 1 google.com
```
