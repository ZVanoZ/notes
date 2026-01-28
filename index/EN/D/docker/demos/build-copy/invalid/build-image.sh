do_work(){
  local imageNameFull='local.demo.build-copy.invalid:20250216'

  echo '-- build image'
  cmd='docker  --debug build --progress plain'
  cmd+=' --no-cache'
  cmd+=' --build-arg IMAGE_NAME="${imageNameFull}"'
  cmd+=' --tag "${imageNameFull}"'
  cmd+=' --file ./Dockerfile'
  cmd+=' ..'

  echo "cmd: '${cmd}'"
  eval "${cmd}"
}

do_work