#!/bin/bash

DSTMP=`date +%y%m%d`
URL=xxx.ca

echo "# Update WordPress"
echo "# svn export --force --ignore-externals http://core.svn.wordpress.org/tags/4.2.2/ ."
echo

set -ex

echo "127.0.1.1 ${URL}" >> /etc/hosts

service apache2 stop
php -S ${URL}:80
service apache2 start

vim +999 /etc/hosts

