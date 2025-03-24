#!/bin/bash



service mariadb start;

sleep 5


MY_ROOT_PASSWORD=$(cat /run/secrets/my_root_password)


mysql -uroot << EOF
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MY_ROOT_PASSWORD';
FLUSH PRIVILEGES;

CREATE DATABASE $MY_DATABASE_NAME;
CREATE USER '$MY_USER'@'%' IDENTIFIED BY '$MY_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON $MY_DATABASE_NAME.* TO '$MY_USER'@'%';
FLUSH PRIVILEGES;
EOF


mysqladmin -u root -p$MY_ROOT_PASSWORD shutdown

exec mysqld_safe --bind-address=0.0.0.0
