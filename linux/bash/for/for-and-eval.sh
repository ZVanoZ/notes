#!/bin/bash
#-----------------------------------------------------------------------
echo -e "\n$(printf '\x2D%.0s' {1..80})"
echo "* \$0 (script): <$0>"
cd ..

#-----------------------------------------------------------------------
# @NOTE: commands witch spaces, so algoritm different
echo -e "\n$(printf '\x2D%.0s' {1..80})"
echo '-- demo iterate external array of commands'

items=()
items+=("pwd")
items+=("ls -l tmp/dir-0/dir-1")
items+=("some-invalid-command arg0 arg1")

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
