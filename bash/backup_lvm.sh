#!/bin/bash
# 0 */2 * * *  /root/bin/backup_lvm.sh &
/bin/mkdir -p /mnt/snap
/bin/mkdir -p /mnt/backup
curdate=`date '+%Y-%m-%d_%H:%M:%S'`
/usr/bin/mysqladmin  -u root -ppass  stop-slave && \
/sbin/lvcreate -s -L 5000M -n snap /dev/VG1/db && \
/usr/bin/mysqladmin  -u root -ppass start-slave
/bin/mount /dev/VG1/snap /mnt/snap/
/usr/bin/find /mnt/backup/ -name '*.tar' -mmin +600 -exec /bin/rm {} \;
/bin/tar -cvf /mnt/backup/$curdate.tar /mnt/snap/
/bin/umount /dev/VG1/snap
/sbin/lvremove -f /dev/VG1/snap