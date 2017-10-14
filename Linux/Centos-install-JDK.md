# Centos 安装 JDK 环境 （JAVA 环境）

1. 获取 JDK 文件命令，以 JDK 8-u141 为例

   ```
   wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.rpm"
   ```

   从 JAVA 官网获取的下载链接并不能直接在通过 wget 下载。 如果想要安装更新的版本，可以将 http 后的链接可以替换为从 JAVA 官网获取的下载链接。

2. 安装 JDK

   在下载文件所在的目录使用下列命令通过 rpm 进行安装。

   ```
   rpm -Uvh jdk-8u141-linux-x64.rpm
   ```


3. 安装完成后，可以使用以下命令验证是否安装成功

  ```
  java -version
  ```
  如果返回 JDK 版本就是安装成功了，此时就可以使用 JAVA 了。



4. 有时装 JDK 只是其他软件需要依赖，需要使用  JAVA_HOME 参数，此时可以通过以下命令查看 JDK 的安装目录所在的目录

  ```
  ls -lrt /etc/alternatives/java
  ```

  如上，jdk 1.8.0_141 的安装目录就是  /usr/java/jdk1.8.0_141 ，而这就是其他软件需要的 JAVA_HOME 参数。JAVA_HOME 路径的设定可参照下例

  ```
  vi /etc/profile
  ```

  ```
  # JDK
  JAVA_HOME=/usr/java/jdk1.8.0_141
  JRE_HOME=$JAVA_HOME/jre
  PATH=$PATH:$JAVA_HOME/bin
  CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
  export JAVA_HOME
  export JRE_HOME
  export PATH
  export CLASSPATH
  ```