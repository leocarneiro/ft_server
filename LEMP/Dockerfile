# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lramos-r <lramos-r@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/02 15:13:23 by lramos-r          #+#    #+#              #
#    Updated: 2020/05/02 15:14:51 by lramos-r         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
FROM debian:buster
LABEL maintainer="Leonardo Ramos <lramos-r@student.42sp.org.br>"

COPY ./srcs/ /root/
RUN bash /root/install.sh && apt-get clean
RUN /etc/init.d/nginx start && /etc/init.d/php7.3-fpm start && /etc/init.d/mysql start
ENTRYPOINT bash

