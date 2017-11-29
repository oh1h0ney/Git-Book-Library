## Android Studio 自定义设置注释模板



一、. 注释模板说明

在项目中常用的注释模板有三种：类注释、方法注释、成员变量注释，一般为了书写代码方便、快捷，需要设置类注释模板和方法注释模板，成员变量注释模板可根据个人需求进行设置。

注：对于刚开始使用 [Android](http://lib.csdn.net/base/15) Studio 的新手，设置注释模板是必须得，但特别不容易找到它的设置方式，本人也是研究了好久，查了各种资料才找到以下的设置方式，虽然未必能达到我们所要的理想的状态，但也至少是一种方式，希望对大家有帮助，若谁有更好的设置方式，求推荐啊。

二、设置类注释模板

\1. 第一种方式

1）找到设置类注释模板的位置：

File --> Setting --> File and Code Templates 

右侧  Templates --> Class （选中）

Includes --> File Header

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-custom-templates/1.png)

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-custom-templates/2.jpeg)

2）在下图右侧对应的文本框中设置类的注释模板的内容：

其中 ${DATE} 表示日期时间，其他的变量设置简介在 Description 下面的框内，大家可根据个人需要自定义设置。（在 File Header 中设置。）

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-custom-templates/3.jpeg)

3）设置完成，最后，记得 Apply --> OK。

4）注意：这里所设置的注释模板只有在创建新的类的时候才会自动生成出现。若想在自己的代码中快速设置注释还需要使用第二种设置方式。

\2. 第二种方式（重点）

1）快速找到设置注释模板的位置 (如图)： Setting --> Live Templates 

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-custom-templates/4.png)

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-custom-templates/5.jpeg)

2）在最右侧的位置，添加个自定义名为 user 的组

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-custom-templates/6.png)

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-custom-templates/7.png)

3）自定义注释模板：（具体步骤如下图）

注意：那个自定义变量，需要在注释模板文本框内设置变量名称，写法：$xxx$ ；然后再点击 Edit variables 进行设置即可。

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-custom-templates/8.png)

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-custom-templates/9.jpeg)

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-custom-templates/10.png)

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-custom-templates/11.jpeg)

4）在项目中应用，在代码中类的上面，按快捷键 cc ，回车。你要的效果就出来了。

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/android-studio-custom-templates/12.png)

三、设置方法注释模板

注：设置方式同上面的类注释模板的第二种方式，换个快捷键名称，设置个人需要的变量即可。很简单，大家可以自己试试。其实这种方式就是设置自定义快捷键，你也可以用此来设置其他你自己常用的代码。