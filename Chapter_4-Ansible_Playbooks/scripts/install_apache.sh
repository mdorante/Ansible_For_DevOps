#!/bin/bash

# Install Apache
yum install --quiet -y httpd httpd-devel

# Copy configuration files
cp /tmp/httpd.conf /etc/httpd/conf/httpd.conf
cp /tmp/httpd-vhosts.conf /etc/httpd/conf/httpd-vhosts.conf

# Start Apache and configure it to run at boot
systemctl start httpd
chkconfig httpd on