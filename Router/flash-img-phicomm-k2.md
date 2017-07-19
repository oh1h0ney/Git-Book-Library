# 斐讯 K2 刷固件17.2.8

K2 拿到时官方固件版本是 22.4.5.43，需要降级到 22.4.2.8 才能刷入第三方固件。建议操作之前先将文后的三个文件下载齐全再开始操作。

1. WLAN 口接网线连接到电脑，会自动弹出配置界面。

    如果没有自动弹出，可以手动登陆路由器
    （默认 p.to  或者 phicomm.me 或者 192.168.2.1 ）
2. 降级到 22.4.2.8
    配置好后打开，高级设置----系统设置----手动升级，选择下载好的 22.4.2.8 固件，点击升级。待路由器进度条走完后路由器会自动重启。
3. 重启后打开
> 高级设置----系统设置----备份恢复----浏览-----选择下载的tianbaoha_breed_ssh.dat----点击恢复备份----等待进度条完成(大约需要2分钟)。
> 此时路由器会自动重启，重启以后使用新的管理密码： **tianbaoha** 登陆，如果登陆成功就说明breed和ssh刷好了。
4.  备份 EEROM 

    进入 ：高级设置----系统设置----手动升级----点击下载备份EEPROM
5.  刷固件
    在 高级设置----系统设置----手动升级 中点击浏览选择固件文件，再点击升级即可
6. 刷入不同的第三方固件路由器的管理页面 IP 地址就不一样，本例中的管理地址是 192.168.123.1，默认的用户名和密码都是 admin 

刷了固件之后如果还想换其他的固件可以进入 breed 中重新升级，进入breed 方法如下：

> 路由WAN口的网线拔掉，电脑网线连接路由LAN口，电脑网卡设置为自动获取IP:
> 路由断电3秒----按住复位键不要松手----插入电源----等待5秒松手----浏览器输入192.168.1.1----固件更新----选择固件刷入。

佐须大大的Tomato Phoenix不死鸟固件，大家可以去Tomato Phoenix官网http://tomato.org.cn/ 下载，K2的固件是LLLLW PA Tomato-Phoenix-MT7620-MT7612E-LLLLW-PA-V103@2016-11-21.trx点击固件更新，选择下载好的固件，点升级就OK！

----
参考链接
--
[斐讯K2 V22.X.X.X 新版固件 刷机教程 (开telnet,安装SSH,adbyby,刷breed,华硕Padavan) ](http://www.right.com.cn/forum/thread-191833-1-1.html)

---

附件：
breed+ssh: [tianbaoha_breed_ssh.dat](http://tianbao.sf.net/b/)

降级所需的 22.4.2.8 固件： [SW_K2_703004657_V22.4.2.8.bin](http://pan.baidu.com/s/1boNj9vD)  密码: mja9  或者  [ SW_K2_703004657_V22.4.2.8.bin](https://pan.baidu.com/s/1c14jrCc#list/path=%2F&parentPath=%2F%E6%96%90%E8%AE%AF)

[H 大的华硕固件网盘(K2 的型号是 PSG1208-64M)](https://eyun.baidu.com/s/3kV0JV19#sharelink/path=%2F)

[H 大的华硕固件专贴](http://www.right.com.cn/forum/thread-161324-1-1.html)