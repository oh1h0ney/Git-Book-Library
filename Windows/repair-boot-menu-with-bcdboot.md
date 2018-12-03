# 用 bcdboot 修复系统引导

## 文档说明

    在系统中自带有引导文件，我们只需要将引导文件从系统中拷贝到 ESP 分区中就可以实现系统引导的修复。本教程的目的是记录这一实现过程。

## 准备工具

    带 win10 官方镜像的启动 U 盘，需要用其打开命令提示符工具。

## 步骤

1. 挂载 ESP 分区

    - 打开 diskpart 工具

    打开 CMD ，输入 diskpart，回车

    - 分别输入以下命令挂载 ESP 分区为 Z 盘，其中的参数需要根据自身硬盘分区情况进行调整，后面会对参数有所讲解。

            list disk 

            select disk 1

            list volume

            select volume 3

            assign letter=z
    
    对上述命令作一下讲解，其中的参数部分也会进行说明。

    list disk 命令的作用是 列出电脑中的所有硬盘，
            
2. 修复引导
