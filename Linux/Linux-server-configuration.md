

centos6.8服务器配置

一.配置阿里云源
    http://mirrors.aliyun.com/help/centos
二.安装java环境
   1.jdk下载
        http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
   2.jdk安装
      (1) 清理系统默认自带jdk
          rpm -qa|grep jdk 查看已安装的jdk
          sudo yum remove XXX（XXX为上一步查到的结果）
      (2) 赋予权限
          sudo chmod 777 jdk-8u131-linux-x64.rpm（jdk-8u131-linux-x64.rpm为下载的jdk名字，我这里是这个）
      (3) 安装
          sudo rpm -ivh jdk-8u131-linux-x64.rpm
      (4) 默认安装路径 usr/java
      (5) 配置环境变量
          sudo vim /etc/profile
          最下方增加
          export JAVA_HOME=/usr/java/jdk1.8.0_131(这里填写jdk安装路径)
          export CLASSPATH=..$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
          export PATH=$JAVA_HOME/bin:$PATH
          :wq 保存退出
          source /etc/profile
   3.jdk验证
     java -version 验证安装是否成功
三.安装Tomcat
    1.Tomcat下载
        http://tomcat.apache.org/download-80.cgi
    2.Tomcat安装
        (1) 解压缩
            sudo tar -zxvf apache-tomcat-8.5.16.tar.gz
        (2) 配置环境变量
            sudo vim /etc/profile
            最下方增加
            export CATALINA_HOME=/developer/apache-tomcat-8.5.16  (这里为Tomcat解压后的路径)
            :wq 保存退出
            source /etc/profile
        (3) 配置UTF-8字符集(解决中文乱码)
            sudo vim /developer/apache-tomcat-8.5.16/conf/server.xml  (前面是tomcat的安装路径)
            找到配置8080默认端口的位置，在xml节点末尾增加URIEncoding="UTF-8"
            <Connector port="8080" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443" URIEncoding="UTF-8" />
    3.Tomcat验证
        cd /developer/apache-tomcat-8.5.16/bin
        执行sudo ./startup.sh
        出现Tomcat started 代表启动成功
        本机访问http://localhost:8080
四.安装Maven
    1.Maven下载
        http://maven.apache.org/download.cgi
    2.Maven安装
        (1) 解压缩
            sudo tar -zxvf apache-maven-3.5.0-bin.tar.gz
        (2) 配置环境变量
            sudo vim /etc/profile
            最下方增加
            export MAVEN_HOME=/developer/apache-maven-3.5.0 (这里为Maven解压后的路径)
            export PATH=$JAVA_HOME/bin:$MAVEN_HOME/bin:$PATH
            :wq 保存退出
            source /etc/profile
    3.Maven验证
        mvn -version
    4.Maven常用命令
        清除：mvn clean
        编译：mvn compile
        打包：mvn package
        跳过单元测试：mvn clean package -Dmaven.test.skip=true
五.ftp服务器（vsftpd）
    1.vsftpd下载安装
        rpm -qa|grep vsftpd 检测是否安装过
        sudo yum -y install vsftpd
    2.创建虚拟用户
        (1) 创建文件夹
        sudo mkdir ftpfile
        (2) 添加匿名用户
        sudo useradd ftpuser -d /ftpfile -s /sbin/nologin
        (3) 修改ftpfile权限
        sudo chown -R ftpuser.ftpuser /ftpfile
        (4) 重设ftpuser密码
         
    3.配置
        (1) cd /etc/vsftpd
        (2) sudo vim chroot_list
        (3) 将虚拟用户添加到此配置中
        (4) :wq 保存退出
        (5) sudo vim /etc/selinux/config 修改SELINUX=disabled
        (6) :wq 保存退出 (如果出现550拒绝访问 执行 sudo setsebool -P ftp_home_dir 1)
        (7) 重启linux
        (8) sudo vim /etc/vsftpd/vsftpd.conf(具体配置请看文档)
    4.防火墙配置
        (1) sudo vim /etc/sysconfig/iptables
        (2) -A INPUT -p TCP --dport 61001:62000 -j ACCEPT
            -A OUTPUT -p TCP --sport 61001:62000 -j ACCEPT
            -A INPUT -p TCP --dport 20 -j ACCEPT
            -A OUTPUT -p TCP --sport 20 -j ACCEPT
            -A INPUT -p TCP --dport 21 -j ACCEPT
            -A OUTPUT -p TCP --sport 21 -j ACCEPT
            添加到防火墙配置中
        (3) :wq 保存退出
        (4) sudo service iptables restart 重启防火墙
    5.vsftpd验证
        (1) sudo service vsftpd restart 
        (2) ifconfig 查看服务器ip
        (3) 浏览器访问ftp://IP地址
        (4) 输入之前创建的用户账号和密码
        (5) 能访问到代表成功(或者使用ftp客户端访问)
六.Nginx安装
    1.Nginx下载安装
        (1) 安装gcc
            yum install gcc
        (2) 安装pcre
            yum install pcre-devel
        (3) 安装zlib
            yum install zlib zlib-devel
        (4) 安装openssl
            yum install openssl openssl-devel
        (5) 下载源码包
            http://nginx.org/en/download.html
        (6) 进入nginx目录执行sudo ./configure
        (7) sudo make
        (8) sudo make install
    2.Nginx常用命令
        (1) 测试配置文件 /usr/local/nginx/sbin/nginx -t
        (2) 启动命令 /usr/local/nginx/sbin/nginx
        (3) 停止命令 /usr/local/nginx/sbin/nginx -s stop 或者 nginx -s quit
        (4) 重启命令 /usr/local/nginx/sbin/nginx -s reload
        (5) 查看进程命令 ps -ef|grep nginx
        (6) 平滑重启 kill -HUP (上个命令查到的PID)
    3.Nginx虚拟域名配置
        (1) 增加防火墙访问权限
            sudo vim /etc/sysconfig/iptables
            -A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT
            :wq 保存退出
            sudo service iptables restart 重启防火墙
        (2) sudo vim /usr/local/nginx/conf/nginx.conf  增加include vhost/*.conf
        (3) 在/usr/local/nginx/conf目录新建vhost文件夹
        (4) 配置host
            sudo vim /etc/hosts
        (5) 创建域名转发配置文件
            server{
                listen 80;
                autoindex on;
                server_name www.mercy.com;
                access_log /usr/local/nginx/logs/access.log combined;
                index index.xml index.htm index.jsp index.php;
                #error_page 404 /404.html;
                if( $query_string ~* ".*[\;'\<\>].*" ){
                    return 404;
                }
                location / {
                    proxy_pass http://127.0.0.1:8080;
                    add_header Access-Control-Allow-Origin *;
                }
            }

            server{
                listen 80;
                autoindex off;
                server_name image.mercy.com;
                access_log /usr/local/nginx/logs/access.log combined;
                index index.xml index.htm index.jsp index.php;
                #error_page 404 /404.html;
                if( $query_string ~* ".*[\;'\<\>].*" ){
                    return 404;
                }
                location ~ /(mmall_feimmall_admin_fe)/dist/view/* {
                    deny all;
                }
                location / {
                    root /ftpfile/;
                    add_header Access-Control-Allow-Origin *;
                }
            }
七.Mysql安装
    1.Mysql安装
        yum -y install mysql-server
    2.字符集配置
        sudo vim /etc/my.cnf
        在[mysqld]节点下添加 
        default-character-set=utf8
        character-set-server=utf8
        :wq 保存退出
    3.Mysql自启动
        chkconfig mysqld on
        chkconfig --list  mysqld(2-5位是on就ok)
    4.防火墙设置
        sudo vim /etc/sysconfig/iptables
        -A INPUT -p tcp -m tcp --dport 3306 -j ACCEPT
        :wq 保存退出
        sudo service iptables restart 重启防火墙
    5.启动
        service mysqld start 或者 /etc/rc.d/init.d/mysqld start
    6.mysql初始化环境配置
        mysql -u root 登录
        select user,host,password from mysql.user;
        set password for root@localhost=password('新密码');
        set password for root@127.0.0.1=password('新密码');
        exit 退出重新登录 mysql -u root -p
        删除匿名用户 select user,host from mysql.user;
        delete from mysql.user where user='';
        flush privileges;
        插入新用户
        insert into mysql.user(Host,User,Password) values("localhost","名字"，password("密码"));
        flush privileges;
        创建数据库
        CREATE DATABASE `数据库名` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
        本地用户赋予所有权限
        grant all privileges on 数据库名.* to '用户名'@localhost identified by '密码' with grant option;
        开通外网所有权限
        grant all privileges on 数据库名.* to '用户名'@'%' identified by '密码' with grant option;

    
    

