FROM jenkins/jenkins:lts
MAINTAINER Seok Joon Lee <seokjoon@gmail.com>

USER root

## php
RUN apt-get update && apt-get -y install php7.0 php7.0-fpm php7.0-gd php7.0-mysql mysql-client php7.0-curl php7.0-xml php-mbstring php-zip php-bcmath php-redis && apt-get clean

## composer
RUN apt-get -y install curl && apt-get clean && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/bin/composer

## nodejs
# RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get -y install nodejs && apt-get clean

USER jenkins