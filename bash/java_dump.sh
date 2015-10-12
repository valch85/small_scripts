sudo iptables -A INPUT -p tcp --dport 8081 -j DROP
java_pid=`/usr/bin/jps | grep EssayRaterMain | awk '{print $1}'`
curdate=`date '+%y-%m-%d-%H-%M'`
/bin/mv /home/ess/log/editor.gc.log /home/ess/log/$curdate_editor.gc.log
/bin/mv /home/ess/log/editor.out /home/ess/log/$curdate_editor.out.log
/bin/mv /home/ess/log/editor.err  /home/ess/log/$curdate_editor.err.log
/bin/cp /home/ess/log/$curdate_editor.gc.log /mnt/$curdate_editor.gc.log & /bin/cp /home/ess/log/$curdate_editor.out.log /mnt/$curdate_editor.out.log & /bin/cp /home/ess/log/$curdate_editor.err.log /mnt/$curdate_editor.err.log &
jstack -F $java_pid  > /mnt/$curdate_jstack.log && jmap -F -dump:file=/mnt/$curdate_heapdump.log $java_pid && sudo restart editori
sudo iptables -D INPUT -p tcp --dport 8081 -j DROP
tcpkill -i eth0 port 8081
