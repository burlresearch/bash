#!/bin/bash

URL=xxx.ca

set -ex

echo "127.0.1.1 $URL" >> /etc/hosts

service apache2 stop
php -S $URL:80
service apache2 start

vim +999 /etc/hosts

