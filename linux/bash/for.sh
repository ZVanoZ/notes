#!/bin/bash
#-----------------------------------------------------------------------
printf '=%.0s' {1..80} && echo ""
echo "* \$0 (script): <$0>"

#-----------------------------------------------------------------------
printf '=%.0s' {1..80} && echo ""
echo '== demo iterate array in expr'
for dir in \
  "tmp/dir-0" \
  "tmp/dir-0/dir-1"
do
  echo "* dir <${dir}>"
  ls -l ${dir}
done
#-----------------------------------------------------------------------
printf '=%.0s' {1..80} && echo ""
echo '== demo iterate external array'
items=()
items+=("tmp/dir-0")
items+=("tmp/dir-0/dir-1")
for item in ${items[*]}
do
  echo "\${item}: <${item}>"
done
#-----------------------------------------------------------------------
# @NOTE: commands witch spaces, so algoritm different
printf '=%.0s' {1..80} && echo ""
echo '== demo iterate external array of commands'

items=()
items+=("pwd")
items+=("ls -l tmp/dir-0/dir-1")
items+=("some-invalid-command arg0 arg1")

echo '==== Demo get index and value'
for itemIndex in "${!items[@]}"
do
  echo "\${itemIndex}: <${itemIndex}>"
  echo "\${itemValue}: <${items[${itemIndex}]}>"
done

echo '==== Demo get value and execute command text'
for item in "${items[@]}"
do
  echo "command text: <${item}>"
  echo "command result: "
  eval "${item}"
  echo "exec result code: <$?>"
done


#-----------------------------------------------------------------------
exit 0
