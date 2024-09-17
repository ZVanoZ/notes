* Получение форматированной даты в переменную, либо в как результат выражения
````shell
createdAt=$(date +'%Y-%m-%dT%H:%M:%SZ')
echo  "createdAt='${createdAt}'" 
echo  "CREATED_AT='$(date +'%Y-%m-%dT%H:%M:%SZ')'" 
````

* Перенаправление stdout команды в лог-файл
```shell
echo 'Hello' >./tmp/echo-stdout-$(date +"%Y-%m-%d_%H-%M-%S").log
```

* Перенаправление stdout и stderr команды в лог-файл
```shell
mkdir ./tmp/dir-without-access
chown -vR root:root ./tmp/dir-without-access

find ./tmp/ -name "*" &>./tmp/echo-stdout-stderr-$(date +"%Y-%m-%d_%H-%M-%S").log
```

* Пример выполнения блока команд в случае, если основная команда завершилась с ошибкой.  
  Используются фигурніе скобки.
````shell
cat ./invalid-file-path || {
  # Блок команд для обработки ошибки 
  echo "Ошибка при обращении к файлу: $?"
  echo "Проверьте наличие файла в текущем каталоге: ${PWD}"
  ls -la
}
````

* Перебор путей из переменной PATH в Bash-скрипте

https://g.co/gemini/share/a6ab5cd0daff
```shell
#!/bin/bash

# Получаем список директорий из переменной PATH
for directory in $(echo $PATH | tr ':' '\n'); do
    # Делаем что-нибудь с каждой директорией
    echo "Проверяем директорию: $directory"
    # Например, ищем исполняемый файл:
    if [ -x "$directory/some_command" ]; then
        echo "Найден исполняемый файл: $directory/some_command"
    fi
done
```