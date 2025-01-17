```shell
type docker &>docker-type.txt
man docker&>docker-man.txt
docker --version &>docker-version.txt
docker --help &>docker-help.txt
docker info &>docker-info.txt
#dpkg -i docker &>docker-dpkg-i.txt
apt info docker &>docker-apt-info.txt

docker run --help  &>docker-run-help.txt
docker exec --help  &>docker-exec-help.txt
docker ps --help  &>docker-ps-help.txt
docker build --help  &>docker-build-help.txt
```
