FROM ubuntu:16.04
MAINTAINER Seok Joon Lee <seokjoon@gmail.com>

## php-gearman
#RUN apt-get update && apt-get -y install software-properties-common && add-apt-repository -y ppa:ondrej/php
RUN apt-get update && apt-get -y install sudo
WORKDIR /etc/apt/sources.list.d
RUN echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main" > ondrej-ubuntu-php-xenial.list
RUN gpg --keyserver keyserver.ubuntu.com --recv 4F4EA0AAE5267A6C
RUN gpg --export --armor 4F4EA0AAE5267A6C | sudo apt-key add -

## apm
RUN apt-get update && apt-get -y install php php7.0 php7.0-gd php7.0-mysql mysql-client php7.0-curl php7.0-mcrypt apache2 php-gearman && apt-get clean

## ssl
RUN a2enmod ssl
RUN a2ensite default-ssl
RUN mkdir /etc/apache2/ssl
RUN rm /etc/apache2/sites-available/000-default.conf
ADD 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN rm /etc/apache2/sites-available/default-ssl.conf
ADD default-ssl.conf /etc/apache2/sites-available/default-ssl.conf

## timezone KST
WORKDIR /etc/php/7.1/apache2
RUN sed -i "s/;date.timezone =/date.timezone = Asia\/Seoul/g" php.ini

## pcntl
WORKDIR /etc/php/7.1/apache2
RUN sed -i "s/disable_functions/;disable_functions/g" php.ini

## mod_rewrite
RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load
WORKDIR /etc/apache2
RUN sed -i "s/AllowOverride None/AllowOverride ALL/g" apache2.conf



CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80
EXPOSE 443