```shell
type docker &>docker-type.txt
man docker&>docker-man.txt
docker --version &>docker-version.txt
docker --help &>docker-help.txt
docker info &>docker-info.txt

sudo dpkg -i docker     &> docker-dpkg-i.txt
dpkg --status docker    &> docker-dpkg-status.txt
apt info docker         &> docker-apt-info.txt

docker run --help  &>docker-run-help.txt
docker exec --help  &>docker-exec-help.txt
docker ps --help  &>docker-ps-help.txt
docker build --help  &>docker-build-help.txt
docker inspect --help  &>docker-inspect-help.txt
```
