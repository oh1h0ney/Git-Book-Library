#  Mapping onedrive as local disk at explorer

个人网盘功能纷纷关闭的时候，我们除了可以自建 Nas 服务器、把数据统统备份到大容量硬盘 / 移动硬盘外，能够使用的办法真就不多了。不过大家也别太悲观，就算网盘都关闭了，还有微软免费给的 OneDrive（5GB）能凑合凑合。

但是捏，大家都懂的，凡是自带的应用都是蠢萌蠢萌的，在它默认文件夹 C:\Users \ 用户名 \ OneDrive 内，操作时对网络和耐心都是一项考验，不改造一下还真不如百度云盘（唯一的好处就是能跟着微软账户带着文件到处走）。

来，大家先到 https://onedrive.live.com/about/zh-cn / 登录下自己的微软账号（没有的抓紧注册，从 Win8 开始微软账号的重要性就已经大于 Win 产品序列号）。

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/mapping-onddrive-as-local-disk-at-explorer-1.png)

登录后，注意浏览器上显示的地址，以小编自己的 OneDrive 地址为例，https://onedrive.live.com/?cid=31ed82c670ea74d1，我们需要记录的就是 “cid=” 后面的那串字符“31ed82c670ea74d1”。

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/mapping-onddrive-as-local-disk-at-explorer-2.png)

双击进入 “此电脑”，点击 “映射网络驱动器”。

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/mapping-onddrive-as-local-disk-at-explorer-3.png)

选择一个暂时不会使用的盘符，在文件夹处填入 https://d.docs.live.net / 字符串（就是网页中 cid = 后面的字符）后等待提示，输入微软账号和密码（此处根据网络状况有可能耗时较长，一定要耐心些）。

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/mapping-onddrive-as-local-disk-at-explorer-4.png)

成功了就会在 “此电脑” 出现新的网络磁盘分区。

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/mapping-onddrive-as-local-disk-at-explorer-5.png)

之后大家便可以像使用本地磁盘一样来使用 OneDrive 磁盘空间了，有什么要上传到云端的文件直接丢进去就行，而且所有文件都存储在云端，不必担心同步下来会占用本地磁盘空间。默认映射好的 OneDrive 盘名称是你的 OneDrive 账户 ID，看着不顺眼按 F2 直接改名就行了喽。

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/mapping-onddrive-as-local-disk-at-explorer-6.png)

-----

转载自 电脑爱好者公众号