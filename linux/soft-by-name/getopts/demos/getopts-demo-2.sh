# bash getopts-demo.sh -b 'val-b' -a 'val-a'

echo "\$0: <$0>"
echo "\$*: <$*>"


getopts "a:" var_a
getopts "b:" var_b

echo "Значение параметра a: $var_a"
echo "Значение параметра b: $var_b"