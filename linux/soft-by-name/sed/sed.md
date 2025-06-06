# sed

## Опции команды

* "-e"
````text
Для выполнения нескольких действий с данными, используйте ключ -e при вызове sed. 
Например, вот как организовать замену двух фрагментов текста:
````
````shell
echo "This is a test" | sed -e 's/This/THAT/; s/test/ANOTHER TEST/'
````
Выведет
````text
THAT is a ANOTHER TEST
````

## Опции строки преобразований

* Опция "s" в строке вида "s/.../"
````text
Буква «s» — это сокращение слова «substitute», то есть — перед нами команда замены. 
Sed, выполняя эту команду, просмотрит переданный текст и заменит найденные в нём фрагменты
````
````shell
echo "This is a test" | sed 's/test/ANOTHER TEST/'
````
Выведет
````text
This is a ANOTHER TEST
````

* Опция "g" в строке вида "/.../g"
````text
Флаг g указывает на то, что нужно обработать все вхождения шаблона, имеющиеся в строке.
````
````shell
echo "1 11 111" | sed 's/1/?/'
echo "1 11 111" | sed 's/1/?/g'
````

* Опция "p" в строке вида "/.../p"
````text
Флаг p указывает на то, что нужно вывести содержимое исходной строки.
````
````shell
echo "1 11 111" | sed 's/1/?/p'
````

* Опция "w" в строке вида "/.../w"
````text
Флаг вида w file указывает команде на то, что нужно записать результаты обработки текста в файл.
````
````shell
echo "1 11 111" | sed 's/1/?/w ./tmp/test-option-w.txt'
cat ./tmp/test-option-w.txt
````

* Опция "i" в строке вида "i/.../"
 ````text
Команда i добавляет новую строку перед заданной.
````
````shell
echo "Another test" | sed 'i\First test '
````
````text
First test 
Another test
````
* Опция "a" в строке вида "a/.../"
 ````text
Команда a добавляет новую строку после заданной.
````
````shell
echo "Another test" | sed 'a\First test '
````
````text
Another test
First test 
````

## Примеры

* Замена последовательностей символов

````shell
echo '1 11 111' | sed 's/1\{2,\}/2/g'
echo '1 11 111 1111 11111 111111' | sed 's/1\{2,3\}/2/g'
````

* Заменить троеточия "..." на текст "*" в указанном файле.

Используем флаги "s", "g".  
Почему-то символ "*" не нужно экранировать.  
````shell
echo '1-. 2-.. 3-... 4-.... 5-..... 6-......' >./tmp/testfile.txt
cat ./tmp/testfile.txt
sed --in-place 's/\.\.\./*/g' ./tmp/testfile.txt
cat ./tmp/testfile.txt
````
````text
Было : 1-. 2-.. 3-... 4-.... 5-..... 6-......
Стало: 1-. 2-.. 3-* 4-*. 5-*.. 6-**
````

* Заменить две и более точки на текст "*" в указанном файле.

Используем флаги "s", "g" и квантификатор количества символов.  
Обращаем внимание на необходимость экранировать фигурные скобки.  
````shell
echo '1-. 2-.. 3-... 4-.... 5-..... 6-......' >./tmp/testfile.txt
cat ./tmp/testfile.txt
sed --in-place 's/\.\{2,\}/*/g' ./tmp/testfile.txt
cat ./tmp/testfile.txt

````
````text
Было : 1-. 2-.. 3-... 4-.... 5-..... 6-......
Стало: 1-. 2-* 3-* 4-* 5-* 6-*
````

* Заменить пути в тексте

````shell
echo '
if [ "$1" = "nginx" ] || [ "$1" = "nginx-debug" ]; then
    if /usr/bin/find "/docker-entrypoint.d/" -mindepth 1 -maxdepth 1 -type f -print -quit 2>/dev/null | read v; then
        entrypoint_log "$0: /docker-entrypoint.d/ is not empty, will attempt to perform configuration"

        entrypoint_log "$0: Looking for shell scripts in /docker-entrypoint.d/"
        find "/docker-entrypoint.d/" -follow -type f -print | sort -V | while read -r f; do
        entrypoint_log "$0: Configuration complete; ready for start up"
    else
        entrypoint_log "$0: No files found in /docker-entrypoint.d/, skipping configuration"
    fi
fi
' >./tmp/testfile.txt

sed --in-place 's!\/docker-entrypoint.d/!/nginx/docker-entrypoint.d/!g' ./tmp/testfile.txt

cat ./tmp/testfile.txt
````
