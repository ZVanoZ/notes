clear
echo "$0"
echo '-- Из массива строк делаем SVN checkout'
echo ''

res=()
data=()
data+=('./libs/my-lib1 -r123 http://my-repo-1.svn.local/lib1/trunk')
data+=('./libs/my-lib2 -r321 http://my-repo-1.svn.local/lib2/trunk')
for item in "${data[@]}"; do
  IFS=' ' read -ra arr <<< "${item}"
  # Проверяем результат
  echo ${arr[0]}   # Выведет: ./libs/my-lib1
  echo ${arr[1]}   # Выведет: -r123
  echo ${arr[2]}   # Выведет: http://my-repo-1.svn.local/lib1/trunk

  res+=("svn export --force ${arr[1]} ${arr[2]} ${arr[0]}")
done

echo -e '\n data:'
echo -e "-- data size  : '${#data[@]}'"
echo -e "-- data items : \n'${data[*]}'"

echo -e '\n res:'
echo -e "-- res size  : '${#res[@]}'"
echo -e "-- res items : \n'${res[*]}'"
for itemIndex in "${!res[@]}"
do
  echo -e "res-index: <${itemIndex}>"
  echo -e "res-value: <${res[${itemIndex}]}>"
done
