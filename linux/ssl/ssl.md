
## Как узнать какой тип сертификата в файле?

* Визуальный осмотр:
````
PEM:

    Начинается с строки -----BEGIN CERTIFICATE-----
    Заканчивается строкой -----END CERTIFICATE-----
    
DER:
    Не имеет текстовых заголовков
    Содержит бинарные данные    
    
CER:
    Может содержать один или несколько сертификатов PEM
    Обычно используется для хранения цепочек сертификатов

````
* openssl x509 
````bash
$ openssl x509 -in /etc/apt/keyrings/docker.asc 
# Could not read certificate from /etc/apt/keyrings/docker.asc
# Unable to load certificate

$ openssl x509 -in /etc/apt/keyrings/docker.gpg 
# Could not read certificate from /etc/apt/keyrings/docker.gpg
# 4027AB0FA37F0000:error:1E08010C:DECODER routines:OSSL_DECODER_from_bio:unsupported:../crypto/encode_decode/decoder_lib.c:101:No supported data to decode. Input structure: Certificate
# 4027AB0FA37F0000:error:1608010C:STORE routines:ossl_store_handle_load_result:unsupported:../crypto/store/store_result.c:151:
# 4027AB0FA37F0000:error:1E08010C:DECODER routines:OSSL_DECODER_from_bio:unsupported:../crypto/encode_decode/decoder_lib.c:101:No supported data to decode. Input structure: Certificate
# 4027AB0FA37F0000:error:1E08010C:DECODER routines:OSSL_DECODER_from_bio:unsupported:../crypto/encode_decode/decoder_lib.c:101:No supported data to decode. Input structure: Certificate
# 4027AB0FA37F0000:error:1608010C:STORE routines:ossl_store_handle_load_result:unsupported:../crypto/store/store_result.c:151:
# 4027AB0FA37F0000:error:1608010C:STORE routines:ossl_store_handle_load_result:unsupported:../crypto/store/store_result.c:151:
# 4027AB0FA37F0000:error:1E08010C:DECODER routines:OSSL_DECODER_from_bio:unsupported:../crypto/encode_decode/decoder_lib.c:101:No supported data to decode. Input structure: Certificate
# 4027AB0FA37F0000:error:1608010C:STORE routines:ossl_store_handle_load_result:unsupported:../crypto/store/store_result.c:151:
# 4027AB0FA37F0000:error:1608010C:STORE routines:ossl_store_handle_load_result:unsupported:../crypto/store/store_result.c:151:
# 4027AB0FA37F0000:error:1E08010C:DECODER routines:OSSL_DECODER_from_bio:unsupported:../crypto/encode_decode/decoder_lib.c:101:No supported data to decode. Input structure: Certificate
# 4027AB0FA37F0000:error:1608010C:STORE routines:ossl_store_handle_load_result:unsupported:../crypto/store/store_result.c:151:
# Unable to load certificat

````