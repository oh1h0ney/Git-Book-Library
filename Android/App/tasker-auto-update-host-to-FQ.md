# 使用 Tasker 自动更新 Host

## 以下有四种 Host 源，用途略有区别，可以参阅，标题中有 AD 的为去广告的，有 FQ 或 Youtube 的为科学上网的。

此方法只适用于 Android 系统，搭配名为 tasker 的软件使用。（Tasker 是一款很强大的自定义任务软件，可以通过它实现很多手机的自动操作，比如定时静音，定时断网等）

1. 下载 tasker

http://ys-g.ys168.com/574528001/VKtUTVq4J445J298N36/Tasker%20v4.9u3.apk

2. 下载脚本配置：“hosts自动更新2.prj.xml”

https://raw.githubusercontent.com/sy618/hosts/master/%E5%AE%89%E5%8D%93%E8%87%AA%E5%8A%A8%E6%9B%B4%E6%96%B0hosts/hosts%E8%87%AA%E5%8A%A8%E6%9B%B4%E6%96%B02.prj.xml

3. 导入脚本配置：打开软件Tasker，设置菜单→数据→还原→手工备份→选择已下载的“hosts自动更新2.prj.xml”脚本文件路径导入即可。

### 脚本说明：

脚本内建了四种不同任务，可按自己需求使用。

1.纯AD：内置vokins的yhosts AD hosts。
2.纯FQ：内置racaljk的基础数据+sy618的play+YouTube数据
3.方案一，内置vokins AD hosts + sy618 FQ hosts（自用并维护）
4.方案二。内置四个源，使用的是vokins AD hosts+racaljk的基础数据+sy618的play+YouTube数据
5.还原hosts：清空hosts内容。

默认配置：在WiFi下每隔三天自动更新方案一。（有其他需求的可自己去调配。）
方案一或方案二随便选一个使用。


(本文参照 Host 源维护者的说明修改而成，维护作者 github：https://github.com/sy618/hosts)