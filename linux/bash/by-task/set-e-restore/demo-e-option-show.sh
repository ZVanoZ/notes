#!/bin/bash

clear
echo "# RUN_AT: $(date +"%Y-%m-%dT%H:%M:%SZ")"
echo "# @see: ../../soft-by-name/set/set-help.txt"

echo "#    : '$-'"
set -e
echo "#  -e: '$-'"
set -u
echo "#  -u: '$-'"
set +u
echo "#  +u: '$-'"
set +e
echo "#  +e: '$-'"
