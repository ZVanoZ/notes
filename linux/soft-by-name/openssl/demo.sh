#!/bin/bash

cd $(dirname "${BASH_SOURCE[0]}")

#runAt=`date +%Y-%m-%dT%H:%I:%SZ`
runAt=$(date +"%Y-%m-%dT%H:%I:%SZ")
workdir="tmp/${runAt}"
mkdir -vp "${workdir}"
cd "${workdir}" || exit

awk -v cmd='openssl x509 -noout -subject' '/BEGIN/{close(cmd)};{print | cmd}' < /etc/ssl/certs/ca-certificates.crt > ca-list.txt

openssl s_client -connect 18.165.183.121:443 >  certs-18.165.183.121-list.txt
openssl s_client -connect 18.165.183.112:443 >  certs-18.165.183.112-list.txt
openssl s_client -connect download.docker.com:443 >  certs-download.docker.com-list.txt

openssl s_client -connect 18.165.183.121:443 </dev/null 2>/dev/null | openssl x509 -inform pem -text >  certs-18.165.183.121-tree.txt
openssl s_client -connect 18.165.183.112:443 </dev/null 2>/dev/null | openssl x509 -inform pem -text >  certs-18.165.183.112-tree.txt
openssl s_client -connect download.docker.com:443 </dev/null 2>/dev/null | openssl x509 -inform pem -text >  certs-download.docker.com-tree.txt