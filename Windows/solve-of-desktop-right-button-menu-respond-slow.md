# Windows 桌面右键菜单卡顿的解决方案

在 Windows 桌面点击右键打开菜单速度非常慢的时候，可以尝试使用修改注册表的方式使菜单打开速度恢复正常，具体的操作流程如下：

1. Win + R 打开运行窗口

2. 在运行窗口中输入 regedit，回车确认输入

3. 找到以下路径：

   HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers

4. 将其中 igfxDTCM 项删除

5. 删除后即时生效，回到桌面右击就可以看到效果。如果反应还是非常缓慢，那这个方法不适合，还需要寻找其他解决方案。

操作视频如下：

[solve-of-desktop-right-button-menu-respond-slow.mp4](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/solve-of-desktop-right-button-menu-respond-slow.mp4)