# centos7 下使用 yum 安装 mysql

CentOS7 的 yum 源中默认好像是没有 mysql 的。为了解决这个问题，我们要先下载 mysql 的 repo 源。

1. 下载 mysql 的 repo 源

```
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
```

2.  安装 mysql-community-release-el7-5.noarch.rpm 包

```
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
```
安装这个包后，会获得两个 mysql 的 yum repo 源：

```
- /etc/yum.repos.d/mysql-community.repo
- /etc/yum.repos.d/mysql-community-source.repo
```

3.  安装 mysql

```
sudo yum install mysql-server
```

根据步骤安装就可以了，不过安装完成后，没有密码，需要重置密码。

4. 重置密码

重置密码前，首先要登录

```
mysql -u root
```
登录时有可能报这样的错：

```
ERROR 2002 (HY000): Can‘t connect to local MySQL server through socket ‘/var/lib/mysql/mysql.sock‘ (2)
```
原因是 / var/lib/mysql 的访问权限问题。下面的命令把 / var/lib/mysql 的拥有者改为当前用户：

```
sudo chown -R openscanner:openscanner /var/lib/mysql
```
然后，重启服务：

```
service mysqld restart
```
接下来登录重置密码：

```
mysql -u root
mysql > use mysql;
mysql > update user set password=password(‘123456‘) where user=‘root‘;
mysql > exit;
```
5. 开放 3306 端口

```
sudo vim /etc/sysconfig/iptables
```
添加以下内容：

```
-A INPUT -p tcp -m state --state NEW -m tcp --dport 3306 -j ACCEPT
```
保存后重启防火墙：

```
sudo service iptables restart
```
在使用数据库管理工具（如 Navicat）连接到数据库过程中若出现  erro 1130 错误，可通过以下方法解决

![Erro 1130](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Linux/mysql-connect-erro-1130.png)

```
1. use mysql;  
2. update user set host='%' where user = 'root';   
3.flush privileges;  重新尝试远程连接即可成功 
 >  如果在第二步的时候提示，ERROR 1062 (23000): Duplicate entry '%-root' for key 'PRIMARY' ，可通过  	 MySQL> select host from user where user = 'root';  命令在 MySQL 系统中查看是否有一个为 % 的用户，如	 有则再次执行 flush privileges 即可。
```

如若出现 erro 2003 错误是防火墙没有放行数据库默认的 3306 端口，解决方法如下

![Erro 2003](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Linux/mysql-connect-erro-2003.png)

```
1. vi  /etc/sysconfig/iptables
2. -A INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -j ACCEPT（注意：增加的开放 3306 端口的语句一定要在 -A FORWARD -j REJECT --reject-with icmp-host-prohibited之前）
3.  service  iptables restart
```

