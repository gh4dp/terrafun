#!/bin/bash
sudo yum update -y
sudo yum -y remove httpd
sudo yum -y remove httpd-tools
sudo yum install -y httpd php
service httpd start
chkconfig httpd on

sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www
sudo find /var/www -type d -exec chmod 2775 {} \;
sudo find /var/www -type f -exec chmod 0664 {} \;
sudo cd /var/www/html
sudo curl http://169.254.169.254/latest/meta-data/instance-id -o index.html
sudo curl https://raw.githubusercontent.com/hashicorp/learn-terramino/master/index.php -O
