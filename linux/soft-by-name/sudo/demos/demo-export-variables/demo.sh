#-----
# https://stackoverflow.com/questions/8633461/how-to-keep-environment-variables-when-using-sudo
# If you have the need to keep the environment variables in a script you can
# put your command in a here document like this.
# Especially if you have lots of variables to set things look tidy this way.
#-----
# Фиг пойми что автор хотел показать этим скриптом.
# Вижу, что переменные из "tmp-script" не попадают в окружение основного скрипта.
# Вероятно, это и требовалось - изолировать переменные окружения пользователя root
#                               от текущего пользователя.
#                               иначе секреты root могут быть раскрыты.
#-----

# prepare a script e.g. for running maven
runmaven=./tmp/tmp-script$$
# create the script with a here document
cat << EOF > $runmaven
#!/bin/bash
# run the maven clean with environment variables set
pwd
ls -la
export MY_ENV_ANT_HOME=/usr/share/ant
export MY_ENV_MAKEFLAGS=-j4
#mvn clean install
echo '-- script: tmp-script'
env | grep MY_ENV_
EOF
# make the script executable
chmod +x $runmaven
# run it
sudo $runmaven
# remove it or comment out to keep
rm $runmaven
echo '-- script: demo.sh'
env | grep MY_ENV_
