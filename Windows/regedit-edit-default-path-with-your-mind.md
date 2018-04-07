# 使用注册表更改默认路径

## 修改默认系统文档路径

- 打开注册表

	Win + R，输入 regedit，按确定

- 找到如下表项

	`HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders`
	
	`HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders`
	
	其中的路径就是默认的，都可以改成自己想要的路径，不过要注意一点，最好是在刚重装系统的时候更改，否则，将会出现有很多应用程序提示诸如文件无法找到！！一定要注意！
	
## 修改软件安装目录
	
	在注册表中找到如下表项 ：
	
	`HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion`
	
	在右边的键值中找到 ProgramFilesDir 并右击：然后输入我们想要修改的路径，建议是选择非 C 盘的路径。

	此外 ProgramFilesDir(x86) 也一并修改为同一路径。
	
	这样，就可以将软件的默认安装目录修改为你所修改的路径，再也不怕一路直接点确定将软件装在 C  盘了。
	
	