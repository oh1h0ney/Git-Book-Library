# Magento 部署

[TOC]
## 环境准备
1. Centos 8  
2. Oneinstack nginx + php7.2 + MySQL 8.0  
    Oneinstack 是安装 LNMP 的软件，它的使用方法可以去 Oneinstack 的[官网](https://oneinstack.com/auto/)查看，现在可以根据选择所需要安装的项目获取安装的脚本。  

## 1. PHP

1. 安装 extention: fileinfo

    oneinstack: ./install.sh --php_extensions fileinfo

2. 启用 proc_open,proc_get_status
    1. vi /usr/local/php/etc/php.ini
    2. 在 disable_functions 处删除这两个内容，重启 php-fpm
## 2.安装 Java,jdk
```
yum search java | grep -i --color JDK
yum install java-1.8.0-openjdk-devel.x86_64
yum install java-11-openjdk.x86_64  如果有其他版本最好删除，避免意外的问题
vi /etc/profile 在最后面追加
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.8.10-0.el8_2.x86_64
export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$PATH:$JAVA_HOME/bin 注意去 /usr/lib/jvm/ 查看具体的版本
source /etc/profile
java -version 
```

## 3.安装 elasticsearch(Docker) 
1. docker pull docker.elastic.co/elasticsearch/elasticsearch:7.9.2
2. 安装 screen,yum -y install screen
3. 运行 screen 创建 docker 窗口,screen -S docker  (恢复命令：screen -r dokcer)
4. 运行 elasticsearch
docker run -p 9200:9200 -p 9300:9300 --restart=always -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.9.2
5.访问服务器 IP：9200，出现以下内容既为安装运行成功
```
{
  "name" : "f3b152a92013",
  "cluster_name" : "docker-cluster",
  "cluster_uuid" : "sNW3ZeEzTnaDmFRoDnQ9mw",
  "version" : {
    "number" : "7.9.2",
    "build_flavor" : "default",
    "build_type" : "docker",
    "build_hash" : "d34da0ea4a966c4e49417f2da2f244e3e97b4e6e",
    "build_date" : "2020-09-23T00:45:33.626720Z",
    "build_snapshot" : false,
    "lucene_version" : "8.6.2",
    "minimum_wire_compatibility_version" : "6.8.0",
    "minimum_index_compatibility_version" : "6.0.0-beta1"
  },
  "tagline" : "You Know, for Search"
}
```  
6. 关掉终端窗口，新建一个窗口连接到服务器，因为 elasticsearch docker 会持续输入日志，将终端关掉重新连接 elasticsearch 依然会在后台运行。
## 4.下载 Magento
    1. cd /data/wwwroot/default/magento  
    2. wget https://download.magentochina.org/magento/2/2.3.X/Magento-CE-2.3.1-2019-03-18-06-28-13.tar.gz  
## 5.解压 Magento
1. 解压  
    tar xf Magento-CE-2.3.1-2019-03-18-06-28-13.tar.gz  
2. 修改配置文件  
    1. vi vendor/magento/framework/DB/Adapter/Pdo/Mysql.php  
    2. 定位到 1849 行，将以下代码进行修改  
    ```  
    修改前  
    case 'tinyint':  
    case 'smallint':  
        return Table::TYPE_SMALLINT;  
    case 'mediumint':  
    case 'int':
        return Table::TYPE_INTEGER;
    修改后
    case 'tinyint':
    case 'smallint':
    **case 'smallint unsigned':**
        return Table::TYPE_SMALLINT;
    case 'mediumint':
    case 'int':
    **case 'int unsigned':**
        return Table::TYPE_INTEGER;
    ```
## 6. 创建数据库
    在 MySQL 中新建 magento 数据库
## 7. 命令行安装 Magento（此命令目前仅做记录，正确格式还在研究）
php bin/magento setup:install  
--base-url="http://localhost/"   
--db-host="localhost"  
--db-name="magento"  
--db-user="root"  
--db-password="dbpassword"  
--admin-firstname="Admin"  
--admin-lastname="Admin"  
--admin-email="example@mail.com"  
--admin-user="admin"  
--admin-password="passW0rd"  
--language="en_US"  
--currency="USD"  
--timezone="America/Chicago"  
--use-rewrites="1"  
--backend-frontname="backend"

## 问题
1. [After installing, images and stylesheets do not load; only text displays, no graphics](https://support.magento.com/hc/en-us/articles/360032994352?_ga=2.144556085.1486798061.1603281344-1064637223.1603281344)

## 参考资料
1.  [Magento 官方安装教程](https://devdocs.magento.com/guides/v2.3/install-gde/install/get-help.html)
2. [Magento 中文社区下载安装教程](https://www.magentochina.org/download-install/)