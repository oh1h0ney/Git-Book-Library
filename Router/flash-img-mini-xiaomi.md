# 小米路由器mini刷固件17.2.7

1. 刷开发板固件
  必须刷开发板，稳定版不能刷机
      1. 用miwifi.com 管理页面手动升级
      2. 用 U 盘制作升级
        1. 在miwifi.com官网下载路由器对应的ROM包，并将其放在U盘的根目录下，命名为miwifi.bin
        2. 断开小米路由器mini的电源，将U盘插入路由器的USB接口
        3. 按下reset按钮后重新接入电源，待指示灯变为黄色闪烁状态后松开reset键
        4. 等待5~8分钟，刷机完成之后系统会自动重启并进入正常的启动状态（指示灯由黄灯常亮变为蓝灯常亮），此时，说明刷机成功完成！
        5. 这时可以访问192.168.31.1或miwifi.com访问路由器。
        6. 如果出现异常/失败/U盘无法读取状态，会进入红灯状态，建议重试或更换U盘再试。
2. 开启SSH
    1. 在http://www1.miwifi.com/miwifi_open.html 中的开启SSH工具中获取路由器的 SSH root 密码
    2. 下载开启SSH工具包：
      https://d.miwifi.com/rom/ssh
    3. 将下载的工具包bin文件复制到U盘（FAT/FAT32格式）的根目录下，保证文件名为miwifi_ssh.bin（注意删除U盘中开发版的bin）；
    4. 断开小米路由器mini的电源，将U盘插入路由器的USB接口
    5. 按下reset按钮后重新接入电源，待指示灯变为黄色闪烁状态后松开reset键
    6. 等待3-5秒后安装完成之后，小米路由器会自动重启,大约2分钟后指示灯变蓝，之后您就可以尽情折腾啦。
3. 刷入 Breed
    1. 下载小米mini专用breed-mt7620-xiaomi-mini.bin
    2. 将breed-mt7620-xiaomi-mini.bin改名为breed.bin并拷入U盘根目录中（注意删miwifi_ssh.bin），插入路由器，重启；
    3. 打开 PuTTy 或 XShell ，输入 
      >ssh root@192.168.31.1 并回车

    4. 输入之前获取到的 SSH root 密码
    5. 连接成功后，输入
    >   mtd -r write /extdisks/sda1/breed.bin Bootloader

    6. 刷入后，机器会重新启动，指示灯变蓝，固定电脑的IP为192.168.1.100
4. 进入 Breed 刷写固件
    1. 用硬物顶住mini的reset键开机，等到mini的黄灯狂闪的时候，松开reset键，电脑上输入192.168.1.1，就进入不死uboot的控制台了，在该控制台下，就可以刷潘多拉等任意固件了（固件格式可为　bin 或 trx 或 其他兼容格式）；
    2. 如果刷回原厂固件，进入 固件启动设置 页面，将固件类型选择为 小米 Mini 保存，然后就可以完美启动小米 Mini 原厂固件了，而且可以使用串口 (TTL) 登录。

---
参考链接
-

[小米mini刷PandoraBox详细教程(网易博客)](http://aswordok.blog.163.com/blog/static/321636642016121104255266/)

[小米路由器mini刷机](http://www.miui.com/thread-2036705-1-1.html)

[MiWifi 开发平台](http://www1.miwifi.com/miwifi_open.html)

[恩山 H 大Padavan](http://www.right.com.cn/forum/thread-161324-1-1.html)

[Breed 专贴](http://www.right.com.cn/forum/thread-161906-1-1.html)

[Breed 地址](192.168.1.1)

[Padavan 管理页面](192.168.123.1)

Padavan 管理用户名 admin admin