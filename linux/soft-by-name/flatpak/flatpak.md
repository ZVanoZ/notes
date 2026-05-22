# "flatpak"

Flatpak: система для создания, распространения и запуска изолированных десктопных приложений в Linux.

## links

* https://flatpak.org/
* https://github.com/flatpak/flatpak
* https://docs.flatpak.org
* https://docs.flatpak.org/ru/
* https://docs.flatpak.org/ru/latest/using-flatpak.html

## Системная информация

* Информация о команде

````shell
type flatpak        &> flatpak-type.txt
flatpak -h          &> flatpak-help.txt
flatpak --version   &> flatpak-version.txt
man flatpak         &> flatpak-man.txt
````

* Специфичная информация о команде
```bash
mkdir -vp ./flatpak-help
flatpak --help run  &> ./flatpak-help/run.txt
flatpak --help permissions  &> ./flatpak-help/permissions.txt
flatpak --help remotes  &> ./flatpak-help/remotes.txt
```

* Информация об установке

````shell
#sudo dpkg -i flatpak     &> flatpak-dpkg-i.txt
#dpkg --status flatpak    &> flatpak-dpkg-status.txt
apt info flatpak         &> flatpak-apt-info.txt
````
