#!/usr/bin/env bash
#------------------------------------------------------------------------------
printf '=%.0s' {1..10} && echo ""
echo "* BASH_SOURCE[0]    : <${BASH_SOURCE[0]}>"
echo "* script dirname    : <$(dirname "${BASH_SOURCE[0]}")>"
echo "* script basename   : <$(basename "${BASH_SOURCE[0]}")>"
echo "* \$0 (main script) : <$0>"

appEnv='DEV'
#------------------------------------------------------------------------------
