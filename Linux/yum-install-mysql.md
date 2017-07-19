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
这样从其它客户机也可以连接上 mysql 服务了。