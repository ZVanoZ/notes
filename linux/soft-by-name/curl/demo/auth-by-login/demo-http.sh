MY_URL='http://localhost:9200'
MY_LOGIN='admin1'
MY_PASS='1'

#------------------------------------------------------------------------------
# Через аргумент -u
#--

#curl -v -X GET -u "${MY_LOGIN}:${MY_PASS}" "${MY_URL}"

#------------------------------------------------------------------------------
# Через HTTP заголовок "Authorization"
#--

MY_AUTH_ENCODED=`echo "${MY_LOGIN}:${MY_PASS}" | base64`
echo "MY_AUTH_ENCODED='${MY_AUTH_ENCODED}'"

curl -v ${MY_URL} \
  -H "Authorization: Basic ${MY_AUTH_ENCODED}" \
  -H 'Accept: application/json'

#------------------------------------------------------------------------------