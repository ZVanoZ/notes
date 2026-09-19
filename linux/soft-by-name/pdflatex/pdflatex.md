# "pdflatex"

[pdflatex-help.txt](pdflatex-help.txt)

## Установка

```shell
sudo apt update && sudo apt install -y pdflatex
# E: Невозможно найти пакет pdflatex
```

## Системная информация

* Информация о команде 
````shell
type pdflatex        &> pdflatex-type.txt
pdflatex --help      &> pdflatex-help.txt
pdflatex -v          &> pdflatex-version.txt
man pdflatex         &> pdflatex-man.txt
````

* Информация об установке
````shell
apt info pdflatex          &> pdflatex-apt-info.txt
#sudo dpkg -i pdflatex     &> pdflatex-dpkg-i.txt
#dpkg --status pdflatex    &> pdflatex-dpkg-status.txt
````

## Demos

```shell
pdflatex -v -c 1 google.com
```
