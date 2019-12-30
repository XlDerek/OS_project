#!/usr/bin/env python2
import os
import time

s = set("abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ,./;'][}{\`~|:<>?-=+_")
s.add('"')
folder = os.getcwd()
#print(folder)
result = ""
if not os.path.exists(folder+'\output'+'.txt'):
    newfile = open(folder+'\output'+'.txt','w')
    print("output file created")
    newfile.close()

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
    elif tmp == "TAB"
        out.write(result)
        out.write('\n')
        result = ""
    elif tmp == "BACKSPACE" and result != "":
        out.write(result)
        out.write('\n')
        result = ""


out.write(result)
out.write('\n')
t = time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()))
out.write(str(t))
out.write('\n')
f.close()
out.close()

print("process finished")
