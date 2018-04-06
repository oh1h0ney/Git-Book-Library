不管用的是哪个版本的 Win10，其实只要停了 Windows Defender 的实时监控，也就等于让这款内置杀软 “离职”，至少是被架空了。所以，在创意者更新中，进入 Windows Defender 安全中心，找到 “病毒和威胁防护设置”，把里面 “实时保护” 等选项关了就好。老版本 Win10 在设置→更新和安全→Windows Defender 中关闭 “实时保护” 之类的开关就行。

关闭 Windows Defender 安全中心具体方法如下：

1、在 Cortana 搜索栏中输入 regedit，按回车键进入注册表编辑器。

2、定位到

HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SecurityHealthService

3、在右侧找到 DWORD（32 位）值，命名为 Start。

4、修改数值数据为 3。

5、重启文件资源管理器，或注销再登录 / 重启系统。

Windows10 系统彻底关闭 Windows Defender 的技巧就为大家介绍到这里了。