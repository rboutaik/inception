FROM debian:bullseye

RUN apt-get update &&  apt-get install -y nginx openssl


RUN mkdir -p /etc/nginx/ssl && openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MO/ST=KH/L=KH/O=1337/OU=1337/CN=rboutaik.42.fr/UID=rboutaik"

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

