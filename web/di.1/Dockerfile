FROM ubuntu:20.04
MAINTAINER Seok Joon Lee <seokjoon@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

## nginx & php
RUN apt-get update && apt-get -y install php7.4 php7.4-fpm php7.4-gd php7.4-mysql mysql-client php7.4-curl php7.4-xml php-mbstring php-zip php-bcmath php-redis nginx && apt-get clean
RUN rm /etc/nginx/sites-available/default
ADD default /etc/nginx/sites-available/default

## timezone KST
WORKDIR /etc/php/7.4/fpm
RUN sed -i "s/;date.timezone =/date.timezone = Asia\/Seoul/g" php.ini

## upload size
WORKDIR /etc/php/7.4/fpm
RUN sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 11M/g" php.ini
RUN sed -i "s/post_max_size = 8M/post_max_size = 60M/g" php.ini
RUN sed -i "s/max_execution_time = 30/max_execution_time = 300/g" php.ini

## inicis
WORKDIR /etc/php/7.4
ADD icertsecu.so /usr/lib/php/20190902/icertsecu.so
ADD icertsecu.ini mods-available/icertsecu.ini
RUN cd fpm/conf.d && ln -s /etc/php/7.4/mods-available/icertsecu.ini ./20-icertsecu.ini

## nginx: GET url length limit: upstream sent too big header while reading
WORKDIR /etc/nginx
RUN sed -i "/^http {/a fastcgi_buffers 16 16k;" nginx.conf
RUN sed -i "/^fastcgi_buffers 16 16k;/a fastcgi_buffer_size 32k;" nginx.conf


CMD ["/bin/bash", "-c", "/usr/sbin/service php7.4-fpm start && nginx -g 'daemon off;'"]


EXPOSE 80
EXPOSE 443
EXPOSE 6001
