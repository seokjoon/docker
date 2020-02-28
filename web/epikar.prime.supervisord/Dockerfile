FROM ubuntu:19.04
MAINTAINER Seok Joon Lee <seokjoon@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

## nginx & php
RUN apt-get update && apt-get -y install php7.2 php7.2-fpm php7.2-gd php7.2-mysql mysql-client php7.2-curl php7.2-xml php-mbstring php-zip nginx php-pear php7.2-dev && apt-get clean
RUN rm /etc/nginx/sites-available/default
ADD default /etc/nginx/sites-available/default
ADD 30-inotify.ini /etc/php/7.2/cli/conf.d/30-inotify.ini
RUN pecl install inotify

## timezone KST
WORKDIR /etc/php/7.2/fpm
RUN sed -i "s/;date.timezone =/date.timezone = Asia\/Seoul/g" php.ini

## supervisor
RUN apt-get update && apt-get install -y supervisor && apt-get clean
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY prime-in-watch.conf /etc/supervisor/conf.d/prime-in-watch.conf

CMD ["/usr/bin/supervisord"]
