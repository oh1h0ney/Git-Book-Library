# 连接 MySQL 数据库返回错误提示 ERROR 2003 (HY000): Can't connect to MySQL server

出现2003错误是防火墙没设置好，只需要要防火墙中将3306端口放行即可，解决方法为在终端中输入如下命令：

1.  `firewall-cmd --zone=public --add-port=3306/tcp --permanent`
2. `systemctl restart firewalld`

