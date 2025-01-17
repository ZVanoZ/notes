#!/bin/bash
#-----------------------------------------------------------------------
echo -e "\n$(printf '\x2D%.0s' {1..80})"
echo "* \$0 (script): <$0>"
cd ..

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
echo -e "\n$(printf '\x2D%.0s' {1..80})"
#-----------------------------------------------------------------------
exit 0
