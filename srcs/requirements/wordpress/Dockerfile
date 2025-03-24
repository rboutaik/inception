FROM debian:bullseye

RUN apt-get update

RUN apt-get install -y curl

RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client

RUN sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/wordpress_script.sh /wordpress_script.sh

RUN chmod +x ./wordpress_script.sh

ENTRYPOINT ["./wordpress_script.sh"]
