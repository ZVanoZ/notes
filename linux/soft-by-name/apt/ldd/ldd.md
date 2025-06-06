# "ldd"

[ldd-help.txt](ldd-help.txt)

## Системная информация 

* Информация о команде 
````shell
type ldd        &> ldd-type.txt
ldd --help      &> ldd-help.txt
ldd --version   &> ldd-version.txt
man ldd         &> ldd-man.txt
````

* Информация об установке
````shell
#sudo dpkg -i ldd     &> ldd-dpkg-i.txt
#dpkg --status ldd    &> ldd-dpkg-status.txt
#apt info ldd         &> ldd-apt-info.txt
````


## Demos

```shell
ldd /usr/local/lib/php/extensions/no-debug-non-zts-20200930/gd.so
```
```text
	linux-vdso.so.1 (0x00007ffc8b1cb000)
	libpng16.so.16 => /usr/lib/x86_64-linux-gnu/libpng16.so.16 (0x00007f9e72888000)
	libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1 (0x00007f9e7286b000)
	libwebp.so.6 => not found
	libjpeg.so.62 => /usr/lib/x86_64-linux-gnu/libjpeg.so.62 (0x00007f9e727e7000)
	libXpm.so.4 => not found
	libfreetype.so.6 => /usr/lib/x86_64-linux-gnu/libfreetype.so.6 (0x00007f9e72724000)
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f9e7254e000)
	libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f9e7240a000)
	libbrotlidec.so.1 => /usr/lib/x86_64-linux-gnu/libbrotlidec.so.1 (0x00007f9e723fc000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f9e72933000)
	libbrotlicommon.so.1 => /usr/lib/x86_64-linux-gnu/libbrotlicommon.so.1 (0x00007f9e723d9000)
```