#!/usr/bin/bash
#------------------------------------------------------------------------------
# Скрипт извлекает аудиодорожку из всех видео текущего каталога.
#-----

echo "\$0: <$0>"
echo "\$*: <$*>"

getopts "i:" inpDir
if [ "${inpDir}" == '?' ]; then
  echo "@INFO: force set inpDir"
  inpDir="${PWD}"
else
  echo "@INFO: use inpDir from param"
fi
inpFilesMask="*.{mp4|avi}"

echo "-- inpDir: <${inpDir}>"
echo "-- ls: "
ls -la

echo "-- find: "
for file in $(find . -maxdepth 1 -name  "*.{mp4,avi,mp4}"); do
  echo "-- file: <${file}>"
  continue
  # Получение имени файла без расширения
  filename=$(basename "$file" .{mp4,avi})

  # Получение расширения файла
  extension="${file##*.}"

  # Получение директории файла
  directory=$(dirname "$file")

  # Получение размера файла в байтах
  size=$(stat -c%s "$file")

  # Вывод информации о файле
  echo "Имя файла: $filename"
  echo "Расширение: $extension"
  echo "Директория: $directory"
  echo "Размер: $size байт"
  echo ""
done

#------------------------------------------------------------------------------
