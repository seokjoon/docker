FROM ubuntu:18.04
MAINTAINER Seok Joon Lee <seokjoon@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

## nginx & php
# RUN apt-get update && apt-get -y install php7.1 php7.1-fpm php7.1-gd php7.1-mysql mysql-client php7.1-curl php7.1-xml php-mbstring php-zip php-imagick nginx && apt-get clean
RUN apt-get update && apt-get -y install software-properties-common && add-apt-repository ppa:ondrej/php
RUN apt-get update && apt-get -y install php7.1 php7.1-fpm php7.1-gd php7.1-mysql mysql-client php7.1-curl php7.1-xml php7.1-mbstring php7.1-zip php7.1-imagick nginx && apt-get clean
RUN rm /etc/nginx/sites-available/default
ADD default /etc/nginx/sites-available/default

CMD ["/bin/bash", "-c", "/usr/sbin/service php7.1-fpm start && nginx -g 'daemon off;'"]

EXPOSE 80
EXPOSE 443
EXPOSE 6001