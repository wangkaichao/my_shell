#!/bin/bash

#grep HANDLE -rlw test 查找test目录下文件内容，
#-r 指定路径名
#-l 只输出匹配的文件名, 
#-w 整词匹配，

# sed -i 替换文件内容里的HANDLE为@@@@@
#\< \> 整词匹配的才替换

sed -i "s/\<HANDLE\>/@@@@@/g" `grep HANDLE -rlw test`

#全替换
sed -i "s/HANDLE/@@@@@/g" `grep HANDLE -rl test`

#grep整词匹配, 找到文件后对应内容全匹配。一定要注意
sed -i "s/HANDLE/@@@@@/g" `grep HANDLE -rlw test`
