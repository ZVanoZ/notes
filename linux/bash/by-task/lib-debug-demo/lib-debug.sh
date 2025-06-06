debug_echo(){
  echo "-- debug_echo \$*: '$*'"
  local allow_verbose=$1
  local echo_text=$2
  if [[ ! ${VERBOSE_MODE} =~ ^"${allow_verbose}" ]]; then
    echo "-- @SKIP"
    return
  fi
  echo "${echo_text}"
}