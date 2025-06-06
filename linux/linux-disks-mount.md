# [linux-disks-mount.md](linux-disks-mount.md) 

Монтирование дисков в Linux

<hr/>

## <a id="id_blkid_show_list"/>Смотрим что у нас вообще есть из дисков

```BASH
sudo blkid 
```
Получим что-то типа такого
```TEXT
/dev/sda1: UUID="bd2dcca7-e963-40f2-bf7c-5c89640d7abc" TYPE="ext4" PARTUUID="95e3d9c4-01"
/dev/sda5: UUID="0e3e7559-9627-45e9-8daa-cd40e2f799b7" TYPE="swap" PARTUUID="95e3d9c4-05"
/dev/sdc: LABEL="dio-zim-1tb" UUID="933438ad-8152-44e9-937a-86f62a8eaa94" TYPE="ext4"
/dev/sdb1: UUID="b1e8618b-8074-4654-8dd6-eea602e7fed5" TYPE="ext4" PARTUUID="6a1e9125-01"
/dev/sdd: LABEL="zim16g" UUID="3C16265916261484" TYPE="ntfs"
/dev/mapper/truecrypt1: UUID="D27EFF1B7EFEF757" TYPE="ntfs"
```

## <a id="id_e2label"/>Назначение меток для дисков

```BASH
sudo e2label /dev/sdb1 dio-zim-120g-sys
# 2. Создаем каталоги для монтирования в них дисков
sudo mkdir /media/dio-zim-1tb
sudo mkdir /media/dio-zim-120g-sys
```
--

## Настроить монтирование дисков при старте системы

1. [Смотрим что у нас вообще есть из дисков](#id_blkid_show_list)

2. [Назначаем метки, если требуется.](#id_e2label)

3. Прописываем монтирование в "/etc/fstab"

```BASH
sudo mcedit /etc/fstab
```

```TEXT
# Вносим строчки
# mount /mnt/dio-zim-1tb по "uuid"
#/dev/disk/by-uuid/933438ad-8152-44e9-937a-86f62a8eaa94 /mnt/dio-zim-1tb auto nosuid,nodev,nofail,x-gvfs-show 0 0

# mount /mnt/dio-zim-1tb по "label" (см. п.1)
/dev/disk/by-label/dio-zim-1tb /media/dio-zim-1tb auto nosuid,nodev,nofail,x-gvfs-show 0 0

# SSD 120
/dev/disk/by-label/dio-zim-120g-sys /media/dio-zim-120g-sys auto nosuid,nodev,nofail,x-gvfs-show 0 0
```

4. Монтируем, чтобы не перезагружать систему (в дальнейшем монтирование будет происходить автоматически)

4.1. Если диск уже был в fstab, то система может попросить перечитать конфиг
```shell
sudo systemctl daemon-reload
```

4.2. Монтируем
```BASH
sudo mount -a
```

<hr/>

