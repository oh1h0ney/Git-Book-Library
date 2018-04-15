## 锐速优化

锐速用于给服务器加速

锐速破解版安装，来自 91 云

PS：锐速不支持 openvz 的服务器，如果你购买的是搬瓦工，一定要注意选择 kvm 而不是 openvz。

脚本一：

- wget -N --no-check-certificate https://github.com/91yun/serverspeeder/raw/master/serverspeeder.sh && bash serverspeeder.sh

备用脚本：

- wget -N --no-check-certificate https://raw.githubusercontent.com/91yun/serverspeeder/master/serverspeeder-all.sh && bash serverspeeder-all.sh

如果提示当前内核不支持安装锐速，可尝试手动修改内核。有风险，操作前请备份 VPS 数据。

修改内核教程如下：

CentOS 6 支持安装锐速的内核：2.6.32-504.3.3.el6.x86_64

CentOS 7 支持安装锐速的内核：3.10.0-327.el7.x86_64

因此修改教程分为两部分

- Centos 6

  ```
  uname -r #查看当前内核版本
  rpm -ivh http://xz.wn789.com/CentOSkernel/kernel-firmware-2.6.32-504.3.3.el6.noarch.rpm
  rpm -ivh http://xz.wn789.com/CentOSkernel/kernel-2.6.32-504.3.3.el6.x86_64.rpm --force	
  ```

  执行命令 “rpm -qa | grep kernel”，查看内核是否安装成功。如果显示你安装的内核版本，表示安装成功。

- Centos 7

  ```
  uname -r #查看当前内核版本
  rpm -ivh http://xz.wn789.com/CentOSkernel/kernel-3.10.0-229.1.2.el7.x86_64.rpm --force
  rpm -qa | grep kernel #查看内核是否安装成功
  ```

更改完成后，重启 VPS 查看是否修改成功

```
reboot #重启VPS
uname -r #当前使用内核版本
```

修改完成后就可以再次执行锐速安装命令尝试安装。