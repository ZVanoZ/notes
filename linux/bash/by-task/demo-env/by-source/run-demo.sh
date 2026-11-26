#!/bin/bash

#-- Если хотим читать из родительского каталога
# . "$(dirname "${BASH_SOURCE[0]}")"/../set-up.sh

#-- Если хотим читать из текущего каталога
. "$(dirname "${BASH_SOURCE[0]}")"/set-up.sh

env | grep TEST_ENV_