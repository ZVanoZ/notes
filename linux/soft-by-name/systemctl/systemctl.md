# "systemctl"

[systemctl-help.txt](systemctl-help.txt)

## Системная информация

* Информация о команде

````shell
type systemctl        &> systemctl-type.txt
systemctl --help      &> systemctl-help.txt
systemctl --version   &> systemctl-version.txt
man systemctl         &> systemctl-man.txt
````

* Информация об установке

````shell
#sudo dpkg -i systemctl     &> systemctl-dpkg-i.txt
#dpkg --status systemctl    &> systemctl-dpkg-status.txt
#apt info systemctl         &> systemctl-apt-info.txt
````

# Примеры

```shell
systemctl status apparmor.service
```