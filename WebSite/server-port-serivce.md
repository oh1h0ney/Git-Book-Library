# 主要介绍当前服务器端口所搭载的服务



wget -N --no-check-certificate https://softs.fun/Bash/caddy_install.sh && chmod +x caddy_install.sh && bash caddy_install.sh install http.filemanager

## 1066

KMS 服务器

可以自行设置 VPS IP 为 KMS 服务器，进行自助激活。
密钥文末。

## 8088 

谷歌镜像



echo ":8088 {
 gzip
 proxy / https://www.google.com.hk
}" > /usr/local/caddy/Caddyfile
/etc/init.d/caddy restart



## 8089

简易下载站



echo ":8089 {
 root /data/wwwroot/default/Upload
 browse
 timeouts none
 gzip
}" > /usr/local/caddy/Caddyfile
/etc/init.d/caddy restart



## 8090

私人云盘



echo ":8090 {
 root /data/wwwroot/default/Upload
 timeouts none
 gzip
 filemanager / /data/wwwroot/default/Upload {
  database /usr/local/caddy/filemanager.db
 }
}" > /usr/local/caddy/Caddyfile
/etc/init.d/caddy restart

## 8093 

owncloud



### 8094

Frps Bind port

> wget --no-check-certificate https://raw.githubusercontent.com/clangcn/onekey-install-shell/master/frps/install-frps.sh -O ./install-frps.sh chmod 700 ./install-frps.sh ./install-frps.sh install

> [common]
> server_addr = meadow.online
> server_port = 8094
> token = 6v#Home*7v
>
> [ssh]
> type = tcp
> local_ip = 127.0.0.1
> local_port = 22
> remote_port = 6000
>
> [pc]
> type = http
> local_ip = 127.0.0.1
> local_port = 80
> use_encryption = false
> use_compression = false
> subdomain = pc
> custom_domains = meadow.online

winsw.exe

winsw.xml

 <service>

     <id>frp</id>
     
     <name>frp</name>
     
     <description> 用 frp 发布本地电脑网站到外网 </description>
     
     <executable>frpc</executable>
     
     <arguments>-c frpc.ini</arguments>
     
     <logmode>reset</logmode>

 </service>

### 8095

Frps Dashboard port

![](D:\Document\System\Desktop\Frps-Config.png)