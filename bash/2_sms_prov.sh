#!/bin/bash

num=$(/bin/cat count) 

echo число в файле $num
if [ $num -eq $((num/2*2)) ];then
	        echo 1 > count
		#php turbosms.php;      
	else 
		echo 2 > count
fi

