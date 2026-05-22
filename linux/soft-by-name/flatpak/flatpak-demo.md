# "flatpak-demo.md"


## demos

* Перечислить запущенные приложения
````shell
flatpak ps
````

* Показать список установленных приложений и/или сред исполнения
````shell
flatpak list
````

* Список разрешений (для всех установленных приложений)
````shell
flatpak permissions
````
Список разрешений из таблицы "documents" (это маппинг путей, которые приложения запрашивают у пользователя в режиме диалога).
```shell
flatpak permissions documents
```

* Сбросить вообще все разрешения для Teams (он снова станет «чистым» и будет спрашивать доступ при каждом открытии файла):
```shell
flatpak permission-reset com.github.IsmaelMartinez.teams_for_linux
```
Сброс для моего списка 
```shell
flatpak permission-reset snap.teams-for-linux
flatpak permission-reset snap.skype 
flatpak permission-reset snap.telegram-desktop
```

* flatpak install ... DroidCam
````shell
flatpak install flathub com.obsproject.Studio.Plugin.DroidCam
````

* Показать информацию об установленных приложениях или средах исполнения
````shell
flatpak info com.obsproject.Studio.Plugin.DroidCam
````

* Запустить приложение
````shell
flatpak run com.obsproject.Studio.Plugin.DroidCam
````

## flatpak remotes

```shell
flatpak remotes
```

```shell
flatpak remote-ls >flatpak-help/remote-ls.res.txt
```