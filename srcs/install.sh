#!/bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lramos-r <lramos-r@students.42sp.org.br>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/02 16:57:22 by lramos-r          #+#    #+#              #
#    Updated: 2020/05/02 16:57:22 by lramos-r         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#The LEMP software stack:
#L => Linux OS: Debian buster
#E => (E)Nginx web server
#M => MariaDB SQL database
#P => PHP database web administration

#Before install LEMP
apt-get -y update
apt install -y vim

#Install LEMP
apt install -y nginx
apt install -y mariadb-server
apt install -y php-fpm php-mysql php-curl php-gd php-intl
apt install -y php-mbstring php-soap php-xml php-xmlrpc php-zip

#Install and configure OpenSSL
apt-get install -y openssl
mkdir /etc/nginx/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.pem -subj "/C=BR/ST=SP/L=SP/O=42 Sao Paulo/OU=lramos-r/CN=localhost"

#Configure Nginx
mkdir /var/www/localhost
chown -R $USER:$USER /var/www/localhost
cp /root/nginx.conf /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

#Configure PHPMyAdmin
cd /root/
tar xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
mv phpMyAdmin-4.9.0.1-all-languages/ /usr/share/phpmyadmin
cp /usr/share/phpmyadmin/config.sample.inc.php /usr/share/phpmyadmin/config.inc.php
ln -s /usr/share/phpmyadmin /var/www/localhost/phpmyadmin

#Configure Wordpress
cd /root/
tar xvf latest.tar.gz
cp -a wordpress/. /var/www/localhost
cp wp-config.php /var/www/localhost



#Configure access
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

#Start system
service nginx start
service mysql start
service php7.3-fpm start;

#Configure database
echo "CREATE DATABASE example_database;" |  mysql -u root
echo "GRANT ALL ON example_database.* TO 'example_user'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
