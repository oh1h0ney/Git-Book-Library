cpanm Mojo::Webqq && perl -MMojo::Webqq -e "Mojo::Webqq->new->load('ShowMsg')->load("SmartReply",data=>{apikey=>'acbddb52a10c48ba91d15f55068c5b16',friend_reply=>1,group_reply=>1,notice_limit=>8,warn_limit=>10,ban_limit=>12,ban_time=>1200,period=>600,is_need_at=>1,keyword=>[qw(小灰 小红 小猪)],})->load('UploadQRcode')->run()"

cpanm Mojo::Webqq && perl -MMojo::Webqq -e "Mojo::Webqq->new->load('ShowMsg')->load('SmartReply')->load('UploadQRcode')->run()"

Mojo::Webqq->new(login_type=>"login",account=>'2854670278', pwd=>Digest::MD5::md5_hex('aaa1143156833'));

cpanm Mojo::Webqq && perl -MMojo::Webqq -e "Mojo::Webqq->new(login_type=>"login",account=>'2854670278', pwd=>Digest::MD5::md5_hex('aaa1143156833'))->load('ShowMsg')->load('SmartReply')->load('UploadQRcode')->run()"


如果你登录过程中碰到如下异常：

[18/01/08 17:21:28] [warn] 更群扩展信息授权失败: 可能因为登录环境变化引起

可能的原因是，基于账号密码的登录方式，一旦登录所在地发生较大变化，则腾讯服务器可能需要你输入图片验证码，这样就很难实现自动化操作，为了避免这种情况，你需要尽量在 pl 脚本所在的网络中用浏览器多登录一下 http://qun.qq.com 让腾讯服务器消除登录异常的判断

cpanm Mojo::Webqq && perl -MMojo::Webqq -e "Mojo::Webqq->new(login_type=>"login",account=>'2854670278', pwd=>Digest::MD5::md5_hex('aaa1143156833'))->load('ShowMsg')->load("SmartReply",data=>{apikey=>'acbddb52a10c48ba91d15f55068c5b16',friend_reply=>1,group_reply=>1,notice_limit=>8,warn_limit=>10,ban_limit=>12,ban_time=>1200,period=>600,is_need_at=>1,keyword=>[qw(小灰 小红 小猪)],})->load('UploadQRcode')->run()"

nohup perl -MMojo::Webqq -e "Mojo::Webqq->new->load("SmartReply",data=>{apikey=>'acbddb52a10c48ba91d15f55068c5b16',friend_reply=>1,group_reply=>1,notice_limit=>8,warn_limit=>10,ban_limit=>12,ban_time=>1200,period=>600,is_need_at=>1,keyword=>[qw(小灰 小红 小猪)],})->run()" &


nohup perl -MMojo::Webqq -e "Mojo::Webqq->new(login_type=>"login",account=>'2854670278', pwd=>Digest::MD5::md5_hex('aaa1143156833'))->load("SmartReply",data=>{apikey=>'acbddb52a10c48ba91d15f55068c5b16',friend_reply=>1,group_reply=>1,notice_limit=>8,warn_limit=>10,ban_limit=>12,ban_time=>1200,period=>600,is_need_at=>1,keyword=>[qw(小灰 小红 小猪)],})->load("ZiYue")->load("Pu")->run()" &