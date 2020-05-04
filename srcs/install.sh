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

#Installing LEMP
apt install -y nginx
apt install -y mariadb-server
apt install -y php-fpm php-mysql

#Install and configure OpenSSL
apt-get install -y openssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=127.0.0.1"

#Start system
service nginx restart
service mysql restart
service php7.3-fpm restart;

#Configure database
echo "CREATE DATABASE example_database;" |  mysql -u root
echo "GRANT ALL ON example_database.* TO 'example_user'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

#Configure Nginx to use the PHP Processor
mkdir /var/www/your_domain
chown -R $USER:$USER /var/www/your_domain
cp /root/your_domain /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/your_domain /etc/nginx/sites-enabled/
service nginx restart
