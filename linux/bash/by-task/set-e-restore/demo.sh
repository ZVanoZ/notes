#!/bin/bash

get_errexit()
{
  local errexit_state=$(set -o | grep 'errexit off')
  echo ${errexit_state};
}
get_errexit
show(){
#  echo "???: $(set -o | grep errexit)"
  local res='F'
  if [[ "$-" == *e* ]];then
    res='T'
  fi;
  echo "now set -e is: $res"
}


#
#show
#set -e
#show
#set +e
#show
