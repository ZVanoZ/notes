#!/bin/bash
#------------------------------------------------------------------------------
# Этот скрипт вытягивает кадры из "./inp/*.gif" и
# сохраняет в "./out/<inp-name>/"
#
# Таким образом можно разобраться с содержимым gif
#------------------------------------------------------------------------------

# Создаем входную и выходную директории, если они нужны (можно закомментировать)
# mkdir -p inp out

# Проверяем, есть ли файлы .gif во входном каталоге
shopt -s nullglob
files=(inp/*.gif)

if [ ${#files[@]} -eq 0 ]; then
    echo "В каталоге inp/*.gif не найдено файлов."
    exit 1
fi

for filepath in "${files[@]}"; do
    # Получаем имя файла без пути и расширения
    filename_full=$(basename "$filepath")
    filename_noext="${filename_full%.*}"

    # Создаем целевую директорию для текущего файла
    target_dir="out/${filename_noext}"
    mkdir -p "$target_dir"

    echo "Обработка: $filename_full -> $target_dir/"

    # Извлекаем кадры с помощью ffmpeg
    # -i: входной файл
    # -vsync 0: сохраняет оригинальную частоту кадров / извлекает все кадры
    # %04d.jpg: формат имени кадра с 4 знаками и ведущими нулями (0001.jpg, 0002.jpg и т.д.)
    ffmpeg -i "$filepath" -vsync 0 "$target_dir/%04d.jpg" -y -hide_banner -loglevel error
    mv -v $filepath  "$target_dir/"
done

echo "Готово! Все кадры успешно извлечены."