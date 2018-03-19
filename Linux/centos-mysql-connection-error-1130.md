# 连接 MySQL数据库返回的错误信息为  1130 - Host 'localhost' is not allowed to connect to this MySQL server

解决步骤如下：

1. 使用终端连接服务器
2. 输入 `mysql -u root -p` ，输入后提示 Enter password:
3. 按提示输入 MySQL 数据库的 root 用户的密码，输入过程中终端不会显示输入进度，输入完成后 enter 即可，密码正确后终端上应显示  MySQL [(none)]> 
4. 输入 `use mysql; ` (注：分号是mysql 命令的结束符号，必须输入。)终端上显示的信息应该变为 MySQL[mysql]
5. 输入` update user set host='%' where user = 'root'; `
6. 输入 `flush privileges;`
7. 如果在第二步的时候提示，`RROR 1062 (23000): Duplicate entry '%-root' for key 'PRIMARY'`，可通过  `MySQL> select host from user where user = 'root';`  命令在 MySQL 系统中查看是否有一个为 % 的用户，如有则再次执行 flush privileges 即可。