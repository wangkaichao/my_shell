#!bin/sh/

cat skyapi_user_data.c | grep "\.s32AreaCode =" > ~/area.txt

# 统计重复出现的区域: 
sort area.txt | uniq -c -d

# 统计只出现过一次的区域：
sort area.txt | uniq -c -u
