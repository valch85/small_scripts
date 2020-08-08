#!/bin/sh
ping -c2 -W2 80.242.134.195
if [ $? = 0 ];then
        echo "host is reachable and variable="$?
else
        echo "host unreachable and variable="$?
fi
