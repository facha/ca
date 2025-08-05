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
