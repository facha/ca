#!/bin/bash
CN=$1
mkdir -p certs
CERT_PATH="certs/$(echo $CN | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9.-]/_/g')"

# Create key
openssl genrsa -out "$CERT_PATH.key" 2048
chmod 600 "$CERT_PATH.key"

# Create certificate request (csr)
echo -e "[req]\ndistinguished_name=req\nreq_extensions=v3_req\n[req]\nCN=$CN\n[v3_req]\nsubjectAltName=$(for san in "$@"; do printf "DNS:$san,"; done | sed 's/,$//')" > /tmp/csr.conf
openssl req -new -key "$CERT_PATH.key" -out "$CERT_PATH.csr" -config /tmp/csr.conf -subj "/C=US/O=Example Inc/CN=$CN"
rm /tmp/csr.conf 

# Create cert from csr and key
openssl x509 -req -in "$CERT_PATH.csr" -CA ca/ca.pem -CAkey ca/ca.key -CAcreateserial -out "$CERT_PATH.pem" -days 3650 -sha256 -copy_extensions copy
