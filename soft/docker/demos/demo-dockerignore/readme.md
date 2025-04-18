В данном каталоге экспериментируем с файлом ".dockerignore"

@TODO: разобраться как работает игнорирование
@TODO: можно ли пихать ".dockerignore" в субдиректории?
@TODO: как игнорировать файлы и как папки?
@TODO: как игнорировать только в текущей директории?


---

* Gemini

Правила написания .dockerignore

Файл .dockerignore служит для указания Docker, какие файлы и директории следует игнорировать при сборке образа. Это позволяет уменьшить размер контекста сборки и ускорить процесс.
Синтаксис

Синтаксис файла .dockerignore очень похож на синтаксис файла .gitignore. Он основан на шаблонах, которые определяют, какие файлы и директории должны быть исключены.

Основные правила:

    Пустые строки и строки, начинающиеся с #: Игнорируются (комментарии).
    Абсолютные пути: Не поддерживаются. Все пути считаются относительными к корневой директории контекста сборки.
    Шаблоны:
        *: Соответствует любому количеству любых символов.
        ?: Соответствует любому одиночному символу.
        [abc]: Соответствует любому символу из указанного набора.
        [!abc]: Соответствует любому символу, кроме указанных.
        **: Соответствует любым файлам и подкаталогам в указанном каталоге.

Примеры правил

    Исключить все файлы .swp:

    *.swp

    Исключить все файлы и каталоги в директории node_modules:

    node_modules/

    Исключить все файлы, кроме .git:

    !.git
    *

    Исключить все файлы с расширением .pyc и .pyo:

    *.py[co]

    Исключить все скрытые файлы (начинающиеся с точки):

    .*

Местоположение файла .dockerignore

Файл .dockerignore должен находиться в корневой директории вашего проекта, т.е. в той же директории, где находится Dockerfile.
Пример файла .dockerignore

# Игнорируем все файлы, кроме .git
!.git
*

# Исключаем некоторые специфичные файлы и директории
node_modules/
*.log
*.tmp
build/
dist/

Советы

    Будьте осторожны с исключениями: Слишком широкие исключения могут привести к тому, что нужные файлы не попадут в образ.
    Тестируйте: После внесения изменений в .dockerignore всегда проверяйте, что все необходимые файлы копируются в образ.
    Используйте многоэтапную сборку: Если вам нужно исключить большое количество файлов или директорий, можно использовать многоэтапную сборку для создания промежуточных образов с более чистым контекстом.

Дополнительные ресурсы:

    Документация Docker: Официальная документация Docker содержит более подробную информацию о файле .dockerignore.

Заключение

Правильно настроенный файл .dockerignore позволяет оптимизировать процесс сборки Docker-образов, уменьшая их размер и повышая скорость сборки. Следуя приведенным правилам, вы сможете эффективно управлять содержимым своих образов.