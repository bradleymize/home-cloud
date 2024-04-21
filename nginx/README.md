# Creating a CA and client certificates

1. Create the CA key
   ```bash
   ## You will be prompted to set a passphrase. Make sure to set it to something you’ll remember.
   openssl genrsa -des3 -out ca.key 4096
   ```

2. Create the CA
   ```bash
   openssl req -new -x509 -days 3650 -key ca.key -out ca.crt
   ```

3. Create client key and CSR
   ```bash
   openssl req -new -newkey rsa:4096 -nodes \
    -keyout person.key -out person.csr \
    -subj "/CN=Brad"
   ```

4. Create/sign client certificate
   ```bash
   openssl x509 -req -days 1825 -in person.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out person.crt
   ```
   
5. Create PFX file for windows users (and others?)
   ```bash
   openssl pkcs12 -export -out person.pfx -inkey person.key -in person.crt -certfile ca.crt
   ```



example.org. CAA 128 issue "letsencrypt.org"
qualys ssl test
github rbsec sslscan