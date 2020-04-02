FROM certbot/certbot:latest

RUN apk add --no-cache --virtual .transip-build git \
    && pip install --no-cache-dir -U git+https://github.com/sybrenstuvel/python-rsa@version-4.0 git+https://github.com/hsmade/certbot-dns-transip@0.2.6 \
    && echo "0.2.6" > /usr/local/lib/python3.8/site-packages/certbot_dns_transip/.VERSION \
    && apk del .transip-build
