# "udisksctl"

[udisksctl-help.txt](udisksctl-help.txt)

## Системная информация 

* Информация о команде 
````shell
type udisksctl        &> udisksctl-type.txt
udisksctl help      &> udisksctl-help.txt
#udisksctl --version   &> udisksctl-version.txt
man udisksctl         &> udisksctl-man.txt
````

* Информация об установке
````shell
#sudo dpkg -i udisksctl     &> udisksctl-dpkg-i.txt
#dpkg --status udisksctl    &> udisksctl-dpkg-status.txt
#apt info udisksctl         &> udisksctl-apt-info.txt
````


## demos 

* Список подключенных устройств
```shell
udisksctl status
```

