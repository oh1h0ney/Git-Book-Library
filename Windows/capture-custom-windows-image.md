# 系统封装教程

## 本文档说明
根据本教程，可实现基于 Windos 官方系统与 Windows PE 对系统进行自定义封装并获取相应的镜像，使用此镜像可以在初次开机时进行设置后就可以进入到自定义的系统中。

## 准备工具
1. 含 Windows 镜像的启动 U 盘
2. 电脑中最好有两个硬盘，一个装系统，一个存放镜像。理论上一个硬盘两个分区也可以。

## 步骤

1. 安装系统

    使用 U 盘进行安装系统，系统的安装教程可参照 [U 盘安装 Win10 教程](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/install-windows-10-with-u-disk.md).

2. 跳过系统设置界面进入系统审核界面

    系统安装完成后，待重启后的语音停止后按 Ctrl + Shift + F3 跳过初始设置界面，将会以 Adminstrator 用户登录系统，进入系统审核界面。

    登录后系统会自动打开系统准备工具，将其放入后台待完成自定义设置后使用

3. 进行系统自定义设置

    安装驱动、软件，并完成关闭自动更新等各项设置。

4. sysprep

    完成各项自定义设置后，打开系统准备工具（如不慎将此工具关闭，可前往 C:\Windows\System32\Syspre 目录，手动打开 sysprep.exe 文件），按下图进行设置，点确定，系统会自动进行相应操作，操作完成后会自动关机。

    ![系统准备工具](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/capture-custom-windows-image/win10-sysprep.png)

5. 获取封装后的镜像

    插上 U 盘，电脑开机时选 U 盘启动。在进入系统安装界面时，按 Shift + F10 打开命令提示符。

    此时电脑中应该有一个除系统分区之后的大容量分区以作为镜像存放目录。

    如无，请使用 diskpart 工具创建。

    若系统盘为 C 盘，镜像存放目录为 D 盘 image 文件夹下，欲将镜像文件命名为 custom.wim, 镜像名为 Windows 10 Custom，则获取镜像的命令如下：

    dism /capture-image /captureDir:C:\ /imagefile:"D:\image\custom.wim" /name:"Windows 10 Custom" /NoRpFix

    输入命令后回车，待进度条跑完后，就可以在镜像存放目录中看到名为 custom.wim 的镜像文件。

6. 使用封装后的镜像安装系统

    在 U 盘启动盘中，source 目录下，有一个 install.wim 文件，将其命名为 backup.wim, 将自定义获取的 custom.wim 复制到 source 目录下，并将其文件名改为 install.wim。然后再按 [U 盘安装 Win10 教程](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/install-windows-10-with-u-disk.md) 来装系统即可。