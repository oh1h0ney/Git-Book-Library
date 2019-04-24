# 禁用系统自动更新

1. 任务栏空白处右击，弹出的菜单中选择任务管理器

    ![打开任务管理器](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/disable-windows-update/task_manager.png)

2. 展开任务管理器

    ![展开任务管理器](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/disable-windows-update/extend_task_manager.png)

3. 选择服务选项卡

    ![选择服务选项卡](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/disable-windows-update/click_service.png)

4. 打开服务界面

    ![打开服务](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/disable-windows-update/open_service.png)

5. 找到 Windows Update 服务项

    ![找到服务项](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/disable-windows-update/find_windows_update_service.png)

6. 设置启动类型为 禁用

    ![禁用](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/disable-windows-update/disable_service.png)

7. 停止服务

    ![停止服务](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/disable-windows-update/stopping_service.png)

8. 切换到 恢复 选项卡，并将 第一次失败操作 修改为 无操作

    ![修改币种](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/disable-windows-update/no_action.png)

以上操作完成后，就可以将 Win10 的自动更新关掉