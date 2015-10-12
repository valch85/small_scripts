#THIS SETTINGS EXTREMELY NEEDS ON OPENVPN SERVER
=begin
  you need before this create file build-key-pkcs12-v with such content:
#!/bin/sh
export KEY_CN=$1
#export EASY_RSA="${EASY_RSA:-.}"
"/usr/share/doc/openvpn/examples/easy-rsa/2.0/pkitool" --pkcs12 $*
=end
