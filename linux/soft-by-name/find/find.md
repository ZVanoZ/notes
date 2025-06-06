<h1>find</h1>

Поиск файлов и папок

---

# CMD

* help
````shell
find --help   &>find-help.txt
````

* man
````shell
man find &>find-man.txt
````

```shell
find -version
```

---

# Examples

---
[for.sh](../../bash/for.sh)

---

Найти все файлы "*.txt" в родительской директории не спускаясь при этом в дочерние.  
Вывести в столбик.
```shell
find ../ -maxdepth 1 -type f -name "*.txt"
```

---

Найти все файлы "*.txt" в текущей директории и всех дочерних.
* Вывести в столбик
```shell
find ./ -type f -name "*.txt"
```
* Вывести в строку через символ " ".
```shell
find ./ -type f -name "*.txt" -printf '%f '
```
* "\*-file-\*" 
  * Без учета типа файла
    ```shell
    find ./ -name "*-file-*"
    ```
  * Файлы
    ```shell
    find ./ -type f -name "*-file-*"
    ```
  * Папки
    ```shell
    find ./ -type d -name "*-file-*"
    ```


