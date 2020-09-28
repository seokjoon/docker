FROM jenkins/jenkins:lts
MAINTAINER Seok Joon Lee <seokjoon@gmail.com>

USER root

##
RUN apt-get update && apt-get install sudo rsync && apt-get clean

## php
RUN apt-get install ca-certificates apt-transport-https && wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - && echo "deb https://packages.sury.org/php/ stretch main" | tee /etc/apt/sources.list.d/php.list
RUN apt-get update && apt-get -y install php7.2 php7.2-fpm php7.2-gd php7.2-mysql mysql-client php7.2-curl php7.2-xml php7.2-mbstring php7.2-zip php7.2-bcmath php-redis && apt-get clean

## composer
RUN apt-get -y install curl && apt-get clean && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/bin/composer

## nodejs
# RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get -y install nodejs && apt-get clean

USER jenkins