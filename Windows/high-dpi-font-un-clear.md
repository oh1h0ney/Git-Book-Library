# 解决 win10 字体模糊 125% 缩放最好用的办法

 很多高分屏都有这个问题，而解决办法大部分是治标不治本，压根解决不了或者每个程序单独设置太麻烦，看了卡饭论坛一个帖子，了了几字，真解决了 。
使用方法:
1、调整缩放比例为 125%
2、把附件放到
C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp
3、运行 1.bat
4、重新启动

PS：缩放比例 150% 可能不适用该方法 



恢复方法:

1. 把 1.bat 删除

2. 个性化 => 显示 => 缩放比例 => 改回 100%

3. 桌面右键 => 个性化 => 显示 => 调整指定项目的大小 => 改回默认

4. 重新启动





  新建一个文本文档，复制下面代码
  REG ADD "HKCU\Control Panel\Desktop" /v Win8DpiScaling /t REG_DWORD /d 0x00000001 /f
  REG ADD "HKCU\Control Panel\Desktop" /v LogPixels /t REG_DWORD /d 0x00000078 /f
  REG ADD "HKCU\Control Panel\Desktop" /v DpiScalingVer /t REG_DWORD /d 0x00001018 /f
  保存另存为 1.bat
  由此困扰的吧友试试吧。