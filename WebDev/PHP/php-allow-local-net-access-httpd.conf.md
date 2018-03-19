# PHP 允许局域网通过 IP 访问

在电脑上运行 PHP 环境时，局域网内的设备不能通过 IP 地址访问到本机的 PHP 项目，这是由于 Apache 的设置并没有对除本机外的 IP 放行的缘故，还需要对  Apache 的配置文件做一番修改。

#### 修改 Apache2\conf\httpd.conf

将

<Directory />
    AllowOverride none
    Require all denied
</Directory>

改为

<Directory />
    AllowOverride All
    Allow from 192.168.2.*
    Require all granted
</Directory>



#### 在 Apache2\conf\httpd-vhosts.conf 中新增

<VirtualHost 192.168.2.125>
	DirectoryIndex a.php
	ServerName "192.168.2.125"
	DocumentRoot "D:\Software\UPUPW_AP7.0\htdocs\vhost"
</VirtualHost>

其中 192.168.2.125 为运行 PHP 项目的主机 IP 地址

DirectoryIndex 为主页文件

DocumentRoot  为网页所在目录



配置基本完成，还有最重要的一点就是重启 apache 服务

重启 apache 后 在网址上输入你的局域网 IP 地址 如：192.168.2.125 就可以正常的使用了。