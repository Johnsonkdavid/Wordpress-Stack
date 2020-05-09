#!/bin/bash
# Description: Set up MySQL Community Release 5.7

yum install -y wget awscli
setenforce 0
# Get the repo RPM and install it.
cd /tmp
wget http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm 
yum -y install ./mysql57-community-release-el7-7.noarch.rpm 
wget http://wordpress.org/latest.tar.gz
tar -xvzf  latest.tar.gz

# Install the server and start it
yum -y install mysql-community-server 
systemctl start mysqld && systemctl enable  mysqld

# Get the temporary password
temp_password=$(grep password /var/log/mysqld.log | awk '{print $NF}')

# Set up a batch file with the SQL commands
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'YOURPASSWORD@'; flush privileges; UNINSTALL PLUGIN validate_password; create database wp_db; create user wp_user; Set password for wp_user=password('Your_Password'); grant all privileges on wp_db.* to wp_user identified by 'redhat@123';Flush privileges;" > /tmp/reset_pass.sql

# Log in to the server with the temporary password, and pass the SQL file to it.
mysql -u root --password="$temp_password" --connect-expired-password < /tmp/reset_pass.sql

yum install -y  https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y 
yum install yum-utils -y
yum-config-manager --enable remi-php56
yum install -y php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo

##Installing httpd
yum install -y httpd
cp -r /tmp/wordpress/* /var/www/html
aws s3 cp s3://worker212121/wp-config.php /var/www/html/
systemctl start httpd && systemctl enable httpd
