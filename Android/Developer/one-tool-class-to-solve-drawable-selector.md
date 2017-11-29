## 一个工具类搞定drawable下扎堆的selector

【实战】一个工具类搞定drawable下扎堆的selector

2017-07-08 [APP架构师](##) APP架构师

你是否曾抱怨过产品经理，为什么一个app里面按钮正常/按下状态颜色不统一起来？

你是否曾埋怨过UI，为什么不同地方输入框的颜色、圆角和聚焦字体颜色不一样？

你是否曾因为为了避免少些一个selector的.xml文件而手动的去控制TextView在选中/非选中状态下的颜色？

你是否曾因为drawable目录下selector，shape文件太多，第二次要用却忘了以前有没有定义过又找不到而苦恼？

今天，我便是为解决此问题而来

- 传统方式对于Button背景色不同状态下以XML文件的方式的定义

通常状态下我们对于Button的按压状态下和非按压状态下我们需要两种不同的背景

一般都是通过xml文件来书写Selector方式来实现的：

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/1.png)

当然了其实后面一个item不用写state_pressed="false"也无妨（而且正确的写法，selector最后一个item就应该不写state），这是以图片的方式来定义不同状态下的背景，当然你也可是换成颜色的方式。

不过这两种方式有个共同的缺点，就是你无法去定义item的形状。图片是什么形状，就是什么形状。通常设计给我们的按钮、输入框通常都会是一个圆角的矩形，这个时候我们就需要用到Shape。这里就以EditText的圆角背景为例，通常我们会这么定义：

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/2.jpeg)

这样便是定义了一个圆角半径为10dp的矩形背景框，当EditText获得焦点的时候边框会呈现红色，没有获取焦点时会呈现灰色，需要两个或以上各EditText一起使用时可以看出效果。比如：

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/3.gif)

因为我们这里定义的填充色是透明的所有只有边框色，让了如果你需要Button有点击反应的同时还能有圆角的样式，也是可以通过Shape来实现的，只需要修改填充色（solid）和对应的state即可。效果如下：

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/4.gif)

当然我们也可以在原有的基础上给边框加上对应状态下不同的颜色

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/5.gif)

对于此种方式定义Selector的注意点

这里我要说的注意点只有一点，就是前面所提到的Selector的最后一个item一定要加上一个没有写state的item，这个item就是默认状态下的item。不过对于这里的默认，大多数人存在误区，很多人可能认为对于state_pressed默认状态就是false，state_selected默认状态也是false，我们只需要写一个state_pressed=true或者state_selected=true的item再写一个默认状态下的item即可。

我要告诉大家的是：尔等错了~~

至于为什么错了，我们就以一个按钮（默认：浅蓝色，按下去：深蓝色）为例。

按照大部分人以往的认知，应该是这么写

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/6.png)

没有任何问题，效果也如我们预期的一样（大家都知道的，图就不贴了）。

那么，为什么我会说大家错了呢？如果我们将上面的代码片段改成下面这样呢：

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/7.png)

我们只是把第一个item的state_pressed由true改为了false。如果找大家之前的想法“最后一个默认的item对于state_pressed值为false”，那么照理来讲那么对于这个按钮默认状态下（没有按下去）是深蓝色（selector对于重复state只会取第一个有效值，后面的无效，大家可以自己验证），按下去我们是没有设置的（照理来讲应该是透明的，或者系统默认的button背景色，大部分手机是深灰色）。我们来看一下效果是什么样的：

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/8.gif)

我们发现：没有按下去的时候确实是深蓝色，按下去之后却成了浅蓝色。

这是不是就印证了我所说的“尔等错了”（容我嘚瑟一下，哈哈~）

正解应该是最后一个默认item的state包含前面所有item的state值的相反值。意思就是前面有个state_pressed=true的最后一个item就默认加上了一个state_pressed=false，前面有个state_focused=false的最后一个item就默认加上了一个state_focused=true的item。（我已经多次验证过了，如果谁有更好的理解，欢迎指出！）

默认item出现的位置

我们先来把之前的代码修改一下：

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/9.jpeg)

在给按钮加个监听：

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/10.png)

效果是这样的：

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/11.gif)

没有任何问题，但是如果我们将selector的默认item放到最前面：

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/12.jpeg)

效果就变成了这样：

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/13.gif)

我们发现不论是默认状态、点击状态、还是选中状态全都是一样的，显示的都是默认item。

这里就要注意另一个很重要的一点了：范围大的item必须写在范围小的item的后面，默认item必须写在selector的最后一行。其实根据这一点，我们又会发现我们前面对于默认item的state的总结是有误的，如果默认item只是有与其他item的state相反的state那么，当把它放在前面的时候应该是不会影响其他的item的，可想而知默认item应该是对于每个state不论true还是false都存在，因为selector对于重复的state只取第一个有效，这也就解释了为什么把默认item放在最前面，后面的item不起作用了。

Selector代码实现

废话了那么多，终于到了重点了。在Android SDK中Selector对应的Java类是android.graphics.drawable.StateListDrawable，对于Selector下的每一个item我们使用addState的方式来添加，比如我们想要添加一个state_pressed=true时背景色为蓝色的item，我们可以采用这段代码

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/14.png)

如果想要添加一个state_enabled=false的item，我们可以这样：

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/15.png)

之后再给对应的view setBackground即可。

需要注意的是默认item的state我们写：new int[]{}

对于Shape对应的Java类是android.graphics.drawable.GradientDrawable，如果想要实现一个我一开始给大家展示的EditText的那种边框，我们可以采用以下这段代码：

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/16.jpeg)

知道了Selector与Shape对应的Java类，以及item的规则（前面废话了那么多，就是为了现在服务）之后，开始完成我们的工具类（我们就以Selector套Shape为例，其他的关于文字颜色，以及使用图片作为背景会在后文源码中公布）：平时我们用到的Selector无非就是enabled，pressed，selected，focused和默认这几种状态。对于Shape而言，还有个形状。好的，我们就定义一个类ShapeSelector

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/17.jpeg)

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/18.jpeg)

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/19.jpeg)

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/20.jpeg)

我们采用Builder模式方便对ShapeSelector设置各种状态下的属性，最后调用create方法直接生成StateListDrawable对象设置给对应的View即可。

接下来我们来看一下效果

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/21.jpeg)

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/22.gif)

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/23.jpeg)

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/24.gif)

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/25.jpeg)

![img](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Android/Developer/one-tool-class-to-solve-drawable-selector/26.gif)

 

使用捷径

有人可能会说：虽然是可以不用再定义很多的xml文件了，但是一个页面有很多的view，我不是要对每个view都是挨个设置一下背景嘛，这岂不更麻烦。

——简单，我们自定义一个View继承一下原有的View，再自定义一些属性，然后在构造方法里面拿到这些属性，用我们的工具类给他设置上不就行了嘛，这样是需要再写布局的时候写一下属性就行了。

Github https://github.com/chuwe1/SelectorDemohttps://github.com/chuwe1/SelectorDemo

CSDN

http://blog.csdn.net/chuwe1/article/details/74572443

