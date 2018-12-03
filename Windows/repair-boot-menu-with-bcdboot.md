# 用 bcdboot 修复系统引导

## 文档说明

    在系统中自带有引导文件，我们只需要将引导文件从系统中拷贝到 ESP 分区中就可以实现系统引导的修复，ESP 分区就是俗称的 UEFI 模式下的引导分区。
    
    本教程的目的是记录这一实现过程。
    
    此方法使用于 GPT + UEFI 方式安装的系统。

    步骤第四步会对各命令参数进行讲解，请不要一味复制教程中的命令。

## 准备工具

    带 win10 官方镜像的启动 U 盘，需要用其打开命令提示符工具。

## 步骤

1. U 盘启动

    开机时选择 U 盘启动，在进入安装界面后，按 shift + F10 打开命令提示符界面。

2. 挂载 ESP 分区

    - 打开 diskpart 工具

    打开 CMD ，输入 diskpart，回车

    - 分别输入以下命令挂载 ESP 分区为 Z 盘，其中的参数需要根据自身硬盘分区情况进行调整，后面会对参数有所讲解。

            list volume

            select volume 3

            assign letter=z

    所有操作完成后，输入 exit 回车，以退出 diskpart 工具。
    
    对上述命令作一下讲解，其中的参数部分也会进行说明。

    list disk 命令的作用是 列出电脑中的所有硬盘，
            
3. 修复引导

    修复引导的原理是将引导文件从系统分区中复制到引导分区中，假设系统分区为 C ，引导分区为 Z，则修复引导的命令如下：

    - bcdboot c:\windows /s z: /f UEFI

    输入命令后回车即可完成引导的修复。

4. 命令参数讲解

    list volume 此命令是列出电脑中的所有卷标，卷后面加的序号在我们选择卷标时需要用到。

    select volume 3 此命令是选中序号为 3 的卷。

    ![listVolume](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/repair-boot-menu-with-bcdboot/selectVolume.png)

    assign letter=z  将选中的卷标盘符设置为 Z，如果想要设置为其他盘符，请自行将 Z 改为其他。

    ![assignLetter](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/repair-boot-menu-with-bcdboot/assignLetter.png)

    bcdboot c:\windows /s z: /f UEFI  此命令为使用 BCDBOOT 工具修复引导，引导源文件在 c:\windows 目录，目标引导分区是 Z 盘。