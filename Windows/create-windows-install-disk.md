# 制作 Windows 启动盘

## 准备工作

1. U 盘一个（U 盘中的文件请自行备份）
2. Windows 原版镜像文件，后缀名为 .iso，如果没有，正文有下载链接
3. （Windows 10 系统不需要这一步） 虚拟光驱

## 步骤

### 下载链接

[Windows 10 原版镜像 1809 版本下载](https://1drv.ws/u/s!Asqcuuz_FQslgRGVV230cnHORUmK)，内含专业版、家庭版

### 纯手动制作
在这个方法中，可能会涉及到使用分区工具对 U 盘操作

#### 第一步： 挂载镜像文件

#### 第二步： 清空 U 盘

注意，经过这一步之后，U 盘中的文件将会全部丢失，请注意备份其中有用的文件。

##### 打开磁盘管理器
找到写有可移动的盘，将该盘中的分区删除。如果有无法删除的分区，需要借助分区工具将所有分区删除。本例中使用 DiskGenius.

[Diskgenius 下载链接](https://1drv.ws/u/s!Asqcuuz_FQsl-SUhyfnB0HGYh2Vz)

下载后，将其解压，打开解压出来的文件夹中的 Diskgenius.exe 文件 

!(Diskgenius 启动)[https://github.com/oh1h0ney/Git-Book-Library/raw/master/Windows/create-windows-install-disk/Diskgenius-app.png]



#### 第三步： 复制文件

#### 第四步： 验证是否制作成功


### 使用软件将镜像写入 U 盘

#### 使用 Rufus 制作

[Rufus 下载链接](https://1drv.ws/u/s!Asqcuuz_FQsl-SRFtZBIo7ndTvOw),大约 1M。