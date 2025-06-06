#!/bin/bash

do_demo(){
  local folder='./test-folder'
  local find_mask="$1"
  echo ""
  echo "#-- folder   : '${folder}'"
  echo "#-- find_mask: '${find_mask}'"
  echo "#-- cmd: '${cmd}'"
  local items=$(find "${folder}/" -type f -name "${find_mask}" | sort)
  echo '# ${items}     :' "'${items}'"
  echo '# ${#items[@]} :' "'${#items[@]}'"
  if [ '' == "${items}" ]; then
    echo "# @INFO: items NOT found."
  else
    echo "# @INFO: items WAS found."
  fi
  for item in $items ;do
    echo "# item '${item}'"
  done
}

do_demo "will-be-found-*.txt"
do_demo "will-be-found-*.invalid-extension"