clear
string="Hello;World;!"
echo "-- $0"
echo "-- string: '${string}'"



echo '-- 1.1:'
echo "$string" | cut -d ';' -f3
echo "$string" | cut -d ';' -f2
echo "$string" | cut -d ';' -f1

echo '-- 1.2: todo: разобраться почему не вывело через запятую'
echo "$string" | cut -d ';' -f3,2,1


echo '-- 2:'
echo "$(echo "$string" | cut -d ';' -f3)"
echo "$(echo "$string" | cut -d ';' -f2)"
echo "$(echo "$string" | cut -d ';' -f1)"

echo '-- 3: @todo: разобраться как используя xargs передать в echo раздельными параметрами '
echo "$string" | cut -d ';' -f3 | xargs echo "aaa: $0"
