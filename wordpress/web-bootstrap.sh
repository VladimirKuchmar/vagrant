#!/bin/bash	
apt-get update
apt-get install -y mariadb-client-core-5.5
apt-get install -y git
apt-get install -y mc htop
apt-get install -y apache2
apt-get install -y php5 php5-mysql php5-mcrypt python-mysqldb libapache2-mod-php5
if ! [ -L /var/www ]; then
  rm -rf /var/www/html
  ln -fs /vagrant/wp /var/www/html
fi

