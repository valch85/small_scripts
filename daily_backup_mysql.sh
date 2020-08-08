#!/bin/bash
set -xue
stamp=`date +%Y-%m-%d-%H:%M`
FILENAME="/mnt/db_backup/full_sql"
/usr/bin/find /mnt/db_backup/full* -mtime +14 -delete
/usr/bin/find /mnt/db_backup/uncompress/ -type f -mtime +1 -delete
mysqladmin -u root -ppass stop-slave
mysqldump -u root --max_allowed_packet=1024M --all-database -proot > $FILENAME-$stamp.dump
mysqladmin -u root -ppass start-slave
cat $FILENAME-$stamp.dump | gzip > $FILENAME-$stamp.gz
gpg --yes --passphrase=password -c $FILENAME-$stamp.gz
mv $FILENAME-$stamp.dump /mnt/db_backup/uncompress/
rm $FILENAME-$stamp.gz
s3cmd --exclude=*.dump --delete-removed --multipart-chunk-size-mb=4000 sync /mnt/db_backup/ s3://your_bucket/
