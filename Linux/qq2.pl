use Mojo::Webqq;
#微信使用 use Mojo::Weixin
my $client = Mojo::Webqq->new(login_type=>"login",account=>'2854670278', pwd=>Digest::MD5::md5_hex('aaa1143156833'),log_encoding=>"utf-8");
$client->load("ShowMsg");
#请根据自己所需的推送服务进行选择并删除或注释不需要的部分，填写格式请仿照 GCM 的方式填写
#以下为 GCM 推送
$client->load("GCM",data=>{
 api_url => 'https://gcm-http.googleapis.com/gcm/send',
 api_key=>'AIzaSyB18io0hduB_3uHxKD3XaebPCecug27ht8',
 registration_ids=>["cJhMTpnqV3Y:APA91bGOBCNSB_VXzuWuHZvrw0RpwtVRkIDrZbhd-wXL40qJRBOkz0z1lr3Mdf9bcURogXng6oayiexU-MWbHx8SewAlzQRsB97eso-nAfOKeHd5acTybv-QdgHWKfSIUCM402ZArhBQ"],
 allow_group=>["接收指定群消息","QQ填写群号码","微信为群昵称"],
 ban_group=>["不接收指定群消息，同上"],
 allow_discuss=>[],
 ban_discuss=>[],
 #此处为讨论组，填写格式同上
});
$client->load("SmartReply",
	data=>{apikey=>'acbddb52a10c48ba91d15f55068c5b16',
	friend_reply=>1,
	group_reply=>1,
	notice_limit=>8,
	warn_limit=>10,
	ban_limit=>12,
	ban_time=>1200,
	period=>600,
	is_need_at=>1,
	keyword=>[qw(小灰 小红 小猪)],
	});
$client->load("Openqq",data=>{
 listen => [{host=>"45.76.54.130",port=>8093}, ] , #此处为ip和端口，这个组件是用来发送信息的
});
$client->load("ZiYue");
$client->load("Pu");
$client->run();