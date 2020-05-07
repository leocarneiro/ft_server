# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lramos-r <lramos-r@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/02 15:13:23 by lramos-r          #+#    #+#              #
#    Updated: 2020/05/07 11:51:50 by lramos-r         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
FROM debian:buster
LABEL maintainer="Leonardo Ramos Rocha Carneiro <lramos-r@student.42sp.org.br>"

COPY ./srcs/ /tmp/
RUN bash /tmp/install.sh && bash /tmp/clean.sh
EXPOSE 80 8080 443
CMD  bash /tmp/start.sh; bash
