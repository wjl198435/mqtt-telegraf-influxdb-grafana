#!/bin/bash

echo "=> Starting MySQL ..."
find /var/lib/mysql -type f -exec touch {} \; && service mysql start

sleep 5

echo "Creating user"
echo "CREATE DATABASE grafana" | mysql --default-character-set=utf8
echo "CREATE USER '${MYSQL_GRAFANA_USER}' IDENTIFIED BY '${MYSQL_GRAFANA_PW}'" | mysql --default-character-set=utf8
echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_GRAFANA_USER}'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql --default-character-set=utf8

echo "CREATE DATABASE hass_db" | mysql --default-character-set=utf8
echo "CREATE USER 'hass' IDENTIFIED BY 'hass'" | mysql --default-character-set=utf8
echo "GRANT ALL PRIVILEGES ON *.* TO 'hass'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql --default-character-set=utf8

echo "=> Stopping MySQL ..."
/etc/init.d/mysql stop

exit 0

### root 登陆 说明
## 1. 登陆容器 sudo  docker exec -it mysql  /bin/bash
## 2. mysql -u root -p
## 直接回车
