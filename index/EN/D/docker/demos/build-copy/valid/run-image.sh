#docker run --rm -it hello-world bash -c 'pwd; ls -la'

#docker run --rm -it php:8.2-apache bash -c 'pwd; ls -la'

#docker run --rm -it --name local.tmp-container php:8.2-apache

docker run -d --name local.tmp-container php:8.2-apache
docker exec local.tmp-container php:8.2-apache bash -c 'pwd; ls -la'
docker container rm --force local.tmp-container
