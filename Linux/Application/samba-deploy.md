# Linux 安装 Samba

## 前情摘要
主要目的是要实现稀有云存储的部署，使用的方案是 公网 IP + DDNS + 端口映射 + Linux Samba + 端口转发

## 

## Multi Port Forwarder

## 操作步骤
### 1. 公网 IP
打电话给运营商，让运营商开通宽带的公网 IP。需要注意的是，在深圳和广州已经无法开通固定的公网 IP，只能是动态的公网 IP，运营商每隔一个时间段会自动重新断网拨号获取新的 IP。
### 2. 动态域名
请使用 DDNS 功能将动态 IP 定时自动更新绑定到域名上。一般路由器都会自带有 DDNS 的功能，否则也可以自行寻找 DDNS 的脚本手动配置定时任务进行更新。我使用的爱快路由器自带的动态域名功能。
### 3. 端口映射
端口映射光猫和路由器都会有相关功能，请认真查找。我使用的是爱快路由器自带的端口映射功能。
### 4. Linux Samba

## 安装注意事项
1. 安装完成后，使用 `netstat -tunlp` 查看端口是否被 Samba 使用。客户端无法连接时，注意防火墙放行 445 端口，如果你需要修改 Samba 端口，同样需要放行。嫌这一步麻烦的，可以直接关闭防火墙（centos 8 关闭防火墙方法只需要两个命令： systemctl disable firewalld, systemctl stop firewalld）
2. [关闭 Selinux](https://blog.csdn.net/qq_41453285/article/details/88539523)
3. Samba 拷贝中断问题（待解决）
4. 千兆网卡速度无法到达千兆