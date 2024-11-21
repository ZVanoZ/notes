#!/bin/bash
# Функция "onExit" будет вызвана при прерывании программы

echo "$(date +'%Y-%m-%dT%H:%M:%SZ') START"
function onExit() {
  echo ""
  echo "$(date +'%Y-%m-%dT%H:%M:%SZ') STOP"
}
trap 'onExit' EXIT

cnr=0
while true; do
    cnr=$((cnr + 1))
    echo  "$(date +'%Y-%m-%dT%H:%M:%SZ') cnr <${cnr}>"
    sleep 1
done