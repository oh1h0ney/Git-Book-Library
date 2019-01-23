# 制作 Windows 启动盘

## 准备工作

本教程只在 Windows 10 系统下使用，其他系统请注意搭配使用虚拟光驱完成挂载镜像文件这一步骤。

1. U 盘一个（U 盘中的文件请自行备份）
2. Windows 原版镜像文件，后缀名为 .iso，如果没有，正文有下载链接

本教程有两种方式制作启动盘，纯手动方式会比较复杂。

## 步骤

### 下载链接

[Windows 10 原版镜像 1809 版本下载](https://1drv.ws/u/s!Asqcuuz_FQslgRGVV230cnHORUmK)，内含专业版、家庭版

### 使用软件将镜像写入 U 盘以完成 U 盘启动盘的制作

#### 使用 Rufus 制作

[Rufus 下载链接](https://1drv.ws/u/s!Asqcuuz_FQsl-SRFtZBIo7ndTvOw),大约 1M。

下载软件后解压，打开解压后文件夹中的 Rufus.exe 文件，界面如下：

![rufus-main](https://github.com/oh1h0ney/Git-Book-Library/raw/master/Windows/create-windows-install-disk/rufus-main.png)

按上图所示参数进行设置，点击鼠标所在的位置，会弹出选择镜像文件的界面，在界面中打开系统镜像文件所在的目录，选择镜像文件，点确定

![rufus-image](https://github.com/oh1h0ney/Git-Book-Library/raw/master/Windows/create-windows-install-disk/rufus-image.png)

然后点击开始，等进度条完成后，U 盘启动盘就制作完成了。此时可以参照文末验证是否制作成功。

### 纯手动制作
在这个方法中，可能会涉及到使用分区工具对 U 盘操作，在操作过程中请注意不要选错磁盘以导致数据被就误删除。

#### 第一步： 挂载镜像文件

打开镜像文件所在目录，在镜像文件上右击，打开方式中选择 Windows 资源管理器，就完成了挂载。

![mount-image](https://github.com/oh1h0ney/Git-Book-Library/raw/master/Windows/create-windows-install-disk/mount-image.png)

此时在我的电脑中就会出现一个 DVD 驱动器，打开这个 DVD 驱动器后，里面的文件会是如下图所示。

![dvd-files](https://github.com/oh1h0ney/Git-Book-Library/raw/master/Windows/create-windows-install-disk/dvd-files.png)

下面接着下一步

#### 第二步： 清空 U 盘

注意，经过这一步之后，U 盘中的文件将会全部丢失，请注意备份其中有用的文件。

##### 打开磁盘管理器
找到写有可移动的盘，将该盘中的分区右键删除。

![diskmanager-clean](https://github.com/oh1h0ney/Git-Book-Library/raw/master/Windows/create-windows-install-disk/diskmanager-clean.png)

所有分区全部删除后在显示为灰色的部分右键，新建分区，按照向导指示，完成分区的新建。如果有无法删除的分区，在本例中无法删除的分区显示为 EFI 活动分区，需要借助分区工具将所有分区删除。本例中使用 DiskGenius。

###### 使用 Diskgenius 清除不可删除分区

[Diskgenius 下载链接](https://1drv.ws/u/s!Asqcuuz_FQsl-SUhyfnB0HGYh2Vz)

下载后，将其解压，打开解压出来的文件夹中的 Diskgenius.exe 文件 

![Diskgenius 启动](https://github.com/oh1h0ney/Git-Book-Library/raw/master/Windows/create-windows-install-disk/Diskgenius-app.png)

启动后在主界面左侧会有一列硬盘，各个硬盘下方会列出该硬盘所对应的分区。在其中找到 U 盘所在的磁盘，一般是 RD 开头，也可以通过容量看出，本例中 U 盘的容量是 32G。

在选中的磁盘上右键，选择删除所有分区。

![diskgenius-opened](https://github.com/oh1h0ney/Git-Book-Library/raw/master/Windows/create-windows-install-disk/diskgenius-opened.png)

软件会提示是否确定删除当前磁盘的所有分区，此时选择 是(Y)，再点击左上角的保存更改，此时会提示确定要保存对分区表的所有更改，此时选择 是(Y)，此时分区已经全部删除完毕。

删除完成之后可以用 Diskgenuis 继续新建分区。

在 U 盘所在的磁盘上右键，新建分区，分区类型选择主磁盘分区，文件系统类型选择 NTFS，分区大小默认不变，对齐对下列扇区数的整数倍勾上，并下拉选择 4096 扇区，点确定，保存更改，就可以完成新建分区。

![Diskgenius-create](https://github.com/oh1h0ney/Git-Book-Library/raw/master/Windows/create-windows-install-disk/diskgenius-create.png)

也可以回到系统的分区管理中新建分区。

#### 第三步： 复制文件

打开 DVD 驱动器，本例中是 G 盘，按 Ctrl + A 选中所有文件，按 Ctrl + C 复制所有文件

然后打开 U 盘所在分区，本例中是 F 盘，按 Ctrl + V 进行粘贴。待所有文件粘贴完成之后，就完成了 U 盘启动盘的制作。

![copy-files](https://github.com/oh1h0ney/Git-Book-Library/raw/master/Windows/create-windows-install-disk/copy-files.png)

#### 第四步： 验证是否制作成功

制作完成后， U 盘中的文件目录应该如下图所示。

![u-disk-files](https://github.com/oh1h0ney/Git-Book-Library/raw/master/Windows/create-windows-install-disk/u-disk-files.png)

此时，可以重启电脑，在重启过程中不断按 F7，会弹出选择启动项的菜单，此时选择 UEFI 开头的选项，如果能进入到系统安装界面，就证明已经制作完成。否则就是失败了。

注意，只要保证制作完成后的文件不被删除，这个启动盘也是可以正常存储文件的。