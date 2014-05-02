#!/bin/bash

URL=healthcaretransformation.ca

set -ex

echo "127.0.1.1 $URL" >> /etc/hosts

service apache2 stop
php -S $URL:80
service apache2 start

vim /etc/hosts

