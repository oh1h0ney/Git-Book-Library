# 无需工具在 CMD 中获取指定文件的 MD5

以 D:\Document\Phone\OnePlus\H2OS1.zip 为例说明

1. 打开 CMD

2. 输入

   ```
   certutil -hashfile D:\Document\Phone\OnePlus\H2OS1.zip md5
   ```

3. 稍等片刻该文件的 MD5 值就会在后面出现，如图所示

   ![check-md5-in-cmd-without-tools](https://github.com/oh1h0ney/Git-Book-Library/blob/master/Windows/check-md5-in-cmd-without-tools.png)
