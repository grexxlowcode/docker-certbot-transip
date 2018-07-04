FROM certbot/certbot:latest

RUN apk add --no-cache --virtual .transip-build \
        git \
    && pip install --no-cache-dir -U git+https://github.com/hsmade/certbot-dns-transip \
    && apk del .transip-build
