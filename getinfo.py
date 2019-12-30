#!/usr/bin/env python2
import os
import time

#定义可能包含的字符集合
s = set("abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ,./;'][}{\`~|:<>?-=+_")
s.add('"')

#获得当前目录路径，检查是否存在输出文件，若存在则将新输出添加在输出文件末尾，否则创建输出文件
folder = os.getcwd()
if not os.path.exists(folder+'\output'+'.txt'):
    newfile = open(folder+'\output'+'.txt','w')
    print("output file created")
    newfile.close()

#处理文件内容
result = ""
out = open(folder+'\output'+'.txt','a')
f = open('test.txt','r')
for line in open('test.txt'):
    tmp = f.readline()
    tmp = tmp.strip('\n')
    if (tmp in s):
        result = result + tmp
    elif tmp == "ENTER":
        out.write(result)
        out.write('\n')
        result = ""
    elif tmp == "SPACE":
        result = result + " "
    elif tmp == "TAB":
        out.write(result)
        out.write('\n')
        result = ""
    elif tmp == "BACKSPACE" and result != "":
        out.write(result)
        out.write('\n')
        result = ""

#写入时间点并关闭文件
out.write(result)
out.write('\n')
t = time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()))
out.write(str(t))
out.write('\n')
f.close()
out.close()
print("process finished")
