#!/bin/bash
text=$1
if [ "$text" = "val" & "$text" = "toxa" ]; then 
	echo proshel $text
#elif [ "$text" = "toxa" ]; then 
#	echo proshel $text
#elif [ "$text" = "lena" ]; then
#	echo proshel $text

else
       	echo access deny
fi
exit
