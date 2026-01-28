do_work(){
  local imageNameFull='local.demo.dockerignore-demo:20250216'

  cd docker
  echo '-- build image'
  cmd='docker  --debug build --progress plain'
  cmd+=' --no-cache'
  cmd+=' --build-arg IMAGE_NAME="${imageNameFull}"'
  cmd+=' --tag "${imageNameFull}"'
  cmd+=' --file ./Dockerfile'
  cmd+=' .'

  echo "cmd: '${cmd}'"
  eval "${cmd}"
}

do_work