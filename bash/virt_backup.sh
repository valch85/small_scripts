#!/bin/bash

#set -xue

stamp=`date +%Y-%m-%d`
FOLDERV="/var/lib/vz/images/"
FOLDERS3="/mnt/s3/"
FOLDERB="/mnt/backup/"
/bin/tar -cvf /mnt/s3/$stamp-confs.tar /etc/pve/nodes/virt2/qemu-server/

for f in $FOLDERV*/*.qcow2;
	do cp $f $FOLDERS3$stamp-`basename $f`
done


cp $FOLDERS3* $FOLDERB
/usr/bin/find $FOLDERB* -mtime +3 -delete

s3cmd --no-delete-removed --multipart-chunk-size-mb=4000 sync $FOLDERS3 s3://s3_bucket_name/

rm $FOLDERS3*

#var1="/usr/bin/find /var/lib/vz/images/ -type f -name '*.qcow2' | awk -F/ '{print $(NF-1)"/"$NF}"
#var2="/usr/bin/find /var/lib/vz/images/ -type f -name '*.qcow2' | awk -F/ '{print $($NF}"
#/bin/cp /var/lib/vz/images/$var1 /mnt/s3/$var2
#/usr/bin/find /var/lib/vz/images/ -type f -name '*.qcow2' | awk -F/ '{print $(NF-1)"/"$NF}' | xargs -I{} /bin/cp /var/lib/vz/images/{} /mnt/s3/$stamp-{`awk -F/ '{print $NF}'`}



#/usr/bin/find /mnt/db_backup/full* -mtime +14 -delete
#/usr/bin/find /mnt/db_backup/uncompress/ -type f -mtime +1 -delete
#mv $FILENAME-$stamp.dump /mnt/db_backup/uncompress/
#rm $FILENAME-$stamp.gz
#s3cmd --exclude=*.dump --no-delete-removed --multipart-chunk-size-mb=4000 sync /mnt/db_backup/ s3://s3_bucket_name/
