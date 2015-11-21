# script install need packedges for setting up date to Kiev time, synchronize whith time server and place info for autoupdate to crontab.conf
# test on Debian
# /bin/bash
apt-get install ntpdate
echo Europe/Kiev > /etc/timezone
dpkg-reconfigure tzdata
ntpdate pool.ntp.org
echo '# synchronize date whith Inet' >> /etc/crontab
echo -ne '42 4    * * 0   root    ntpdate pool.ntp.org' >> /etc/crontab
