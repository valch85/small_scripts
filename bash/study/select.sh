#!/bin/bash
function  menu {
echo '1) Hello'
echo '2) Smile'
echo '3) Quit'
}
        OPTIONS="Hello Smile Quit"
           select opt in $OPTIONS; do
               if [ "$opt" = "Quit" ]; then
                	echo done
               	exit 
		elif [ "$opt" = "Hello" ]; then
                	echo Hello World
#menu
		elif [ "$opt" = "Smile" ]; then
                	echo  ';)'
#menu
	 	else
		#clear
                echo bad option
#menu
               fi
           done

