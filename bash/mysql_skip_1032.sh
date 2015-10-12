#!/bin/bash
COUNTER=0
while [  $COUNTER -lt 1000 ]
	do
	echo "show slave status \G"| mysql -uroot |grep 1032| grep Last_Errno
		if [ $? = 0 ]
        	then echo "SET GLOBAL SQL_SLAVE_SKIP_COUNTER = 1; START SLAVE;" | mysql -uroot
		sleep 1
		else
			sleep 5
		fi
let COUNTER=COUNTER+1
done
