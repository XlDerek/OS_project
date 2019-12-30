#! /bin/bash
inotifywait -mr /home/zhangjiayu/keylogger/data --timefmt '%Y-%m-%d %H:%M:%S' --format '%T %w %f %e' -e modify |
    while read  file ; do
    	python ../getinfo.py 
    done

