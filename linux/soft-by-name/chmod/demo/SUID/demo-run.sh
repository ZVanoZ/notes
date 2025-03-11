#------------------------------------------------------------------------------
# @TODO: разобраться как сделать поднятие привилегий до root при запуске скрипта от обычного пользователя
# Ключи для поиска информации:
# * Установка бита SUID
# * Изменение бита SUID
#
# Ресурсы:
# * Я есть root. Повышение привилегий в ОС Linux через SUID/SGID
# https://habr.com/ru/companies/jetinfosystems/articles/506750/
#-----

echo "$(printf '\x2D%.0s' {1..80})"
echo '${BASH_SOURCE[0]}                         : '${BASH_SOURCE[0]}

RUN_AT="$(date +%Y-%m-%dT%T.%3N)"
echo "-- run-at:  ${RUN_AT}"

#------------------------------------------------------------------------------
# Подготовка
#-----

echo "created-at: ${RUN_AT}" >./demo-file.txt
sudo mkdir -v tmp-root
sudo mv -v ./demo-file.txt ./tmp-root/
sudo chown -vR root:root tmp-root
sudo chown -vR 000 tmp-root

sudo chmod -v 777       suid-script.sh
#sudo chmod -v 755 suid-script.sh
sudo chown -v root:root suid-script.sh
sudo chmod -v +s        suid-script.sh

#------------------------------------------------------------------------------

# Запуск от текущего пользователя
bash suid-script.sh

#------------------------------------------------------------------------------
