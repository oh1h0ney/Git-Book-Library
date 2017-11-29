## android studio 高级设置



本文主要内容来自 Dmytro Danylyk 在 Medium 的文章 [Configuring Android Studio](https://medium.com/google-developer-experts/configuring-android-studio-4aa4f54f1153#.cnxns55fh)。在此感谢！虽然使用 [Android](http://lib.csdn.net/base/android) Studio 有一定的时间了，但文中的某几个设置之前还真不知道，且原文在长城外，因此在翻译原文的基础上作了一些补充，若有新的发现会即时更新。当然，原文中个别技巧也谈不上高级，出于对作者的尊重，仍然全部翻译了过来，希望对大家尤其是刚接触 [Android](http://lib.csdn.net/base/android) Studio 的朋友有一点帮助。

前面的话

[android](http://lib.csdn.net/base/android) Studio 提供了一个非常方便的功能帮助我们导入或者导出设置。因此我们在安装一个新的 Android Studio 的时候通常会导入一个之前的设置。但是，最近发生了一件悲剧的事情 - 我丢失了我的设置文件 (幸灾乐祸点个赞～)。

我的建议：即时的备份你的设置文件到云盘等地方。

当我在配置我的 Android Studio 的时候，下面的一些配置技巧或许对你有一定的帮助。

显示行号

当我首次启动我的 Android Studio 的时候，我想做的第一件事就是希望能看到文件中的行号，我一直很奇怪这个基本的配置为毛不是默认开启的？!

对此我只想说四个字：

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/zhizhang.jpg.jpeg)

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/showline.png)

未显示行号

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/line%2520nu.png)

显示行号

配置方法

- File | Settings 打开设置
- 选择 Editor | General | Appearance
- 勾选 Show line numbers

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/linenumb3.png)

设置

ps: 在编辑区域最左侧右键选中 Show line numbers 也可以让当前打开的文件显示行号，不过这是一个临时设置，当前文件关闭后便失效。

驼峰选择

Android 开发中，我们通常会使用驼峰命名法对变量进行命名，但是当我们通过 Ctrl + Left / Right 键改变字符选择区域的时候 Android Studio 默认不支持‘驼峰’单词的选择。

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/tuof1.gif)

不支持驼峰选择

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/tuof2.gif)

支持驼峰选择

配置方法

- File | Settings 打开设置
- 选择 Editor | General | Smart Keys
- 选中 Use “CamelHumps” words

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/tuof3.png)

设置

注意: 如果你仍然希望当鼠标在单词上双击之后选中整个单词，需要作如下设置：

- File | Settings 打开设置
- 选择 Editor | General
- 取消选中 ‘Honor Camel Humps words settings when selecting on double click’

命名前缀

我们通常会遵循 Android 官方关于编码风格的指导来进行字段命名。在 Android 源码中我们可以看到通常成员变量都是以‘m’开始。其实 Android Studio 可以自动在帮我们生成字段名称的时候加上自定义的前缀，如:

- 非共有，非静态的成员变量以’m’开始
- 静态成员变量以’s’开始

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/filed1.gif)

命名前缀

配置方法

- File | Settings 打开设置
- 选择 Editor | Code Style | Java
- 选择 Code Generation 标签
- 给普通 Field 添加一个’m’前缀，给 Static filed 添加一个’s’前缀

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/filed2.png)

设置

快速导包

在 Android Studio 中，我们可以通过 Alt + Enter 和 Control + Alt + O 进行导包和清除无用导包，但我们都生活在 2016 年了，这些事情应当快速自动完成。 

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/import1.gif)

未开启 imports on the fly

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/import2.gif)

开启 imports on the fly

配置方法

- File | Settings 打开设置
- 选择 Editor | General | Auto Import
- 勾选 Optimize imports on the fly
- 勾选 Add unambiguous imports on the fly

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/import3.png)

设置

PS: 这里我补充一下，关于这个配置，个别朋友在问，如果我的项目中两个甚至多个包下都有一个类叫 ImageLoader ，自动导入的结果有没有可能不是我想要的包下的？兄弟你放心，你去查一下 unambiguous 的意思就知道了。针对包名不确定的情况， Android Studio 会选择 No can no import, you can you up ，不会自作聪明，而是会让你自己手动导入。所以，请放心使用。

Log 颜色

Darcula 主题中 Logcat 的默认配色只有红白两种颜色，不太便于我们区分 Log 的类型。

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/log1.png)

Darcula 主题配色

我建议大家采用之前 Android Holo 主题那种鲜明的配色

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/log2.png)

Holo 主题配色

配置方法

- File | Settings 打开设置
- 选择 Editor | Color & Fonts | Android Logcat
- 点击 Click on Save As… 按钮创建一个新的配色 Scheme
- 按照下面的表格修改对应的颜色 (修改之前需要取消勾选 Use inherited attributes)

| Log 级别   | 颜色      |
| -------- | ------- |
| Assert:  | #AA66CC |
| Debug:   | #33B5E5 |
| Error:   | #FF4444 |
| Info:    | #99CC00 |
| Verbose: | #FFFFFF |
| Warning: | #FFBB33 |

苍老师的事业线

下面是个人的一些补充：

代码配色

Android Studio 中默认的代码配色个人感觉已经很和谐，但这个东西仁者见仁。比如有的朋友会觉得 [Java](http://lib.csdn.net/base/javase) 代码中局部变量的默认的白色不太便于快速与其它代码进行区分，这时候就需要自定义 [Java](http://lib.csdn.net/base/java) 代码颜色，这里以局部变量为例。

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/color1.png)

默认配色

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/color2.png)

自定义配色

配置方法

- File | Settings 打开设置
- 选择 Editor | Color & Fonts | Java
- 点击 Click on Save As… 按钮创建一个新的配色 Scheme
- 展开下方的 Variables 选择 Local variable
- 设置右侧的 Foreground 颜色

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/color3.png.jpeg)

设置

工程模板

Android Studio 创建 Module 时并没有将 Android 开发中常用的文件目录全部生成，比如默认只生成了一个 drawable 文件夹，常用的 drawable-hdpi 等文件夹需要我们自己创建。正如前文的作者所言，这都 2016 年了，这些事情应该自动完成，毕竟我们都很‘懒’！

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/drawable1.png)

默认结构

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/drawable2.png)

自定义结构

配置方法 1

- 进入 Android Studio 安装目录
- 依次进入 plugins | android | lib | templates | gradle-projects | NewAndroidModule | root | res
- 在 res 文件夹下创建 drawable-hdpi 等文件夹 (可选：从对应的 mipmap 文件夹中拷贝 iclauncher.png 到创建的 drawable 文件夹中)
- 回到 NewAndroidModule 目录，用编辑器打 recipe.xml.ftl 文件
- 加入以下配置

![g](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/showline.png)

配置方法 2

- 进入 Android Studio 安装目录
- 依次进入 plugins | android | lib | templates | gradle-projects | NewAndroidModule
- 用编辑器打开 recipe.xml.ftl 文件，并加入以下配置

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/drawable4.png)

这两种方法的区别是，第一种方式可以在文件夹中加入相应的图片，但是配置稍显繁琐，第二种方式配置简单，但是只能创建目录，不能包含默认图片。

当然，通过类似的方式我们还可以在创建 Module 的时候做很多事情，比如：

- 在 colors.xml 文件中生成常用颜色
- 在 build.gradle 文件中生成自定义配置
- 在 .gitignore 文件中生成自定义忽略配置
- 等等…

活动模板

Android Studio 中默认提供了很多非常方便的活动模板 (Live Templates)，例如，我们输入 sout 后按 enter 键， Android Studio 会自动帮我们写入 System.out.println();

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/sout.gif)

其实 sout 就是 AS 自带的一个活动模板。

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/temp.png.jpeg)

由此可以看出，活动模板就是我们常用代码的一个缩写。开发中有很多代码都会重复出现，因此自定义合适的活动模板能很大程度上避免我们很多重复的体力劳动。那么问题来了，如何自定义？

这里我们以 Handler 为例。下面是在 Activity 中一个合格的 Handler 该有的样子： 

privatestaticclassMyHandlerextendsHandler{        private WeakReference activityWeakReference;        publicMyHandler(MainActivity activity){            activityWeakReference = new WeakReference(activity);        }        @OverridepublicvoidhandleMessage(Message msg){            MainActivity activity = activityWeakReference.get();            if (activity != null) {            }        }    }

至于原因我就不再重复了，网上有太多的文章有讲过。现在如果我只希望输入一个‘psh’ 就自动出现上面这段代码的话，我应该这么做： 

配置方法

- File | Settings 打开设置
- 选择 Editor | Code Style | Live Templates
- 点击最右侧的加号并选择 Template Group
- 在弹出的对话框中输入一个活动模板分组的名称，如 custom
- 在左侧选中上一步中创建的 custom 分组，点击右边的加号
- 选择 Live Template ，在 Abbreviation 中对输入 psh
- 在 Description 中输入这个活动模板的描述
- 在 Template text 中输入以下代码

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/hand.png.jpeg)

- 点击下方的 Define 按钮，选中 java 表示这个模板用于 java 代码
- 点击右侧的 Edit variables
- 选择 Expression 下拉框中的 className 并勾选 Skip if…

这个操作的作用是，AS 会自动将我们在上一步中用’$’符包裹的 className 自动替换为当前类不含包名的类名

- 点击 Apply 和 Ok 让设置生效。 

至此，一个我们自定义的 custom 模板组中的 psh 活动模板就定义完成了。下面我们来验证一下，见证奇迹的时候到了： 

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-advance-setting/handler.gif)

后面的话

1. 由于互联网数据的分享性，如果本文部分内容来源于您的原创文章，且我没有注明 (我相信本文中没有)，请[微博私信](http://weibo.com/u/3219033010/home?topnav=1&wvr=6)说明。
2. 欢迎转载，但最好请注明文章原始出处(驼峰选择, 命名前缀, 快速导包, Log 颜色等等 - binbinyang 博客 - CSDN 博客)。
3. 身为一名老司机，没有福利不太合适。
4. 如果你正在办公室，不建议你阅读以下内容。