#!/bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lramos-r <lramos-r@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/02 16:57:22 by lramos-r          #+#    #+#              #
#    Updated: 2020/05/07 11:53:08 by lramos-r         ###   ########.fr        #
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

#Start system
/etc/init.d/mysql start
/etc/init.d/nginx start
/etc/init.d/php7.3-fpm start

#Install and configure OpenSSL
apt-get install -y openssl
mkdir /etc/nginx/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.pem -subj "/C=BR/ST=SP/L=SP/O=42 Sao Paulo/OU=lramos-r/CN=localhost"
chmod 600 /etc/nginx/ssl/localhost* 

#Configure Nginx
mkdir /var/www/localhost
cp /var/www/html/index.nginx-debian.html /var/www/localhost/nginx.html
cp /tmp/nginx.conf /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf
rm /etc/nginx/sites-enabled/default

#Configure PHPMyAdmin
cd /tmp/
tar xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
rm phpMyAdmin-4.9.0.1-all-languages.tar.gz
mv phpMyAdmin-4.9.0.1-all-languages/ /var/www/localhost/phpmyadmin/
cp -p /tmp/config.inc.php /var/www/localhost/phpmyadmin/config.inc.php
cp -p /tmp/info.php /var/www/localhost/info.php

#Configure Wordpress
cd /tmp/
tar xvf latest.tar.gz
rm latest.tar.gz
mv wordpress/ /var/www/localhost/wordpress/
cp -a /tmp/wp-config.php /var/www/localhost/wordpress/wp-config.php

#Configure access
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

#Configure wordpress database
echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" |  mysql -u root
echo "GRANT ALL ON wordpress.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

#Set up autoindex
echo "alias autoindex=\"bash /tmp/autoindex\"" >> ~/.bashrc
source ~/.bashrc
