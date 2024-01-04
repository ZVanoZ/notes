
## Имеем проблему с драйверами для видеокарты NVidia

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

````
sudo dmesg -Hw

sudo dmesg -HT

````

````bash
sudo logwatch

#> --------------------- Kernel Begin ------------------------ 
#>
#> 
#> WARNING:  Trap int3 in these executables
#>    traps: light-locker :  4 Time(s)
#> 
#> WARNING:  Kernel Errors Present
#>    Buffer I/O error on dev sdf1, log ...:  2 Time(s)
#>    blk_update_request: I/O error, dev sdf, sector ...:  2 Time(s)
#>    nouveau 0000:05:00.0: Direct firmware load for nouveau/nvc1_fuc084 failed with error -2 ...:  36 Time(s)
#>    nouveau 0000:05:00.0: Direct firmware load for nouveau/nvc1_fuc084d failed with error -2 ...:  36 Time(s)
#>    r8169 0000:02:00.0: Direct firmware load for rtl_nic/rtl8168g-2.fw failed with error -2 ...:  3 Time(s)
#>    usb 2-9: device descriptor read/64, error -71 ...:  1 Time(s)
#>    usb 3-6: device descriptor read/64, error -71 ...:  2 Time(s)
#> 
#> ---------------------- Kernel End ------------------------- 
````


Оборудование:
```bash
ivan@ivan-debian:~$ lspci |grep -i NVIDIA
01:00.0 VGA compatible controller: NVIDIA Corporation GF108 [GeForce GT 430] (rev a1)
01:00.1 Audio device: NVIDIA Corporation GF108 High Definition Audio Controller (rev a1)
```

[Проприетарные драйвера NVIDIA](https://wiki.debian.org/ru/NvidiaGraphicsDrivers)
````bash
# Для того, чтобы идентифицировать (серию/кодовое имя) вашу установленную видеокарту (GPU), можно использовать команду lspci. Пример:
lspci -nn | egrep -i "3d|display|vga"
#> 05:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF108 [GeForce GT 430] [10de:0de1] (rev a1)

# sudo apt install nvidia-detect

nvidia-detect
#> Detected NVIDIA GPUs:
#> 05:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF108 [GeForce GT 430] [10de:0de1] (rev a1)
#> 
#> Checking card:  NVIDIA Corporation GF108 [GeForce GT 430] (rev a1)
#> Your card is only supported up to the 390 legacy drivers series.
#> It is recommended to install the
#>     nvidia-legacy-390xx-driver
#> package.

sudo apt install nvidia-legacy-390xx-driver

````
Получаем такой вывод:
```text
Настраивается пакет linux-headers-amd64 (5.10.162-1) …
Обрабатываются триггеры для man-db (2.9.4-2) …
Обрабатываются триггеры для mailcap (3.69) …
Обрабатываются триггеры для desktop-file-utils (0.26-1) …
Обрабатываются триггеры для initramfs-tools (0.140) …
update-initramfs: Generating /boot/initrd.img-5.10.0-21-amd64
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8125b-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8125a-3.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8107e-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8107e-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168fp-3.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168h-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168h-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168g-3.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168g-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8106e-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8106e-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8411-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8411-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8402-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168f-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168f-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8105e-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168e-3.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168e-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168e-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168d-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168d-1.fw for module r8169
W: Possible missing firmware /lib/firmware/nvidia/gp100/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/acr/ucode_ahesasc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/acr/ucode_ahesasc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/acr/ucode_ahesasc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/acr/ucode_ahesasc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/acr/ucode_ahesasc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/acr/ucode_asb.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/acr/ucode_asb.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/acr/ucode_asb.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/acr/ucode_asb.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/acr/ucode_asb.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/sec2/sig-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/sec2/image-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/sec2/desc-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/sec2/sig-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/sec2/image-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/sec2/desc-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/sec2/sig-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/sec2/image-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/sec2/desc-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/sec2/sig-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/sec2/image-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/sec2/desc-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/sec2/desc.bin for module nouveau
Обрабатываются триггеры для hicolor-icon-theme (0.17-2) …
Обрабатываются триггеры для gnome-menus (3.36.0-1) …
Обрабатываются триггеры для libc-bin (2.31-13+deb11u5) …
Обрабатываются триггеры для glx-alternative-mesa (1.2.1~deb11u1) …
update-alternatives: обновляется альтернатива /usr/lib/mesa-diverted, так как группа ссылок glx изменилась подчинёнными ссылками
Настраивается пакет glx-alternative-nvidia (1.2.1~deb11u1) …
Обрабатываются триггеры для glx-alternative-nvidia (1.2.1~deb11u1) …
Настраивается пакет nvidia-legacy-390xx-alternative (390.157-1~deb11u1) …
Обрабатываются триггеры для nvidia-legacy-390xx-alternative (390.157-1~deb11u1) …
update-alternatives: используется /usr/lib/nvidia/legacy-390xx для предоставления /usr/lib/nvidia/nvidia (nvidia) в автоматическом режиме
Настраивается пакет nvidia-legacy-390xx-kernel-support (390.157-1~deb11u1) …
Настраивается пакет nvidia-settings-legacy-390xx (390.144-1) …
Настраивается пакет xserver-xorg-video-nvidia-legacy-390xx (390.157-1~deb11u1) …
Настраивается пакет libglx-nvidia-legacy-390xx0:amd64 (390.157-1~deb11u1) …
Настраивается пакет libnvidia-legacy-390xx-ml1:amd64 (390.157-1~deb11u1) …
Настраивается пакет libgl1-nvidia-legacy-390xx-glvnd-glx:amd64 (390.157-1~deb11u1) …
Настраивается пакет libegl-nvidia-legacy-390xx0:amd64 (390.157-1~deb11u1) …
Настраивается пакет libgles-nvidia-legacy-390xx2:amd64 (390.157-1~deb11u1) …
Настраивается пакет libnvidia-legacy-390xx-cfg1:amd64 (390.157-1~deb11u1) …
Настраивается пакет libnvidia-legacy-390xx-cuda1:amd64 (390.157-1~deb11u1) …
Настраивается пакет libgles-nvidia-legacy-390xx1:amd64 (390.157-1~deb11u1) …
Настраивается пакет libnvidia-legacy-390xx-nvcuvid1:amd64 (390.157-1~deb11u1) …
Настраивается пакет nvidia-legacy-390xx-vdpau-driver:amd64 (390.157-1~deb11u1) …
Настраивается пакет nvidia-persistenced (470.103.01-2~deb11u1) …
Предупреждение: указанный вами домашний каталог /var/run/nvpd/ недоступен: No such file or directory
Добавляется системный пользователь «nvpd» (UID 119) ...
Добавляется новая группа «nvpd» (GID 127) ...
Добавляется новый пользователь «nvpd» (UID 119) в группу «nvpd» ...
Не создаётся домашний каталог «/var/run/nvpd/».
Created symlink /etc/systemd/system/multi-user.target.wants/nvidia-persistenced.service → /lib/systemd/system/nvidia-persistenced.service.
Job for nvidia-persistenced.service failed because the control process exited with error code.
See "systemctl status nvidia-persistenced.service" and "journalctl -xe" for details.
Настраивается пакет nvidia-legacy-390xx-egl-icd:amd64 (390.157-1~deb11u1) …
Настраивается пакет nvidia-legacy-390xx-smi (390.157-1~deb11u1) …
Настраивается пакет nvidia-legacy-390xx-vulkan-icd:amd64 (390.157-1~deb11u1) …
Настраивается пакет nvidia-legacy-390xx-driver-bin (390.157-1~deb11u1) …
Настраивается пакет nvidia-legacy-390xx-driver-libs:amd64 (390.157-1~deb11u1) …
Настраивается пакет libnvidia-legacy-390xx-encode1:amd64 (390.157-1~deb11u1) …
Обрабатываются триггеры для nvidia-legacy-390xx-alternative (390.157-1~deb11u1) …
update-alternatives: обновляется альтернатива /usr/lib/nvidia/legacy-390xx, так как группа ссылок nvidia изменилась подчинёнными ссылками
Настраивается пакет nvidia-legacy-390xx-kernel-dkms (390.157-1~deb11u1) …
Loading new nvidia-legacy-390xx-390.157 DKMS files...
Building for 5.10.0-21-amd64
Building initial module for 5.10.0-21-amd64
Done.

nvidia-legacy-390xx.ko:
Running module version sanity check.
 - Original module
   - No original module exists within this kernel
 - Installation
   - Installing to /lib/modules/5.10.0-21-amd64/updates/dkms/

nvidia-legacy-390xx-modeset.ko:
Running module version sanity check.
 - Original module
   - No original module exists within this kernel
 - Installation
   - Installing to /lib/modules/5.10.0-21-amd64/updates/dkms/

nvidia-legacy-390xx-drm.ko:
Running module version sanity check.
 - Original module
   - No original module exists within this kernel
 - Installation
   - Installing to /lib/modules/5.10.0-21-amd64/updates/dkms/

nvidia-legacy-390xx-uvm.ko:
Running module version sanity check.
 - Original module
   - No original module exists within this kernel
 - Installation
   - Installing to /lib/modules/5.10.0-21-amd64/updates/dkms/

depmod...

DKMS: install completed.
Настраивается пакет nvidia-legacy-390xx-driver (390.157-1~deb11u1) …
Обрабатываются триггеры для libc-bin (2.31-13+deb11u5) …
Обрабатываются триггеры для initramfs-tools (0.140) …
update-initramfs: Generating /boot/initrd.img-5.10.0-21-amd64
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8125b-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8125a-3.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8107e-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8107e-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168fp-3.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168h-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168h-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168g-3.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168g-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8106e-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8106e-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8411-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8411-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8402-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168f-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168f-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8105e-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168e-3.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168e-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168e-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168d-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168d-1.fw for module r8169
W: Possible missing firmware /lib/firmware/nvidia/gp100/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/acr/ucode_ahesasc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/acr/ucode_ahesasc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/acr/ucode_ahesasc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/acr/ucode_ahesasc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/acr/ucode_ahesasc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/acr/ucode_asb.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/acr/ucode_asb.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/acr/ucode_asb.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/acr/ucode_asb.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/acr/ucode_asb.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/sec2/sig-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/sec2/image-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/sec2/desc-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/sec2/sig-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/sec2/image-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/sec2/desc-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/sec2/sig-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/sec2/image-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/sec2/desc-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/sec2/sig-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/sec2/image-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/sec2/desc-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/sec2/desc.bin for module nouveau
Обрабатываются триггеры для update-glx (1.2.1~deb11u1) …
Обрабатываются триггеры для glx-alternative-nvidia (1.2.1~deb11u1) …
update-alternatives: используется /usr/lib/nvidia для предоставления /usr/lib/glx (glx) в автоматическом режиме
Обрабатываются триггеры для glx-alternative-mesa (1.2.1~deb11u1) …
Обрабатываются триггеры для libc-bin (2.31-13+deb11u5) …
Обрабатываются триггеры для initramfs-tools (0.140) …
update-initramfs: Generating /boot/initrd.img-5.10.0-21-amd64
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8125b-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8125a-3.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8107e-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8107e-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168fp-3.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168h-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168h-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168g-3.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168g-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8106e-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8106e-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8411-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8411-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8402-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168f-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168f-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8105e-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168e-3.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168e-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168e-1.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168d-2.fw for module r8169
W: Possible missing firmware /lib/firmware/rtl_nic/rtl8168d-1.fw for module r8169
W: Possible missing firmware /lib/firmware/nvidia/gp100/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/acr/ucode_load.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/acr/ucode_ahesasc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/acr/ucode_ahesasc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/acr/ucode_ahesasc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/acr/ucode_ahesasc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/acr/ucode_ahesasc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/acr/bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/acr/ucode_asb.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/acr/ucode_asb.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/acr/ucode_asb.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/acr/ucode_asb.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/acr/ucode_asb.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/acr/unload_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm206/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm204/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gm200/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp100/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/sw_method_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/sw_bundle_init.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/sw_nonctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/sw_ctx.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/gpccs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/gpccs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/gpccs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/gpccs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/fecs_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/fecs_data.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/fecs_inst.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/gr/fecs_bl.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/sec2/sig-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/sec2/image-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/sec2/desc-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/sec2/sig-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/sec2/image-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/sec2/desc-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/sec2/sig-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/sec2/image-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/sec2/desc-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/sec2/sig-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/sec2/image-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/sec2/desc-1.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp107/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp106/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp104/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp102/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gv100/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/gp108/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu117/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu116/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu106/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu104/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/tu102/sec2/desc.bin for module nouveau

```

<hr/>

[Linux x64 (AMD64/EM64T) Display Driver](https://www.nvidia.com/download/driverResults.aspx/156200/ru/)

````bash
# 1. Качаем скрипт. "NVIDIA-Linux-x86_64-340.108.run"
# 2. Отключаем X-сервер
# 3. Запускаем скрипт 
/var/log/

````

<hr/>

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



