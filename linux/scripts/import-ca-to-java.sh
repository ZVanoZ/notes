#!/usr/bin/env bash
#------------------------------------------------------------------------------
# Скрипт импортирует самоподписной сертификат в хранилище Java.
# Предположительно, это поможет запускать self-signed приложения в Java.
#-----
currentScriptDir=$(dirname $(readlink -e $0))
#jreDir=$PWD
jreDir=~/opt/jre/jre1.8.0_40
jreSecurityDir=${jreDir}/lib/security
echo 'currentScriptDir:'${currentScriptDir}
echo 'jreDir:'${jreDir}
echo 'jreSecurityDir:'${jreSecurityDir}

keytool -import -trustcacerts -keystore ${jreSecurityDir}/cacerts \
   -storepass changeit -noprompt -alias mycert -file ${currentScriptDir}/keys/ca.crt
#------------------------------------------------------------------------------
