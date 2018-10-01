# 使用系统还原 U 盘安装 Win10

## 准备工作

1. 系统还原 U 盘

   1. 购机时附赠的系统还原 U 盘，里面有官方的 Win10 系统安装镜像，以及驱动文件。
   2. 也可利用自己的 U 盘自行制作一个系统还原 U 盘。

2. 数据备份

   重装系统将会导致 C 盘中的数据百分百丢失，请注意备份 C 盘中所需的数据。

   请谨慎按照教程操作，否则将有可以丢失更多分区的数据。按步骤来将不会有任何问题。

3. 电脑

## 进入 U 盘安装界面

1. 插入 U 盘
2. 开机状态下
   - 重启电脑，在屏幕暗下去连续快速地按 F7，直到快捷启动项出现，方向键选中 UEFI 开头的，回车确定。

## 安装界面中的选项设置

1. 进入安装界面

   显示此界面表示正在加载，准备进入安装界面。

   ![Before-Setup](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\Before_Setup.png)

2. 输入语言与其他首选项

   默认点击下一步。

   如需要更改语言，也可在此修改。如修改后出现不认识显示的文字，可重新再次安装系统。谨记，请不要随意修改默认选项，在没有指导的时候，使用默认选项。

   ![Setup-1](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\Setup_1.png)

3. 现在安装

   ![Setup-22](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\Setup_2.png)

   ![Setup-3](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\Setup_3.png)

4. 激活 Windows

   请直接点击我没有产品密钥。

   请直接点击我没有产品密钥。

   请直接点击我没有产品密钥。

   系统安装完成后再输入产品密钥，完成 Windows 的激活。

   ![Setup-4](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\Setup_4.png)

5.选择系统版本

​	选择 Windows 10 专业版，然后点击下一步。

![Setup-5](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\Setup_5.png)

6. 许可条款

   勾选接受许可条款，并点击下一步。

   ![Setup-6](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\Setup_6.png)

7. 选择安装类型

   点击自定义，仅安装 Windows（高级）。

   ![Setup-7](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\Setup_7.png)

8. 清除旧分区

   1. **（可选，如果需要将 D 盘中的文件全部删除，请执行此步，否则请跳过）选中驱动器 1 分区5，点击删除**
   2. 选中驱动器 1 分区4，点击删除
   3. 选中驱动器 1 分区3，点击删除
   4. 选中驱动器 1 分区2，点击删除
   5. 选中驱动器 1 分区1 恢复，点击删除

   ![Setup-9](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\Setup_9.png)

   ![Setup-11](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\Setup_11.png)

   ![Setup-12](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\Setup_12.png)

9. 新建分区

   选中驱动器 1 未分配空间，点击新建，点应用，点下一步

   ![Setup-13](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\Setup_13.png)

   ![Setup-14](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\Setup_14.png)

   ![Setup-15](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\Setup_15.png)

   ![Setup-17](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\Setup_17.png)

10. 正在安装

    如下界面出现时表示已经开始安装，待进度走完，系统会自动重启，并启动初始设置界面。

    ![Setup-18](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\Setup_18.png)

    安装完成

    ![Setup-19](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\Setup_19.png)

    系统将会自动重启

    ![Setup-20](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\Setup_20.png)

## 安装后初始设置

1. 欢迎语

   - 当前为 “海内存知己，天涯若比邻”，出现此界面表明正在加载

     ![Welcome](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\Welcome.png)

2. 在加载完成后，语音助手会语音提示，提示过后将会开始基本设置，第一个是区域设置，此时选择**中国**，然后点是，进入下一步。

   ![Region](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\After-Setup-Region.png)

3. 键盘布局设置

   选择**微软拼音**，然后点**是**，进入下一步。

   ![](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\After-Setup-Keyboard.png)

4. 添加第二种键盘布局

   在这个界面中选择**跳过**，即可进入下一步。如需要设置第二键盘布局可看后文介绍，本处略过。

   ![Keyboard-Second](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\After_Setup_Keyboard_Second.png)

5. 连接到网络

   此处特别注意！此处特别注意！此处特别注意！

   请勿连接网络。如果已连接网线，请拔掉网线。请不要连接 WIFI。直接点击左下角，现在**跳过**，进入下一步。

![Network](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\After_Setup_Network.png)

6. 设置用户名

   在此处输入任何想要设置的用户名，这里以 **admin** 为例。

   输入完成后点下一步，进入下一步，设置用户密码。

   ![User-Name](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\After_Setup_User_Name.png)

   7. 设置用户密码

      在此处设置用户密码，该密码将会在每次开机登录时要求输入，请牢记。如不需要设置密码，此处可留空，直接点击下一步。此处以不设密码留空为例。

      ![User-Password](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\After_Setup_User_Password.png)

   8. 服务设置

      往下将会是一些服务设置，每一个都可以使用默认设置，不断地点是进入下一步即可。如果对于微软信息收集服务比较敏感，可以一个个设置。具体会设置的项如下。

      1. 是否让 Cortana 作为你的个人助理

         此项设置后可后续在设置中关闭。

      ![Cortana](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\After_Setup_Cortana.png)

      2. 隐私设置

         如无特殊需求，可不做修改，直接接受，这有助于提高 Win10 的使用体验。

         主要涉及以下几项：

         1. 语音识别
         2. 查找我的设备
         3. 墨迹书写与键入
         4. 位置
         5. 诊断数据
         6. 量身定制的体验
         7. 广告 ID

         还可以点击了解详情了解更多信息。

         ![Private-Setting](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\After-Setup-Private_Setting.png)

      9. 设置完成，等待

         以下界面出现后，稍加等待就可以进入安装完成后的系统了。

         ![Almost-Done](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\After_Setup_Almost_Done.png)

         ![Almost-Done-1](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\After_Setup_Almost_Done_1.png)

         ![Almost-Done-2](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\After_Setup_Almost_Done_2.png)

      10.安装完成，进入系统

      ​	初始界面如下。仅有回收站与 Microsoft Edge。还需要进一步安装相应驱动，并关闭更新。

      ![Done](D:\Document\System\Documents\Github\Git Book Library\Windows\windowsInstall\After_Setup_Done.png)