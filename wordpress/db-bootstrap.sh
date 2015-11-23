#!/bin/bash
#yum update -y
yum install -y mc htop
yum localinstall -y https://dev.mysql.com/get/mysql57-community-release-el6-7.noarch.rpm
yum install -y mysql-community-server
echo "skip-grant-tables" >> /etc/my.cnf
/etc/init.d/mysqld start
chkconfig --levels 235 mysqld on
/etc/init.d/iptables stop

if [ ! -f /var/log/databasesetup ];
then
	
	echo "CREATE DATABASE wordpress" | mysql -uroot 
	touch /var/log/databasesetup

	#if [ -f /vagrant/data/initial.sql ];
	#then
	#	mysql -uroot -prootpass wordpress < /vagrant/data/initial.sql
	#fi
fi

mysql -u root wordpress < /vagrant/wordpress.dump 


#yum install -y expect

#// Not required in actual script
#MYSQL_ROOT_PASSWORD=abcd1234

#SECURE_MYSQL=$(expect -c "
#set timeout 10
#spawn mysql_secure_installation
#expect \"Enter current password for root (enter for none):\"
#send \"$MYSQL\r\"
#expect \"Change the root password?\"
#send \"n\r\"
#expect \"Remove anonymous users?\"
#send \"y\r\"
#expect \"Disallow root login remotely?\"
#send \"y\r\"
#expect \"Remove test database and access to it?\"
#send \"y\r\"
#expect \"Reload privilege tables now?\"
#send \"y\r\"
#expect eof
#")

#echo "$SECURE_MYSQL"