# Linux 免密登录设置
## Windows 生成 id_rsa.pub
1. CMD 中输入 ssh-keygen，按提示选择保存路径，并输入加密内容（可以设置为空，后续将不需要输入任何内容直接连接）
2. 在保存路径中找到 id_rsa.pub，将文件上传到 Linux 服务器中。

## Linux 生成 id_rsa.pub
1. 输入 ssh-keygen，按提示选择保存路径，并输入加密内容（可以设置为空，后续将不需要输入任何内容直接连接）
2. 在保存路径的新建 authorized_keys 文件。
3. 输入以下命令 `cat id_rsa.pub >> authorized_keys`
4. 断开 ssh 连接后，再次重新建立连接，此时无需再次输入密码