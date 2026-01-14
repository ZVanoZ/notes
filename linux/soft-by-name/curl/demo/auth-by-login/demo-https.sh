MY_URL='https://localhost:9200'
MY_LOGIN='admin1'
MY_PASS='aSupperCompleXpas12!!'

#------------------------------------------------------------------------------
# Через аргумент -u
#--

#-- ВКЛЮЧЕНА проверка сертификата
echo '-- SSL check'
curl -v \
  -X GET \
  -u "${MY_LOGIN}:${MY_PASS}" \
  "${MY_URL}"

#-- ОТКЛЮЧЕНА проверка сертификата
# См. ../../curl-help-all.txt
# -k, --insecure           Allow insecure server connections
#     --interface <name>   Use network INTERFACE (or address)
echo '-- SSL SKIP (Allow insecure server connections)'
curl -v -k \
  -X GET \
  -u 'admin:aSupperCompleXpas12!!' \
  "https://localhost:9200/_cluster/health?pretty"

#------------------------------------------------------------------------------