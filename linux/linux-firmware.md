
h2. Имеем проблему с драйверами для видеокарты NVidia

Время от времени графическая система вешается, но можно подключиться по SSH.

В логе видим такое:
```TEXT
nouveau 0000:01:00.0: msvld: init failed, -19

nouveau 0000:01:00.0: msvld: unable to load firmware data
+pci:0000:01:00.0

nouveau 0000:01:00.0: firmware: failed to load nouveau/nvc1_fuc084d (-2)
+pci:0000:01:00.0

nouveau 0000:01:00.0: firmware: failed to load nouveau/nvc1_fuc084 (-2)
+pci:0000:01:00.0

nouveau 0000:01:00.0: msvld: init failed, -19
+pci:0000:01:00.0

nouveau 0000:01:00.0: msvld: unable to load firmware data
+pci:0000:01:00.0

nouveau 0000:01:00.0: firmware: failed to load nouveau/nvc1_fuc084d (-2)
+pci:0000:01:00.0
```

Нагуглил [решение](https://itnots.ru/linux/problema-s-komponentami-nouveau-firmware-failed-to-load-nouveau-nvc1_fuc084/), попробовал установить. 
**Результат пока неизвестен**

```bash
$ mkdir ~/tmp/nouveau
$ cd ~/tmp/nouveau
wget https://raw.github.com/envytools/firmware/master/extract_firmware.py
wget http://us.download.nvidia.com/XFree86/Linux-x86/325.15/NVIDIA-Linux-x86-325.15.run
sh NVIDIA-Linux-x86-325.15.run --extract-only

ivan@ivan-debian:~/tmp/nouveau$ python extract_firmware.py 
Skipping gzip blob at 0x5d92e4 (33440 bytes), wrong magic: 0x2
Skipping gzip blob at 0x5da444 (7648 bytes), wrong magic: 0x100c

# Скриптом "extract_firmware.py" не получилось, поэтому извлекаем ручками
ivan@ivan-debian:~/tmp/nouveau$ sudo mkdir /lib/firmware/nouveau
ivan@ivan-debian:~/tmp/nouveau$ sudo cp -v -d nv* vuc-* /lib/firmware/nouveau/

```
