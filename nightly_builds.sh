#!/bin/bash
HOME="/home/live“

#FILE="/home/nightly_build.txt"
FILE="/tmp/nightly_build.txt"

stop="$HOME/run/script.sh stop"
start="$HOME/run/script.sh start"

do_start()
{
if [ -a $FILE ];then
        cd $HOME
        git pull origin master
        rebuild="/home/live/build/rebuild.sh -s -p"
#       echo "git pull + fsdfds"
else
        do_status
        exit 0
fi
}

do_enable(){
        touch $FILE
}

do_disable(){
        rm $FILE
}

do_status(){
if [ -a $FILE ];then
        echo "nightly builds enabled"
else
        echo "nightly builds disabled"
fi
}

case "$1" in
        start)
                do_start
                ;;
        enable)
                do_enable
                do_status
                ;;
        disable)
                do_disable
                do_status
                ;;
        status)
                do_status
                ;;
esac
exit 0