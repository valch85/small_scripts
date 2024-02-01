#!/bin/bash

num=$(/bin/cat count) 

echo 'number in a file $num'
if [ $num -eq $((num/2*2)) ];then
	        echo 1 > count
		#php turbosms.php;      
	else 
		echo 2 > count
fi

