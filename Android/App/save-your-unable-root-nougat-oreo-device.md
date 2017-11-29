## 拯救你无法root的安卓7.0-8.0 设备



拯救你无法root的安卓7.0-8.0，调教后台应用

原创 2017-11-26 宁静之雨 [宁静之雨](##)

昨天文章讨论了苹果手机越狱的问题，详见：

[iOS 越狱走到头了？](http://mp.weixin.qq.com/s?__biz=MzAwMzczMTQzMg==&mid=2649566863&idx=2&sn=0f0274bb6b43983f9678cad3041c4164&chksm=832f3408b458bd1edad9ca95dd0fa7a3df858bcc482f3ccb0b758549ba9217b4f9127700cff6&scene=21#wechat_redirect)

手机的操作系统，在这十多年里，更新换代多次，越来越趋于成熟，已经有相当大一部分用户，对是否root和是否越狱，不再有强烈需求。

早年几乎奢求的换主题换字体，也由各大厂商出具了相应的原厂方案，虽然有很多的瑕疵，比如字体不能全局替换，更不能多字重，但也算基本满足了多数初级手机控的日常使用，差强人意吧。

另外，厂家把持系统权限，也可以防止大家篡改系统，一方面号称安全，另一方面也是保护自己的运营收入。谷歌安卓亲儿子手机，本身解锁bootloader是非常简单的事情，除了部分运营商要求锁定的以外，一般只要一行代码搞定。而再回来看看小米、华为这种要在线提交解锁申请，并且甚至还需要帐号在手机上已经登录使用N天才能申请，这一系列的障碍，已经把90%以上的耐心不好的朋友，刚刚产生的一点刷机欲望，给折腾没了。

更别说其他的一些牌子，压根就不给你解锁刷机。就连标榜，锤子手机一定会放开bootloader，让大家随便玩机的罗永浩，也把自己的话当屁放了，至今牢牢地把锤子手机的系统级权限握在手里。

因为安卓8.1开发者预览版还不是很稳定，把玩了一阵子之后，我把谷歌Pixel XL刷回了安卓8.0正式版。

同时也想感受一下不root的手机到底能不能玩，我也就没去获取root权限。

然后我发现真的是不能玩，等会马上就root掉了，不然手机要变成咸鱼干了。

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/App/save-your-unable-root-nougat-oreo-device/e13581945ace44d99f61b57abff3854a.jpeg)

在没有root权限的时候，有些厂商官方给出了一些电池优化方案，或者是后台杀进程的方案，如果你已经觉得很好用了，那很后面可能也就不需要看下去了。

先说一下用到的工具，都是响当当的玩意儿，很容易找到：一个是黑域，一个是绿色守护。

需要的环境：电脑+adb工具，有时间的话自己部署一下adb变量，不加也行，在工具根目录下执行命令也可。

什么，看不懂？先百度一下adb命令的用法吧，单独介绍这个太占篇幅。

黑域有所谓的补丁版、社区版、官方版，这里头有很多纠缠，略去不表，咱们只说酷安和GoogePlay里能下载到的官方版本。

这个东西是不需要root权限的，装好之后，按照应用的提示，连接电脑，把指定的一行命令运行一下，手机上就O肩膀K了。

黑域的彻底杀软件的用法，是按recent键调出多任务，然后把app的任务卡片划掉，这个app就被彻底关闭了。

另外好像不需要root也有阻断唤醒的功能（我没验证过），被黑域的应用，无法被其他app静默唤醒。

重点说一下绿色守护。

自身安卓玩机达人，想必都知道Android 绿色应用公约。

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/App/save-your-unable-root-nougat-oreo-device/ed1c67c5eb6343f88a1cbf3b54c09d40.jpeg)

这是由oasisfeng和爱范儿发起的，秉承尊重用户隐私和保护设备体验的共同价值观的公约。

加入公约的app，后台不费电，让手机不卡顿，跟 iPhone 一样省心，这在道义上是一个很伟大的东西。

同样伟大的，就是oasisfeng开发的Greenify绿色守护，许多年过去了，一直在维护，也一直免费，部分不痛不痒的高级功能需要捐赠开启。

绿色守护调教后台的方法，是提前触发手机自带的doze mode（嗜睡模式），让手机深度休眠；以及锁屏后自动杀掉被绿色的应用；还有就是切断应用之间的相互唤醒。

基于Xposed或者root权限下的绿色守护，功能很强大，就不多介绍了。

以安卓8.0为例，讲一下非root状态下，绿色守护能做到什么。

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/App/save-your-unable-root-nougat-oreo-device/5ba8306327e54fd79bbd7201ca6a2936.jpeg)

我们可以通过按右上角的加号，把需要绿色化的应用加入到列表，然后按右下角的休眠按钮一键杀掉所有的应用。

但是，安卓系统现在已经不开放彻底杀掉其他应用的api，绿色守护会引导你去开辅助功能授权，实际原理是调起应用详情页后自动帮你点击强行停止。

Root之后可以做到真正的自动杀，不需要借助辅助功能实现。

而且，不root的情况下，也会自动休眠被你绿色化的应用。在屏幕关闭数分钟后，略微点亮屏幕，完成自动清理后台（应该是借助辅助功能在锁屏状态下自动帮你点击强行停止应用了吧）。

大家不要轻易给可疑的应用授予辅助功能，绿色守护能做到锁屏状态下借助这个权限帮你清理后台应用，但又无需root权限，那么其他可疑的应用能做些什么，就不好说了，非常可怕。

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/App/save-your-unable-root-nougat-oreo-device/1e06261a9d2944d6b525147d2e485bb4.jpeg)

谷歌最近也开始在GooglePlay里下架滥用辅助功能的app，似乎oasisfeng也收到了相关警告，不知道后续能不能沟通下来，万一谈崩，说不定就要被谷歌下架了，毕竟原则上辅助功能是谷歌做出来给身体有缺陷的用户的。

安卓8.0上，绿色守护还可以开启强化的doze mode。安卓系统本身要进入doze mode的要求很苛刻，基本上需要手机完全休眠很久才能触发，但像微信这种老流氓一直在后台请求数据，国内的应用环境很难真正让手机能休眠下来。

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/App/save-your-unable-root-nougat-oreo-device/dc1fd9340501462d92f9265158f65336.jpeg)

绿色守护所做的，应该是降低触发的门槛，手机休眠一会儿就自动进入嗜睡模式，有影响消息接收的情况，就需要把指定应用排除在名单外。

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/App/save-your-unable-root-nougat-oreo-device/346c4e74f6b64b84b9d64b762d7f6bfd.jpeg)

另外就是唤醒追踪，可惜不root的话，安卓8.0上只能追踪是谁唤醒了谁，但不能切断这个流氓唤醒行为。流氓app，以腾讯、百度、阿里等全家桶为首，就是这种你看到了不爽，但又不能把它们怎么样，为所欲为。所以说，不root的手机和咸鱼没什么区别。

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/App/save-your-unable-root-nougat-oreo-device/0d8192475ff94cedbbbdae7a7902116d.jpeg)

但是呢，因为系统限制的一些原因，开启doze模式和唤醒追踪，要么root手机，要么~~曲线救国吧，绿色守护作者给了一份方案，甚至可以重启之后仍然可用辅助功能，不需要重新授权也能自动杀软件。

这个方案在绿色守护的使用说明里，是英文的教程，叫做：

How to grant permissions required by some features on non-root device?

原文大家可以点左下角的阅读原文获取。

拣重点的来讲：

Accessibility service run-on-demand:

adb -d shell pm grant com.oasisfeng.greenify android.permission.WRITE_SECURE_SETTINGS

Aggressive Doze on Android 7.0+ (non-root):

adb -d shell pm grant com.oasisfeng.greenify android.permission.WRITE_SECURE_SETTINGS

Doze on the Go:

adb -d shell pm grant com.oasisfeng.greenify android.permission.DUMP

Aggressive Doze (on device/ROM with Doze disabled):

adb -d shell pm grant com.oasisfeng.greenify android.permission.DUMP

Wake-up Tracker:

adb -d shell pm grant com.oasisfeng.greenify android.permission.READ_LOGS

Wake-up Cut-off: (Android 4.4~5.x)

adb -d shell pm grant com.oasisfeng.greenify android.permission.READ_LOGS

adb -d shell pm grant com.oasisfeng.greenify android.permission.WRITE_SECURE_SETTINGS

大概是说，安装绿色守护后，把手机连电脑，通过adb工具执行以下3个命令：

adb -d shell pm grant com.oasisfeng.greenify android.permission.WRITE_SECURE_SETTINGS

adb -d shell pm grant com.oasisfeng.greenify android.permission.DUMP

adb -d shell pm grant com.oasisfeng.greenify android.permission.READ_LOGS

然后就能开启嗜睡模式和唤醒追踪了，并且重启手机后辅助功能也依然有效。

最后还提到了安卓4.x到5.x还能开唤醒切断，高版本的安卓不可用，要再多输一行命令：

adb -d shell pm grant com.oasisfeng.greenify android.permission.WRITE_SECURE_SETTINGS

卸载绿色守护后以上命令失效，恢复手机出厂设置也可以。