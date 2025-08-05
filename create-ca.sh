#!/bin/bash
mkdir -p ca
chmod 700 ca
openssl genrsa -out ca/ca.key 4096
chmod 400 ca/ca.key
openssl req -key ca/ca.key -new -x509 -days 3650 -sha256 -out ca/ca.pem -subj "/C=US/O=Example Inc/CN=Local Root CA"
chmod 444 ca/ca.pem
