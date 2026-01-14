MY_URL='http://localhost:9200'
MY_TOKEN='token-123'

curl -v ${MY_URL} \
  -H "Authorization: Bearer ${MY_TOKEN}" \
  -H 'Accept: application/json'
