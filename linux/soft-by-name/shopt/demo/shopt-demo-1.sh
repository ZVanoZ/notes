#!/bin/bash

clear
echo "# RUN_AT: $(date +"%Y-%m-%dT%H:%M:%SZ")"

set -e
echo "1: $(shopt -o | grep 'errexit')"
shopt -o | grep 'errexit'
