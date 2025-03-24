# !/bin/bash

sed -i "s/127.0.0.1/0.0.0.0/g" /etc/redis/redis.conf

redis-server --protected-mode no