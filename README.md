A combination of https://hub.docker.com/r/certbot/certbot and https://github.com/hsmade/certbot-dns-transip

Usage
-----

Folder structure on host machine
====
Create the following folders on your host machine:
* `/etc/letsencrypt`
* `/var/lib/letsencrypt`
* `/var/log/letsencrypt`

TransIP login information
====
Make sure you have your TransIP username and an API key. Save the API key in RSA format as `/etc/letsencrypt/transip.key`. Make sure to `chmod` it to the correct setting for security!

**NOTE: the key must be in RSA format!**

To create an RSA key from the key you get from TransIP (which is OpenSSL standard format), execute:

`openssl rsa -in transip_original.key -out transip_rsa.key`

`/etc/letsencrypt/transip.ini`
=====
Create the file `/etc/letsencrypt/transip.ini` with the following content (replace `my_username` with your own):

```
certbot_dns_transip:dns_transip_username = my_username
certbot_dns_transip:dns_transip_key_file = /etc/letsencrypt/transip.key
```

Using certbot
-----
Use it as you usually would, but then as follows:

```sh
docker run -it --rm \
-v /etc/letsencrypt:/etc/letsencrypt \
-v /var/lib/letsencrypt:/var/lib/letsencrypt \
-v /var/log/letsencrypt:/var/log/letsencrypt \
grexx/certbot-transip \
certonly --agree-tos -d \*.domain.com --email email@domain.com --server https://acme-v02.api.letsencrypt.org/directory -a certbot-dns-transip:dns-transip --certbot-dns-transip:dns-transip-credentials /etc/letsencrypt/transip.ini --certbot-dns-transip:dns-transip-propagation-seconds 240
```

and to automatically renew:

```sh
docker run -it --rm \
-v /etc/letsencrypt:/etc/letsencrypt \
-v /var/lib/letsencrypt:/var/lib/letsencrypt \
-v /var/log/letsencrypt:/var/log/letsencrypt \
grexx/certbot-transip \
renew
```

Your certificates will be in `/etc/letsencrypt`.