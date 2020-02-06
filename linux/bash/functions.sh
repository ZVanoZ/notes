# Создает символическую ссылку, если она еще не существует
# Аргумент1: источник. Т.е. файл, на который будем ссылаться
# Аргумент2: назначение. Путь к файлу-ссылке, который создаем.
function makeLink() {
  echo '-- makeLink'
  if [[ $# -ne 2 ]]; then
    echo "fail: invalid arguments count"
  else
    inpPath=$1
    outPath=$2
    isForce='FALSE'
    if [ -e $outPath -o -h $outPath ]; then
      echo "skip: "$outPath
    else
      ln -s $inpPath $outPath
      echo "create link: "$outPath
    fi
  fi
}
makeLink '15-xdebug.ini' '/opt/remi/php56/root/etc/php.d/15-xdebug.ini'
