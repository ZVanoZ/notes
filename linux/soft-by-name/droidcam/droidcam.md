<h1>DroidCam</h1>

Phone as Webcam

Позволяет сделать из телефона Web-камеру (USB; WiFi).

* https://droidcam.app/
* https://droidcam.app/#client
* https://droidcam.app/linux/

* Установка плагина DroidCam
[EN: Инструкция для Linux](https://www.youtube.com/watch?v=8v7iR24ZQLQ)  
https://github.com/dev47apps/droidcam-obs-plugin/wiki/Linux-Releases  
https://github.com/dev47apps/droidcam-obs-plugin/releases  

# CMD

* Установка через flatpak
[//]: # (https://dl.flathub.org/repo/flathub.flatpakrepo)
[//]: # (flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo)
```shell
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

```shell
flatpak install flathub com.obsproject.Studio.Plugin.DroidCam
```
* Установка из github
  Качаем из https://github.com/dev47apps/droidcam-obs-plugin/wiki/Linux-Releases  
  Например https://github.com/dev47apps/droidcam-obs-plugin/releases/download/2.3.3/droidcam_obs_2.3.3_linux_flatpak.zip  
  Распакровываем во временный каталог  
  Запускаем установочный скрипт  
  ```shell
  bash install.sh
  ```
  Плагин должен установиться в ~/.config/obs-studio/plugins/droidcam-obs/

* @see [ffmpeg.md](../ffmpeg/ffmpeg.md)
```shell
ffmpeg -version
```