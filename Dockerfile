FROM certbot/certbot:latest

RUN pip install --no-cache-dir -U git+https://github.com/hsmade/certbot-dns-transip
