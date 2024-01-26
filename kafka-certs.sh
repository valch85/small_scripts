# Script to renew certificates for Kafka
# Export the certificate and private key into a PKCS12 file.
openssl pkcs12 -export -in server1.company.com.crt -inkey server1.company.com.key -name kafka-01 -out kafka-01.p12

# Import the PKCS12 file into a Java keystore.
keytool -importkeystore -srckeystore kafka-01.p12 -destkeystore kafka.server.keystore.jks -srcstoretype pkcs12

# Import the CA certificate into a Java truststore.
keytool -keystore kafka.server.truststore.jks -alias CARoot -import -file server1.company.com.crt

# Command to test SSL connectivity and verify validity, supply the right key and cert.
openssl s_client -debug -connect kafka-01:30093 -cert server1.company.com.crt -key server1.company.com.key

#1
/usr/bin/openssl pkcs12 -export -in /srv/certs/server1.company.com.crt -inkey /srv/certs/server1.company.com.key -name kafka-01 -out /home/kafka/kafka/certs/kafka-01.p12
/usr/bin/keytool -importkeystore -srckeystore /home/kafka/kafka/certs/kafka-01.p12 -destkeystore /home/kafka/kafka/certs/kafka.server.keystore.jks -srcstoretype pkcs12
/usr/bin/keytool -keystore /home/kafka/kafka/certs/kafka.server.truststore.jks -alias CARoot -import -file /srv/certs/server1.company.com.crt
/usr/bin/openssl s_client -debug -connect server1.company.com :30093 -cert /srv/certs/server1.company.com.crt -key /srv/certs/server1.company.com.key
/usr/bin/chown -R kafka:kafka /home/kafka/kafka/certs/kafka.server.keystore.jks /home/kafka/kafka/certs/kafka-01.p12 /home/kafka/kafka/certs/kafka.server.truststore.jks
/usr/bin/chmod 600 /home/kafka/kafka/certs/kafka-01.p12
/usr/bin/chmod 664 /home/kafka/kafka/certs/kafka.server.keystore.jks
/usr/bin/chmod 664 /home/kafka/kafka/certs/kafka.server.truststore.jks

kafka-check () {
/home/kafka/kafka/bin/kafka-topics.sh --bootstrap-server server1.company.com:30092 --describe --under-replicated-partitions
if [ $? -eq 0 ] 
then 
	echo "reboot kafka"
	exit 0 
else
	kafka-check
fi
}