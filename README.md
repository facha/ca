# Certificate Authority

Minimalistic bash scripts for CA management and certificate generation.

## Scripts

1. **`create-ca.sh`** - Creates root CA with hardcoded defaults
2. **`create-cert.sh`** - Generates key and csr with subject and SANs; Create pem certificate out of csr and key files

## Usage

```bash
# Create CA
./create-ca.sh

# Create certificate
./create-cert.sh example.com www.example.com mail.example.com api.example.com
```

## Resulting Files

```
$ tree
.
├── LICENSE
├── README.md
├── ca
│   ├── ca.key
│   ├── ca.pem
│   └── ca.srl
├── certs
│   ├── example.com.csr
│   ├── example.com.key
│   └── example.com.pem
├── create-ca.sh
└── create-cert.sh


$ openssl x509 -noout -text -in ca/ca.pem 
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
            49:4e:d2:47:ea:19:7c:2d:07:e5:ea:97:58:1b:52:f4:64:25:95:4b
        Signature Algorithm: sha256WithRSAEncryption
        Issuer: C=US, O=Example Inc, CN=Local Root CA
        Validity
            Not Before: Aug  5 15:25:22 2025 GMT
            Not After : Aug  3 15:25:22 2035 GMT
        Subject: C=US, O=Example Inc, CN=Local Root CA
...
        X509v3 extensions:
...
            X509v3 Basic Constraints: critical
                CA:TRUE
...


$ openssl x509 -noout -text -in certs/example.com.pem 
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
            6c:f5:78:15:a0:fb:cf:03:60:6c:e3:6e:43:6c:75:e9:d2:43:5f:8f
        Signature Algorithm: sha256WithRSAEncryption
        Issuer: C=US, O=Example Inc, CN=Local Root CA
        Validity
            Not Before: Aug  5 15:25:23 2025 GMT
            Not After : Aug  3 15:25:23 2035 GMT
        Subject: C=US, O=Example Inc, CN=example.com
...
        X509v3 extensions:
            X509v3 Subject Alternative Name: 
                DNS:example.com, DNS:www.example.com, DNS:mail.example.com, DNS:api.example.com
...

```
