# Linux 常用命令
## 文件操作类
ls -alhnit --full-time
ls 显示所有文件，显示文件详细属性，将文件大小换算成字节，打印 UID 和 GID，打印 inode，按更改时间排序，打印完整时间
-R 递归查询

cd -  ## 在当前目录与上一次目录之间切换

cp -f destfile{,.bak}  将 destfile 复制一份，并在文件名后加 .bak 文件做备份，且覆盖时不提醒,p 

mkdir -pv local/file 创建 local 文件夹并在 local 文件夹中创建文件 file，显示创建过程

rm -r destfile(folder) 将 destfile 中全部目录与子目录递归删除

shutdown -r 重启

shutdown -h 关机

cat -nE file 查看文本内容，空行也显示，给每行编号，包括空行

tac file 将 file 中文本倒序输出

stat file 查看 file 属性

tree folder -L 2 以树形结构显示 folder 的目录结构， -L 限制只显示 2 层级

## 网络类
ss -tunl
ss -a

scp localfile user@hostname:/remotedirection

## sed

## 网络

## 监控
ps -aux / ps -eFH
pstree
top (P 占据 CPU 百分比  M 占据内存百分比  T 累计占据 CPU 时长) （t tasks 及 CPU 信息  m memory 信息  l uptime 信息）
htop (t 显示进程树 l 显示选定进程打开的文件列表)
vmstat
glances (-p 9099 -w[pip3 install bottle])
dstat

## 文本处理
more  
less
head -2 file
tail -2 file
tail -f file 
head 6 profile | tail -1

grep
xargs
cat -A file 显示换行符
cut -d' ' -f1,2,3 -s file  以空格为分隔符进行分隔，不显示没有分隔符的行，显示分隔后的第 1 2 3 列
sort -t' ' -n -r -u -f -k2 file  将以空格分隔后，以数值排序，以倒序显示，合并相同行，忽略大小写，以分隔后的第二列进行排序
wc -c -w -l  统计个数


## vi 编辑器
三种模式，输入模式，编辑模式，末行模式
vi +# file  打开后定位第 # 行  vi + file 打开定位最后一行  vi +/findsomething file 打开后定位到第一次匹配到 findsomething 的位置
:q 退出  :wq 保存并退出  :q! 不保存并退出  :w 保存  :w! 强行保存  :wq -> :x    ZZ 保存并退出

### 进入输入模式
i 在光标所在字符前面的字符转为输入模式
a 在光标所在字符后面的字符转为输入模式
o 在当前光标所在行的下方新建一行并转为输入模式
O 在当前光标所在行的上方新建一行并转为输入模式
I 在光标所在字符所在的行行首转为输入模式
A 在光标所在字符所在的行行尾转为输入模式

### 移动光标
hjkl
w 下一单词词首
e 当前或下一单词词尾
b 当前或前一单词词首
0 行首   $ 行尾   ^ 行首第一个非空字符
G gg 10G    ctrl f  ctrl b

### 编辑模式
x 删除光标位置字符
r 替换光标位置字符
dd 删除行   dw 删除单词 可加数字   dG 删除光标行到页尾  dgg 删除光标到页首
yw 复制单词  yy 复制行
p 在下方新增一行粘贴  P 在上方新增一行粘贴
u 撤销   ctrl r  重做撤销   . (小数点) 重做上一步操作

### 末行模式
/fi  查找 fi， n 向下一个，N 向上一个
:! ls /usr/local 执行 ls /usr/local 这个命令
:s/fi/if/   将当前行中第一个 fi 替换为 if
:s/fi/if/gi 将当前行中所有 fi 替换为 if （fi 不论大小写）
:%s/fi/if/gi 将全文中所有 fi 替换为 if （fi 不论大小写）
与 % 同用的有 n 行号，.  当前光标行，+n 偏移 n 行，$ 末尾行， $-3 末尾前三行

## 行编辑器
### sed 
sed "2d" 删除第二行  "2p" 显示第二行  "2a\string"  在第二行后新增一行，内容为 string  "2a\string"  在第二行前新增一行，内容为 string  
sed "/string/2d" file 删除第一行
num=9
正则动态匹配，正则模糊匹配，可以引入变量 sed "s/\(id:\)[0-9]\(:initdefault:\)/\1$num\2/" file    

### awk  分列统计报告
awk -F':' 'BEGIN{print "name,shell"}{print $1,$7}END{print "blue,/bin/nosh"}' passwd  以 : 分隔，打印第一列和第七列，以 , 分开，第一行输出 name,shell，最后一行输出 blue,/bin/nosh\
awk '/root/{print  $0}' passwd  搜索所有有 root 关键字的行的所有列
awk -F':' '{print NR "\t" NF "\t" $0}' passwd
---
awk.sh
{
        split($3,date,"-");
        if(date[2]=="01"){
                name[$1]+=$5
        };
        if($2=="0"){
                role[$1]=="manager"
        }else{
                role[$1]=="worker"
        }
}
END{
        for(i in name){
                print i "\t" role[i] "\t" name[i]
        }
}
----
----
awk.txt
tom    0   2012-12-11  car 3000
John    1   2013-01-13  bike    1000
vivi    1   2013-01-18  cat 2800
Tom 0   2013-01-20  car 2500
John    1   2013-01-28  bike    3500
----
awk -f awk.sh awk.txt

## 用户和权限
useradd username  新增名为 username 的用户
passwd username     修改 username 用户的密码
groupadd share  新增权限组 share
usermod -G share username    为 username 新增一个 share 权限组
chown root:share folder/ 将 folder 文件夹的属主修改为 root，属组修改为 shares

chmod augo  a all  u user  g group  p  other
chmod g+x folder/  为属组加写权限

## rpm 安装
rpm -qa 查询已经安装的所有包  -q packagename 查询 packagename 是否已经安装  -ql packaname 查询 packagename 安装后生成的文件列表  -qf /path/to/somefile 查询文件是由哪个 rpm 包安装生成的
-qi pk 查询 pk 包的说明信息  -qc pk 查询 pk 包的配置文件 -qd pk 查询 pk 包的帮助文件 -q --script pk 查询包中包含的脚本
rpm -qpi -qpl

## bash
### 引用
a=echo "`echo "hello"`"
a=$(eco $(echo "hello"))
echo $?  0 为命令执行成功，非 0 为命令执行失败
command1&&command2
command1||command2

### 算术
c=$(($a+$b)) 用双括号时时，不赋值的状态下，括号内的变量可以不加 $
echo $((a++)) 用双括号时时，自增不用加 $ 符号