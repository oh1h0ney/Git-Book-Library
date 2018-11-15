# 使用 Windows 自带的还原系统设备还原点

为了让系统在发生不可预知的错误导致系统文件丢失或者不能开机的情况下恢复正常的系统，我们需要使用 Windows 还原中心来给系统设置一个还原点，有了还原点才能在系统不正常的时候将系统恢复为正常的系统，从而不耽误正常的使用。以下是使用方法。本次教程系统版本基于 windows 16299.192。

- 打开还原中心

  Windows 10 系统：打开资源管理器，在左侧我的电脑条目中右击，点属性，在弹出的界面中的左侧选择系统保护

  Window 7 系统 ： 打开控制面板，在控制面板中打开系统保护。

- 设置还原点， 在保护设置下面的框中选择系统盘，比如 C 盘，选中后点击 配置，在弹出的界面中选择启用系统保护，并将下方最大使用量拉到最大，点击确定。然后选择刚刚点击的配置按钮下面的创建按钮，在弹出的界面中输入任意内容并点击确定。步骤图如下：

  - ![1](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/windows-system-backup/windows-system-backup-video-for-backup-1.png)

      打开资源管理器，在左侧面板的我电脑上右击，在弹出的菜单中选择属性

      ​

  - ![2](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/windows-system-backup/windows-system-backup-video-for-backup-2.png) 

      在弹出的窗口左侧点击系统保护

      ​

  - ![3](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/windows-system-backup/windows-system-backup-video-for-backup-3.png)

      在保护设置中选中系统所在盘符，一般为C盘

      ​

  - ![4](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/windows-system-backup/windows-system-backup-video-for-backup-4.png)

      点配置

      ​

  - ![5](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/windows-system-backup/windows-system-backup-video-for-backup-5.png)

      在弹出的界面中选择启用系统保护，并将最大使用量拉到最大

      ​

  - ![6](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/windows-system-backup/windows-system-backup-video-for-backup-6.png)

      点应用

      ​

  - ![7](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/windows-system-backup/windows-system-backup-video-for-backup-7.png)

      点确定，窗口会自动关闭，并显示上一级窗口

      ​

  - ![8](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/windows-system-backup/windows-system-backup-video-for-backup-8.png)

      点击界面中的创建按钮，点击后会弹出创建还原点窗口

      ​

  - ![9](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/windows-system-backup/windows-system-backup-video-for-backup-9.png)

      在对话框中输入任意可以文本，文本的内容最好是可以帮助你回忆这个系统还原点是在什么时候设置的，日后在多个还原点中选择的时候可以更清晰地分辨各个还原点的不同。

      ​

  - ![10](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/windows-system-backup/windows-system-backup-video-for-backup-10.png)

      点击确定就可以开始创建还原点了，根据系统内容的大小，创建所需要的时间将会适当的加长或者缩短。
        至此，系统的还原点设置就完成了。

      ​

- 使用还原点还原系统
  - ![1](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/windows-system-backup/windows-system-backup-video-for-restore-1.png)

    打开资源管理器，在左侧面板的我电脑上右击，在弹出的菜单中选择属性

    ​

  - ![2](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/windows-system-backup/windows-system-backup-video-for-restore-2.png)

    在弹出的窗口左侧点击系统保护

    ​

  - ![3](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/windows-system-backup/windows-system-backup-video-for-restore-3.png)

    点击系统还原

    ​

  - ![4](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/windows-system-backup/windows-system-backup-video-for-restore-4.png)

    点击下一步

    ​

  - ![5](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/windows-system-backup/windows-system-backup-video-for-restore-5.png)

    此时会显示此电脑所有的还原点，选择其中一个


  - ![6](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/windows-system-backup/windows-system-backup-video-for-restore-6.png)

    点击下一步

    ​

  - ![7](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/windows-system-backup/windows-system-backup-video-for-restore-7.png)

    点击完成即可以开始将系统还原到设置还原点时的状态。

    ​

  - 在系统保护界面中选择 系统还原，一步一步地根据提示选择还原点即可将系统恢复至指定的还原点设置时的状态。步骤图如下：

  - 当系统崩溃不能进入系统时，可以在蓝屏界面直接使用系统还原功能对系统进行修复

  为了便于理解，对于设置还原点与还原系统两个步骤分别录制了一个视频，系统崩溃状态下的视频暂时还没有，有条件的时候再录制。

  	[设置还原点](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/windows-system-backup/windows-system-backup-video-for-backup.mp4)

  ​	[恢复还原点](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/windows-system-backup/windows-system-backup-video-for-restroe.mp4)

  点击可直接下载视频，设置还原点视频大小  3.5MB，恢复还原点视频大小 2.76MB

又加了两张 GIF 图片

[设置还原点 GIF](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/windows-system-backup/windows-system-backup-video-for-backup.gif)

[恢复还原点 GIF](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/windows-system-backup/windows-system-backup-video-for-restore.gif)

两个 GIF 图片大小分别是 2.63M 与 1.67M



## 如果还原失败

![还原失败示意图](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/windows-system-backup/windows_system_restore_failed_img.jpg)

此时可以参照以下教程进入高级重启中进行还原系统

[还原失败时的解决方法](https://www.landiannews.com/archives/42318.html)