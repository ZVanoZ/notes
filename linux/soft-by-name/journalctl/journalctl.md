# "journalctl"

[journalctl-help.txt](journalctl-help.txt)

## Системная информация

* Информация о команде

````shell
type journalctl        &> journalctl-type.txt
journalctl --help      &> journalctl-help.txt
journalctl --version   &> journalctl-version.txt
man journalctl         &> journalctl-man.txt
````

* Информация об установке

````shell
#sudo dpkg -i journalctl     &> journalctl-dpkg-i.txt
#dpkg --status journalctl    &> journalctl-dpkg-status.txt
#apt info journalctl         &> journalctl-apt-info.txt
````

# Примеры

```shell
journalctl -xeu apparmor.service
```