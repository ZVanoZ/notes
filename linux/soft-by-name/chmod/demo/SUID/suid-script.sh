#!/bin/bash

set -e

echo "$(printf '\x2D%.0s' {1..80})"
echo '${BASH_SOURCE[0]} : '${BASH_SOURCE[0]}
echo '${PWD}            : '${PWD}

echo '-- id     :' && id
echo '-- ls -la :' && ls -la

echo '-- change dir'
cd tmp-root
echo '-- pwd    :' && pwd
echo '-- ls -la :' && ls -la
echo '-- demo-file.txt:'
cat demo-file.txt

echo "$(printf '\x2D%.0s' {1..80})"
