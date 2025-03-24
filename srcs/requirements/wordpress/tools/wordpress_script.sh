#!/bin/bash


MY_PASSWORD=$(cat /run/secrets/my_password)
MY_ROOT_PASSWORD=$(cat /run/secrets/my_root_password)

sleep 10

mkdir -p /var/www/wordpress

chown -R root:root /var/www/wordpress

cd /var/www/wordpress


curl -O  https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar



chmod +x wp-cli.phar



mv wp-cli.phar /usr/local/bin/wp


wp core download --allow-root

wp config create --dbname=$MY_DATABASE_NAME --dbuser=$MY_USER --dbpass=$MY_ROOT_PASSWORD --dbhost=$MY_HOST --allow-root

wp core install --url=$MY_DOMAIN_NAME --title=my_wp_page --admin_user=$MY_USER --admin_password=$MY_ROOT_PASSWORD --admin_email=test@email.com --allow-root

wp user create $MY_REGULAR_USER regular_user@example.com --user_pass=$MY_PASSWORD --role=author --allow-root

wp option update home "https://localhost" --allow-root
wp option update siteurl "https://localhost" --allow-root


wp plugin install redis-cache --activate --allow-root
wp config set --allow-root WP_REDIS_HOST 'redis'
wp redis enable --allow-root


mkdir -p /run/php

chown -R www-data:www-data /run/php

php-fpm7.4 -F