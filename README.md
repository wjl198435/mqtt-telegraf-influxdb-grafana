# mqtt-telegraf-influxdb-grafana
Docker compose repo with MQTT, Telegraf, InfluxDB and Grafana.

I used /aiot folder for this setup. If you are going to use an other folder; please update accordingly in docker-compose.yml
# 登陆容器 
 sudo docker exec -it a65f5c049ca0 /bin/bash
# 重置 grafana 密码
 ```
 docker-compose down
 [root@local]# sqlite3 ./data/grafana/grafana.db
 #查看数据库中包含的表
.tables
 
#查看user表内容
select * from user;
 
#重置admin用户的密码为默认admin
update user set password = '59acf18b94d7eb0694c61e60ce44c110c7a683ac6a8f09580d626f90f4a242000746579358d77dd9e570e83fa24faa88a8a6', salt = 'F3FAxVm33R' where login = 'admin';
 
#退出sqlite3
.exit
 ```
 
 
