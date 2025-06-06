<h1>ffmpeg</h1>

# CMD


* help
````shell
ffmpeg -h         &>ffmpeg-h.txt
ffmpeg -h long    &>ffmpeg-h-long.txt
ffmpeg -h full    &>ffmpeg-h-full.txt
````

* man
````shell
man ffmpeg &>ffmpeg-man.txt
````

```shell
ffmpeg -version
```

# CMD-demo

Извлечь аудио из видео
```shell
ffmpeg -i inp_video.mp4 -acodec libmp3lame -ab 192k -ar 44100 audio_out.mp3
```

```shell
bash ./scripts/ffmpeg-find.sh -i "./scripts/inp" 
```