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

#Creating a PHP File to Test Configuration
cp /root/info.php /var/www/your_domain/

#Testing Database Connection from PHP
echo "CREATE TABLE example_database.todo_list (
    item_id INT AUTO_INCREMENT,
    content VARCHAR(255),
    PRIMARY KEY(item_id)
);" | mysql -u root
echo "INSERT INTO example_database.todo_list (content) VALUES (\"My first important item\");" | mysql -u root
echo "INSERT INTO example_database.todo_list (content) VALUES (\"My second important item\");" | mysql -u root
echo "INSERT INTO example_database.todo_list (content) VALUES (\"My third important item\");" | mysql -u root
echo "INSERT INTO example_database.todo_list (content) VALUES (\"My fourth important item\");" | mysql -u root
cp /root/todo_list.php /var/www/your_domain/


