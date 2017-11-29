## JAVA 插入数据到 MySql 少了 8 小时



这个问题，真的是找了很久。

之前以为是 mysql 的 timezone 有问题。根据网上的方法，把 timezone 改了，还是不起作用。

然后以为是 java 的问题，但试来试去 java 也不存在 timezone 不对的问题。

最后，竟然是 mysql 连接字符串的问题，连接字符串上多了一个? servertimezone=utc。就是这个东西，搞了我一晚上。

特此记录一下。

后记：servertimezone=utc 如果去掉，又会出现另外一个问题，当初加上也是为了解决这个问题，那就是出现无法识别 timezone 的乱码问题。

原因是，不要使用 mysql connector 6.0.x 以上版本，要使用 5.1.x 的版本，并且不加上 servertimezone。可能是个 BUG。