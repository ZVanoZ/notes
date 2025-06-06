clear
echo "$0"
echo '-- В этом скрипте тестируем команду xargs'

set -e

echo -e '\n-- 1:'
ls -la './' 2> /dev/null              | xargs -I {} echo "* {}"

echo -e '\n-- 2: не выведет ничего потому что каталог не существует'
ls -la './invalid-dir/' 2> /dev/null  | xargs -I {} echo "* {}"