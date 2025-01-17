#------------------------------------------------------------------------------

echo ''
echo "$(printf '\x2D%.0s' {1..80})"
echo '-- $0          : '$0
echo '-- id          : '"$(id)"
echo "-- PWD         : '$PWD'"
echo '--'

function onExit() {
  echo ''
  echo '-- $0          : '$0
  echo "$(printf '\x2D%.0s' {1..80})"
}
trap 'onExit' EXIT

#----------------------------------------------------------------------------

echo '# docker-run-root.sh'