#!/bin/bash
cd $(dirname $(readlink -e $0))

clear
tmpDir=./tmp/demo-1
rm -rfv "${tmpDir}"
mkdir -vp "${tmpDir}/1-dir"
mkdir -vp "${tmpDir}/1-dir/1-1"
touch     "${tmpDir}/1-dir/1.txt"
ls -la    "${tmpDir}/1-dir"

linkPath="$(realpath ${tmpDir}/1-link)"
srcPath="$(realpath ${tmpDir}/1-dir)"
echo "linkPath: ${linkPath}"
# ln -sfnv   "${tmpDir}/1-dir" "1-link" # Работает. В текущем каталоге создает ссылку
#ln -sfnv   "${tmpDir}/1-dir" "$(realpath ${tmpDir}/1-link)"
#ln -sfnv   "${tmpDir}/1-dir" "${linkPath}"
#ln -sfnv -d   "${tmpDir}/1-dir" "${linkPath}"
#ln -sfnv -d   "${srcPath}" "${linkPath}"
ln -sfnv   "${srcPath}" "${linkPath}"
#ln -sfv   "${tmpDir}/1-dir" "${tmpDir}/asdasd"
ls -la    "${tmpDir}"
ls -la    "${tmpDir}/1-link"
ls -laL   "${tmpDir}/1-link"


#tmpDir=./tmp/demo-1
## Создаем каталог
#mkdir -p "${tmpDir}/1-dir"
## Создаем символическую ссылку
#ln -sf "${tmpDir}/1-dir" "${tmpDir}/1-link"
## Проверяем содержимое ссылки
#ls -laL "${tmpDir}/1-link"
