FROM certbot/certbot:latest

RUN apk add --no-cache --virtual .transip-build git \
    && pip install --no-cache-dir -U git+https://github.com/sybrenstuvel/python-rsa git+https://github.com/hsmade/certbot-dns-transip@0.1.4 \
    && echo "0.1.4" > /usr/local/lib/python2.7/site-packages/certbot_dns_transip/.VERSION \
    && apk del .transip-build

