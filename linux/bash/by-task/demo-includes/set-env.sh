#!/usr/bin/env bash
#------------------------------------------------------------------------------
#printf '=%.0s' {1..10} && echo ""
echo "* BASH_SOURCE[0] : <${BASH_SOURCE[0]}>"
echo "* script dirname : <$(dirname "${BASH_SOURCE[0]}")>"
echo "* script basename: <$(basename "${BASH_SOURCE[0]}")>"
echo "* \$0 (script)   : <$0>"

echo 'This script does not for commit. Also here can include secret settings.'
# For example, include script with a SECRET.
. ~/SECRET/my-project-1/set-env.sh

repoUser='myUserLogin'      # In the SECRET
repoPass='myUserPass'       # In the SECRET
#------------------------------------------------------------------------------
