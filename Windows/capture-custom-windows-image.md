# 系统封装教程

## 本文档说明
根据本教程，可实现基于 Windos 官方系统与 Windows PE 对系统进行自定义封装并获取相应的镜像，使用此镜像可以在初次开机时进行设置后就可以进入到自定义的系统中。

## 准备工具
1. 含 Windows 镜像的启动 U 盘

## 步骤

1. 安装系统

    使用 U 盘进行安装系统，系统的安装教程可参照 [U 盘安装 Win10 教程](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/install-windows-10-with-u-disk.md).

2. 跳过系统设置界面进入系统审核界面

    系统安装完成后，待重启后语音停止后按 Ctrl + Shif + F3 跳过初始设置界面，将会以 Adminstrator 用户登录，进入系统审核界面。

    登录后系统会自动打开系统准备工具

3. 进行系统自定义设置



4. sysprep

5. 获取封装后的镜像

6. 使用封装后的镜像安装系统