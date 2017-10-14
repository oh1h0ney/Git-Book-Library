# CentOS 下 shadowsocks-libev 一键安装脚本

使用秋水逸冰的一键安装脚本，安装脚本会将 shadowsocks-libev 设置为开机自启，重启 VPS 可自动启动 SS 服务 。

原文地址：[CentOS 下 shadowsocks-libev 一键安装脚本](https://teddysun.com/486.html)

### 安装方法

使用终端以 root 用户连接上 VPS，输入以下命令：

```
wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
chmod +x shadowsocks-all.sh
./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log
```

输入想要设置的 SS 端口号、 SS 密码以及加密协议确认后可自动开始下载文件进行安装。安装完成后，脚本提示如下：

```
Congratulations, Shadowsocks-libev install completed!
Your Server IP:your_server_ip
Your Server Port:your_server_port
Your Password:your_password
Your Local IP:127.0.0.1
Your Local Port:1080
Your Encryption Method:aes-256-cfb

Welcome to visit:https://teddysun.com/357.html
Enjoy it!
```

###  卸载方法

使用 root 用户登录，运行以下命令：

```
./shadowsocks-all.sh uninstall
```

### 运行状查看

```
./shadowsocks-all.sh status
```

### 其他命令

启动：/etc/init.d/shadowsocks start
停止：/etc/init.d/shadowsocks stop
重启：/etc/init.d/shadowsocks restart
查看状态：/etc/init.d/shadowsocks status