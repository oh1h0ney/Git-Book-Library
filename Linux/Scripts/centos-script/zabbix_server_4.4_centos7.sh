#!/bin/bash

## Centos 8 的安装流程不同，不适用于 Centos 8
os_release="empty"
os_version="7"
zabbix_release_version="4.4"
zabbix_service_version="4.4.10"
local_ip="192.168.50.61"
echo ${os_release}
echo ${os_version}
zabbix_release_url="https://mirrors.aliyun.com/zabbix/zabbix/${zabbix_release_version}/rhel/${os_version}/x86_64/zabbix-release-${zabbix_release_version}-1.el${os_version}.noarch.rpm"
zabbix_agent_url="https://mirrors.aliyun.com/zabbix/zabbix/${zabbix_release_version}/rhel/${os_version}/x86_64/zabbix-agent2-${zabbix_service_version}-1.el${os_version}.x86_64.rpm"
zabbix_get_url="https://mirrors.aliyun.com/zabbix/zabbix/${zabbix_release_version}/rhel/${os_version}/x86_64/zabbix-get-${zabbix_service_version}-1.el${os_version}.x86_64.rpm"
zabbix_sender_url="https://mirrors.aliyun.com/zabbix/zabbix/${zabbix_release_version}/rhel/${os_version}/x86_64/zabbix-sender-${zabbix_service_version}-1.el${os_version}.x86_64.rpm"
zabbix_server_mysql_url="https://mirrors.aliyun.com/zabbix/zabbix/${zabbix_release_version}/rhel/${os_version}/x86_64/zabbix-server-mysql-${zabbix_service_version}-1.el${os_version}.x86_64.rpm"
zabbix_web_url="https://mirrors.aliyun.com/zabbix/zabbix/${zabbix_release_version}/rhel/${os_version}/x86_64/zabbix-web-${zabbix_service_version}-1.el${os_version}.noarch.rpm"
zabbix_web_mysql_url="https://mirrors.aliyun.com/zabbix/zabbix/${zabbix_release_version}/rhel/${os_version}/x86_64/zabbix-web-mysql-${zabbix_service_version}-1.el${os_version}.noarch.rpm"

## 安装必要的软件
function install_require_software {
    yum install -y wget net-tools
}

##### 禁用防火墙并禁用 SELINUX #########
function selinux_firewalld {
    echo -e '\033[1;32m 开始禁用防火墙 \033[0m'
    echo -e '\033[1;32m 正在查看 SELINUX 状态 \033[0m'
    getenforce
    echo -e '\033[1;32m 关闭 SELIUNX \033[0m'
    setenforce 0
    echo -e '\033[1;32m 再次查看 SELINUX 状态 \033[0m'
    getenforce
    echo -e '\033[1;32m 修改 SELINUX 配置文件以永久禁用 \033[0m'
    sed -i 's/SELINUX=enforcing/SELINUX=disable/' /etc/selinux/config
    echo -e '\033[1;32m 关闭 firewalld \033[0m'
    systemctl stop firewalld
    echo -e '\033[1;32m 永久禁用 firewalld \033[0m'
    systemctl disable firewalld
}

## 检测并获取系统发行版与版本号
function check_system_release {
    
    check_system_release=`cat /etc/redhat-release | grep "CentOS"`
    echo "Command results are: $check_system_release"
    if [[ $check_system_release =~ "CentOS" ]]
    then
            echo "Your system OS is CentOS"
            os_release="CentOS"
            echo "${os_release}"
    else
            echo "Your version is not CentOS"
            exit
    fi

    if [[ $check_system_release =~ [8.*.*] ]]
    then
            echo "Your Centos version is 8"
            os_version="8"
            echo "${os_version}"
    elif [[ $check_system_release =~ [7.*.*] ]]
    then
            echo "Your Centos version is 7"
            os_version="7"
            echo "${os_version}"
    else
            echo "Your version is not CentOS 8 or 7"
            exit
    fi
}

## 配置阿里 epel 源
function configure_epel {
    if [ $os_version = "8" ]
    then
        echo -e "\033[1;32m 配置 CentOS 8 epel 源 \033[0m"
        yum install -y https://mirrors.aliyun.com/epel/epel-release-latest-8.noarch.rpm
        sed -i 's|^#baseurl=https://download.fedoraproject.org/pub|baseurl=https://mirrors.aliyun.com|' /etc/yum.repos.d/epel*
        sed -i 's|^metalink|#metalink|' /etc/yum.repos.d/epel*
    elif [ $os_version = "7" ]
    then
        echo -e "\033[1;32m 配置 CentOS 7 epel 源 \033[0m"
        wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
        
    else
        echo "Your OS version not CentOS 8 or CentOS 7, skip"
    fi
}

## 配置 zabbix release 源
function configure_zabbix_release {
    echo -e "\033[1;32m 配置 zabbix release \033[0m"
    wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-${os_version}.repo
    yum repolist
}

## 下载安装 Zabbix agent、get、sender、server-mysql、web、web-mysql
function install_zabbix {
    echo -e '\033[1;32m 下载并离线安装 Zabbix  \033[0m'
    wget -P /root/zabbix/temp/ ${zabbix_agent_url} ${zabbix_get_url} ${zabbix_sender_url}
    wget -P /root/zabbix/temp/ ${zabbix_server_mysql_url} ${zabbix_web_url} ${zabbix_web_mysql_url}
    yum localinstall -y /root/zabbix/temp/zabbix*rpm
    echo -e '\033[1;32m 删除下载的源文件 \033[0m'
    rm -rf /root/zabbix/temp/zabbix*rpm
}

## 配置 Zabbix Server
function configure_zabbix_server {
    ##### 配置 Zabbix Server  #####
    echo -e "\033[1;32m 配置 zabbix server \033[0m"
    echo -e "\033[1;32m 备份配置文件 \033[0m"
    cp /etc/zabbix/zabbix_server.conf{,.bak}
    sed -i 's/# ListenPort=10051/# ListenPort=10051\n\nListenPort=10051/' /etc/zabbix/zabbix_server.conf
    sed -i 's/# SourceIP=/# SourceIP=\n\nSourceIP=192.168.50.61/' /etc/zabbix/zabbix_server.conf
    sed -i 's/# DBHost=localhost/# DBHost=localhost\n\nDBHost=192.168.50.61/' /etc/zabbix/zabbix_server.conf
    sed -i 's/DBUser=zabbix/DBUser=zbxuser/' /etc/zabbix/zabbix_server.conf
    sed -i 's/# DBPassword=/# DBPassword=\n\nDBPassword=zabbix/' /etc/zabbix/zabbix_server.conf
    sed -i 's/# DBPort=/# DBPort=\n\nDBPort=3306/' /etc/zabbix/zabbix_server.conf
    echo -e "\033[1;32m 输出配置文件内容 \033[0m"
    cat /etc/zabbix/zabbix_server.conf | grep -v '#' | grep -v '^$'
    echo -e "\033[1;32m 启动 zabbix-server \033[0m"
    systemctl start zabbix-server
    systemctl enable zabbix-server
    echo -e "\033[1;32m 查看 zabbix-server 10051 端口使用情况 \033[0m"
    ss -tunl | grep 10051
}

## 配置 Zabbix Web UI
function configure_zabbix_web {
    echo -e "\033[1;32m 启动并设置开机自启动 Zabbix Web UI \033[0m"
    systemctl enable httpd
    systemctl start httpd
    echo -e "\033[1;32m 查看 zabbix-server web ui 端口使用情况 \033[0m"
    netstat -tunlp | grep 80
    echo -e "\033[1;32m 修改 php 时区 \033[0m"
    sed -i 's/date.timezone =/date.timezone =\ndate.timezone = Asia\/Shanghai/' /etc/php.ini
    echo -e "\033[1;32m 修改 zabbix web ui 时区 \033[0m"
    sed -i 's/# php_value date.timezone Europe\/Riga/# php_value date.timezone Europe\/Riga\n        php_value date.timezone Asia\/Shanghai/' /etc/httpd/conf.d/zabbix.conf
    echo -e "\033[1;32m 配置完成，正在重启服务器，访问 192.168.50.8/zabbix 进入主界面，默认用户名为 Admin，密码为 zabbix \033[0m"
    reboot
}

##### 配置 MariaDB 源
function install_mariadb {
    cat <<EOF > /etc/yum.repos.d/mariadb.repo
[mariadb]
name = MariaDB
baseurl = https://mirrors.tuna.tsinghua.edu.cn/mariadb/yum/10.5/centos${os_version}-amd64
gpgkey=https://mirrors.tuna.tsinghua.edu.cn/mariadb/yum/RPM-GPG-KEY-MariaDB
gpgcheck=1
EOF
    yum repolist

    #####  安装 MariaDB ####
    echo -e '\033[1;32m 安装MariaDB \033[0m'
    yum -y install MariaDB-server MariaDB-client
    systemctl restart mariadb
    systemctl enable mariadb
}

## 配置 MariaDB
function configure_mariadb {
    echo -e "\033[1;32m sets the password of the root user to a desired password. The password used in this case is something \033[0m"
    mysql -e "SET PASSWORD FOR root@localhost = PASSWORD('something');FLUSH PRIVILEGES;"

    echo -e "\033[1;32m  removes all test users, which is one of the steps in the mysql_secure_installation procedure. \033[0m"
    mysql -u root -psomething -e "DELETE FROM mysql.user WHERE User='';"

    echo -e "\033[1;32m restricts remote access to this database \033[0m"
    mysql -u root -psomething -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"

    echo -e "\033[1;32m remove test database \033[0m"
    mysql -u root -psomething -e "DROP DATABASE test;DELETE FROM mysql.db WHERE Db='test' OR Db='test_%';"

    echo -e "\033[1;32m create database zabbix \033[0m"
    mysql -u root -psomething -e "create database zabbix character set utf8 collate utf8_bin;"

    echo -e "\033[1;32m create user zbxuser and password with zabbix, granted to the zabbix database \033[0m"
    mysql -u root -psomething -e "grant all on zabbix.* to 'zbxuser'@'192.168.50.%' identified by 'zabbix';grant all on zabbix.* to 'zbxuser'@'localhost%' identified by 'zabbix';flush privileges;"
}

## 导入初始数据
function uncompress_init_data {
    echo -e "\033[1;32m 解压 zabbix-server-mysql 初始数据 \033[0m"
    if [[ ${os_version} == "8" ]]
    then
        zabbix_server_sql_path="/usr/share/doc/zabbix-server-mysql"
    elif [[ ${os_version} == "7" ]]
    then
        zabbix_server_sql_path="/usr/share/doc/zabbix-server-mysql-${zabbix_service_version}"
    else
        exit
    fi
    gzip -d ${zabbix_server_sql_path}/create.sql.gz
    mysql -u root -psomething zabbix < ${zabbix_server_sql_path}/create.sql

}

### 执行程序 
#check_system_release
install_require_software
selinux_firewalld
configure_epel
install_zabbix
configure_zabbix_release
install_mariadb
configure_mariadb
uncompress_init_data
configure_zabbix_server
configure_zabbix_web