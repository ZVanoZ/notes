clear
echo "$0"
echo '-- В этом скрипте разделяем строку на составляющие'
echo ''

echo -e '\n-- IFS в переменные:'
string="фрагмент1;фрагмент2;фрагмент3"
IFS=';' read -r frag1 frag2 frag3 <<< "$string"
echo "frag1: $frag1"
echo "frag2: $frag2"
echo "frag3: $frag3"

echo -e '\n-- IFS в массив:'
IFS=';'
for fragment in $string; do
  echo "fragment: $fragment"
done

echo -e '\n-- При помощи awk:'
echo "$string" | awk -F ';' '{print $1, $2, $3}'
echo "$string" | awk -F ';' '{print $3, $2, $1}'
res=$(echo "$string" | awk -F ';' '{print $3, $2, $1}')
echo "res: '${res}'"


echo -e '\n-- Использование cut: @todo: доделать'
echo "$string" | cut -d';' -f1,2,3
#echo "$string" | cut -d ';' -f3,2,1
#echo "$string" | cut -d ';' -f3 -f2 -f1
#echo "$string" | cut -d ';' -f2
