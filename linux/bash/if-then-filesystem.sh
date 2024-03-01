#!/bin/bash
#------------------------------------------------------------------------------
echo ''
printf '=%.0s' {1..80} && echo ""
echo '-- BEG: script     : '$(realpath "${BASH_SOURCE[0]}")
echo '--    : script-dir : '$(dirname $(realpath "${BASH_SOURCE[0]}"))
echo '--    : pwd        : '$(realpath "${PWD}")
echo ''
#------------------------------------------------------------------------------
function checkPath(){
  local path=$1
  echo "PATH: ${path}"
  if [ -L "${path}" ]; then
    echo "    : LINK"
  else
    echo "    : NOT-LINK"
  fi

  if [ -d "${path}" ]; then
    echo "    : DIR"
  else
    echo "    : NOT-DIR"
  fi
}
#------------------------------------------------------------------------------

cd $(dirname $(realpath "${BASH_SOURCE[0]}"))
pwd

pathLinkSrc="${PWD}/tmp/link-src"
pathLinkDir="${PWD}/tmp/link-dir.lnk"
pathLinkFile="${PWD}/tmp/link-file.lnk"


mkdir "${pathLinkSrc}"
echo "Now is: "$(date +"%Y%m%d") > "${pathLinkSrc}"/testfile.txt

ln -sfv "${pathLinkSrc}" "${pathLinkDir}"
ln -sfv "${pathLinkSrc}/testfile.txt" "${pathLinkFile}"
ls -l "${pathLinkDir}"
ls -l "${pathLinkDir}/"
echo "Update by link at: "$(date +"%Y%m%d") >> ${pathLinkDir}/testfile.txt

checkPath "${pathLinkSrc}"
checkPath "${pathLinkDir}"
checkPath "${pathLinkFile}"


#------------------------------------------------------------------------------
echo ''
echo '-- END: script  : '$(realpath "${BASH_SOURCE[0]}")
echo '--    : pwd     : '$(realpath "${PWD}")
printf '=%.0s' {1..80} && echo ""
echo ''
#------------------------------------------------------------------------------
