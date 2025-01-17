#!/bin/bash
#
# Этот пример позволяет перебрать список путей из строки в цикле for..in
#
function demo() {
  echo ''
  echo "$(printf '\x2D%.0s' {1..80})"
  dirs=$1
  comment=$2
  echo "-- dirs   : '${dirs}'"
  echo "-- comment: '${comment}'"
  echo "-----"
  for dir in $(echo "${dirs}" | tr ':' '\n'); do
      echo "'${dir}'"
  done
}
demo '/app/module1:/app/module2' 'OK'
demo '/app/module1/:/app/module2/' 'OK'
demo ' /app/module1 :   /app/module2/  ' 'OK'
demo 'ASS /app/module1 /:   /app/module2   /' 'FAIL: Whitespaces is not allow in path'
demo "${PATH}" 'OK'
