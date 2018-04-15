# 在 Centos 上搭建 QQ 机器人实现自动回复

1. 打开[图灵机器人网站](http://www.tuling123.com/)并注册账号
2. 点击创建机器人，选择 QQ 机器人
3. 在机器人设置中找到你的 APIkey
4. 通过 SSH 连接到你的 VPS

`yum install -y perl openssl-devel cpan`

5. 再输入以下命令，一行一回车，共三行

`cpan -i App::cpanminus`
`cpanm Mojo::Webqq`

6. 输入命令

   `vi /usr/local/share/perl5/Mojo/Webqq/Plugin/SmartReply.pm`

   输入 i 进入 insert 模式，找到
   `my $json = {
               "key"       =>  $data->{apikey} || "f771372ffd054183bfcdf260d7c7ad5a",
               "userid"    =>  $msg->sender->id,
               "info"      =>  $input,
           };`

   将 f771372ffd054183bfcdf260d7c7ad5a 换成你自己的 APIkey 并保存

   7. 按  `:` 进入命令模式，并输入 `wq` ，回车保存退出。
   8. 输入以下命令启动 MojoWebqq

`cpanm Mojo::Webqq && perl -MMojo::Webqq -e "Mojo::Webqq->new(login_type=>"login",account=>'qqacount', pwd=>Digest::MD5::md5_hex('qqpassowrd'))->load('ShowMsg')->load("SmartReply",data=>{apikey=>'yourapikey',friend_reply=>1,group_reply=>1,notice_limit=>8,warn_limit=>10,ban_limit=>12,ban_time=>1200,period=>600,is_need_at=>1,keyword=>[qw(小灰 小红 小猪)],})->load('UploadQRcode')->run()"`

注意，你需要将命令中的 qqacount qqpassowrd 以及 yourapikey 三个字符串换为你的 QQ 账号，QQ 密码以及图灵机器人 APIKEY

命令还可自行根据需求拓展，可参照 MojoWebqq 的官方文档 https://metacpan.org/pod/distribution/Mojo-Webqq/doc/Webqq.pod

9. 打开图片链接并用手机 QQ 扫描二维码，登录你想做机器人的 QQ。

10. 在群聊中 @帐号昵称 来触发，如果可以自动回复，那么按 ctrl+c 终止当前进程，再输入以下命令，并 2 次回车

    `nohup perl -MMojo::Webqq -e "Mojo::Webqq->new->load('SmartReply')->run()" &`

    ​



