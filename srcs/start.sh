#!/bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lramos-r <lramos-r@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/06 17:57:14 by lramos-r          #+#    #+#              #
#    Updated: 2020/05/07 11:53:49 by lramos-r         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

service nginx start;
service php7.3-fpm start;
service mysql start;
