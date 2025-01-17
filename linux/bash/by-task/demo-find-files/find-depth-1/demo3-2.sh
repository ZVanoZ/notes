#!/bin/bash

#-----------------------------------------------------------------------
# Ищем Файлы в каталоге по маске
#---

echo '@TODO: разобраться как подставить маску в поиск при помощи for..in (пример не рабочий)'

function demo() {
  echo '-- demo'
  inpDir=$1
  findMask=$2

  echo "-- inpDir  : '${inpDir}'"
  echo "-- findMask: '${findMask}'"

  for inpFileName in "${inpDir}/"/${findMask}; do # Работает
    echo "------------"
    echo "inpFileName: '${inpFileName}'"
    if [[ ! -f "${inpFileName}" ]]; then
      echo "@WARN: not a file '${inpFileName}'"
      continue
    fi
    inpFileSize=$(stat -c%s "${inpFileName}")
    echo "file size  : ${inpFileSize} byte"
  done
}

demo '..' '*.{txt,md,sh}'
demo '.'  '*.{txt,md,sh}'

#-----------------------------------------------------------------------
echo -e "\n$(printf '\x2D%.0s' {1..80})"
#-----------------------------------------------------------------------
exit 0
