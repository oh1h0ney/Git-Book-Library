# 使用注册表使关机不会等待应用程序关闭直接强制关机

## 打开注册表

	- 按 Win + R ，在运行中输入 regedit ，按确定
	
	- 定位到如下表项：
	
	`HKEY_CURRENT_USER\Control Panel\Desktop`
	
	新建一个名为 WaitToKillAppTimeout 的字符串项，值输入 200。
	
	这代表等待 200 毫秒自动结束应用程序。
	
	- 新建一个名为 AutoEndTasks 的字符串项，值输入 0。
	
	
## 可能这样也可以生效

- 按 Win + R, 输入 gpedit.msc ， 按确定

- 找到以下路径：

	计算机配置 -> 管理模块 -> 系统 -> 关机选项
	
	选择 关闭会阻止或取消关机的应用程序的自动终止功能
	
	将其状态更改为 已启用。
	
	重启电脑。
	
	
	