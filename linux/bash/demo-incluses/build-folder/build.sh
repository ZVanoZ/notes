#!/bin/bash
#-----------------------------------------------------------------------
printf '=%.0s' {1..10} && echo ""
echo "* BASH_SOURCE[0]    : <${BASH_SOURCE[0]}>"
echo "* script dirname    : <$(dirname "${BASH_SOURCE[0]}")>"
echo "* script basename   : <$(basename "${BASH_SOURCE[0]}")>"
echo "* \$0 (main script) : <$0>"
#-----------------------------------------------------------------------
# Сохраняем текущую директорию (она будет использована для считывания переменных)
baseDir=$PWD

# Сохраняем директорию текущего скрипта
scriptDir=$(dirname $(readlink -e $0))

#-----------------------------------------------------------------------

appEnv=''
export appEnv=${appEnv}

repoUrl=''
export repoUrl=${repoUrl}

repoUser=''
export repoUser=${repoUser}

repoPass=''
export repoPass=${repoPass}
#-----------------------------------------------------------------------
function setEnv() {
  local dir=$1
  local setEnvScript=$(realpath "${dir}/set-env.sh")
  if [ ! -f ${setEnvScript} ]; then
    echo ${scriptTag}"Include script '${setEnvScript}'. Script not found, stop find others."
    return 0
  else
    echo ${scriptTag}"Include script '${setEnvScript}'."
    . ${setEnvScript}
    dir=${dir}'/..'
    setEnv ${dir}
    return $?
  fi
}
tempDir=''
function onExit() {
  echo '-- onExit hook'
  echo 'Do clean temp files here'
#  if [ 'x'${tempDir} == 'x' ]; then
#    echo 'tempDir is empty'
#  else
#    echo 'tempDir is not empty. remove <'${tempDir}'>'
#    rm -rf ${tempDir}
#  fi
}
trap 'onExit' EXIT
#-----------------------------------------------------------------------
cd './projects/my-project-1/dev'
setEnv `pwd`

echo "* \${appEnv}: <${appEnv}>"
echo "* \${repoUrl}: <${repoUrl}>"
echo "* \${repoUser}: <${repoUser}>"
echo "* \${repoPass}: <${repoPass}>"
#-----------------------------------------------------------------------
exit 0
