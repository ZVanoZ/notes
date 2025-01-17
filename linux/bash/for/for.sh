#!/bin/bash
#-----------------------------------------------------------------------
echo -e "\n$(printf '\x2D%.0s' {1..80})"
echo "* \$0 (script): <$0>"
cd ..
#-----------------------------------------------------------------------
echo -e "\n$(printf '\x2D%.0s' {1..80})"
echo -e '-- base array syntax'

items=()
echo -e "\n-- empty array"
echo "-- size  : ${#items[@]}"
echo "-- items : '${items[*]}'"

items+=("item1")
items+=("item2")
echo -e "\n-- filled array"
echo "-- size  : ${#items[@]}"
echo "-- items : '${items[*]}'"

#-----------------------------------------------------------------------

echo -e "\n$(printf '\x2D%.0s' {1..80})"
echo '-- demo iterate array in expr'
for dir in \
  "tmp/dir-0" \
  "tmp/dir-0/dir-1"
do
  echo "* dir <${dir}>"
  ls -l ${dir}
done
#-----------------------------------------------------------------------
echo -e "\n$(printf '\x2D%.0s' {1..80})"
echo '-- demo iterate external array'

items=()
items+=("tmp/dir-0")
items+=("tmp/dir-0/dir-1")

for item in ${items[*]}
do
  echo "item: <${item}>"
done

#-----------------------------------------------------------------------
# @NOTE: commands witch spaces, so algoritm different
echo -e "\n$(printf '\x2D%.0s' {1..80})"
echo '-- demo iterate external array of commands'

items=()
items+=("pwd")
items+=("ls -l tmp/dir-0/dir-1")
items+=("some-invalid-command arg0 arg1")

echo -e '\n-- Demo get index and value'
for itemIndex in "${!items[@]}"
do
  echo "itemIndex: <${itemIndex}>"
  echo "itemValue: <${items[${itemIndex}]}>"
done

#-----------------------------------------------------------------------
echo -e "\n$(printf '\x2D%.0s' {1..80})"
#-----------------------------------------------------------------------
exit 0
