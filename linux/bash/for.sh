#!/bin/bash
#-----------------------------------------------------------------------
echo -e "\n$(printf '\x2D%.0s' {1..80})"
echo "* \$0 (script): <$0>"

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
echo -e "\n$(printf '\x2D%.0s' {1..80})"
echo '-- Demo list files by mask'

echo -e '\n-- search by ls\n'
items=`ls *.sh`
for item in $items
do
  echo "file: '${item}'"
done

echo -e '\n-- search by find'
echo -e '\n---- file path'
items=$(find $PWD -maxdepth 1 -type f -name "*.sh" | sort)
for item in $items
do
  echo "file: '${item}'"
done

echo -e '\n---- file name'
items=$(find $PWD -maxdepth 1 -type f -name "*.sh" -printf '%f ' | sort)
for item in $items
do
  echo "file: '${item}'"
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

echo -e '\n-- Demo get value and execute command text'
for item in "${items[@]}"
do
  echo ''
  echo "command text: <${item}>"
  echo "command result: "
  eval "${item}"
  echo "exec result code: <$?>"
done

#-----------------------------------------------------------------------
echo -e "\n$(printf '\x2D%.0s' {1..80})"
#-----------------------------------------------------------------------
exit 0
