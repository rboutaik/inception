FROM    debian:bullseye

RUN     apt update -y && apt upgrade -y

RUN     apt  install redis-server -y

COPY    ./tools/redis_script.sh /redis_script.sh

ENTRYPOINT ["bash", "/redis_script.sh"]