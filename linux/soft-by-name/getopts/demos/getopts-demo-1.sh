# bash getopts-demo.sh -b 'val-b' -a 'val-a'

echo "\$#: <$#>" # Возвращает количество параметров
echo "\$0: <$0>"
echo "\$*: <$*>" # Возвращает все аргументы вызова
echo "\$@: <$@>" # Возвращает все аргументы вызова

while getopts "a:b:" opt; do
  case $opt in
    a)
      var_a="$OPTARG"
      ;;
    b)
      var_b="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

echo "Значение параметра a: $var_a"
echo "Значение параметра b: $var_b"