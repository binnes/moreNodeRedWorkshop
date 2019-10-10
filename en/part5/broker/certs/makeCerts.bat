c:\OpenSSL-Win64\bin\openssl.exe genpkey -algorithm RSA -out mqtt_ca.key -pass pass:passw0rd -pkeyopt rsa_keygen_bits:2048
c:\OpenSSL-Win64\bin\openssl.exe req -new -x509 -days 3650 -key mqtt_ca.key -passin pass:passw0rd -out mqtt_ca.crt -subj "/O=MoreNodeRED/OU=broker/CN=localhost" -batch
c:\OpenSSL-Win64\bin\openssl.exe genpkey -algorithm RSA -out mqtt_srv.key -pass pass:passw0rd -pkeyopt rsa_keygen_bits:2048
c:\OpenSSL-Win64\bin\openssl.exe req -new -out mqtt_srv.csr -key mqtt_srv.key -passin pass:passw0rd -subj "/O=MoreNodeRED/OU=broker/CN=localhost" -batch
c:\OpenSSL-Win64\bin\openssl.exe x509 -req -in mqtt_srv.csr -CA mqtt_ca.crt -CAkey mqtt_ca.key -CAcreateserial -passin pass:passw0rd -out mqtt_srv.crt -days 3650 -extfile v3.ext
c:\OpenSSL-Win64\bin\openssl.exe rsa -in mqtt_srv.key -out mqtt_srv_npwd.key -passin pass:passw0rd
del mqtt_srv.csr