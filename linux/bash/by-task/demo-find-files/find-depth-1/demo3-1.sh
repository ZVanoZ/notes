#!/bin/bash

#-----------------------------------------------------------------------
# Ищем Файлы в каталоге по маске

function demo() {
  echo '-- demo'
  inpDir=$1

  echo "-- inpDir  : '${inpDir}'"
#  echo "-- findMask: '${findMask}'"

  for inpFileName in "${inpDir}"/*.{txt,md,sh}; do # Работает
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

demo '..'
demo '.'

#-----------------------------------------------------------------------
echo -e "\n$(printf '\x2D%.0s' {1..80})"
#-----------------------------------------------------------------------
exit 0
