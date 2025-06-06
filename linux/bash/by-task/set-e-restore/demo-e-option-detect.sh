#!/bin/bash

# !!!! RAW
# @see https://gist.github.com/zdennis/53de2c110a685436a0dd21e7c45567e8


clear
echo "# RUN_AT: $(date +"%Y-%m-%dT%H:%M:%SZ")"

demo1(){
  echo "# demo1: Выражение с if корректно вычисляет значение 'e'"

  set -e   #off
  echo '# -'
  local e_state='+'
  if [[ "$-" == *e* ]]; then
    e_state="-"
  fi
  echo "e_state: $e_state"

  set +e   #off
  echo '# +'
  local e_state='+'
  if [[ "$-" == *e* ]]; then
    e_state="-"
  fi
  echo "e_state: $e_state"

}
demo1

demo2(){
  echo ''
  echo "# demo2: Выражение в одну строку некорректно вычисляет значение 'e'"
  set -e   #off
  echo '# -'
  res=$([[ "$-" == *e* ]] && echo "-" || echo "+")
  echo "res: $res"

  set +e   #off
  echo '# +'
  res=$([[ "$-" == *e* ]] && echo "-" || echo "+")
  echo "res: $res"
}
demo2
