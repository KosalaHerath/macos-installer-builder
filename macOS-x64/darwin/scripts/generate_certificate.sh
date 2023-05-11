openssl genrsa -out local_ca.key 2048
openssl req -x509 -new -nodes -key local_ca.key -sha256 -days 1825 -out myCA.pem -subj "/C=US/ST=CA/O=MyOrg, Inc./CN=My Root CA"
openssl req -new -newkey rsa:2048 -nodes \
    -keyout server.key -out server.csr \
    -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=femr.net"
openssl x509 -req -in server.csr -CA myCA.pem -CAkey local_ca.key -CAcreateserial -out femr.net.crt
