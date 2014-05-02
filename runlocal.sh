#!/bin/bash

set -ex

echo "127.0.0.1 76design.com" >> /etc/hosts

service apache2 stop
php -S 76design.com:80
service apache2 start

vim /etc/hosts

