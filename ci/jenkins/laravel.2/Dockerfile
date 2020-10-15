FROM jenkins/jenkins:lts
MAINTAINER Seok Joon Lee <seokjoon@gmail.com>

USER root

##
RUN apt-get update && apt-get install -y sudo rsync && apt-get clean
RUN printf 'jenkins ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

## php
RUN apt-get install ca-certificates apt-transport-https && wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - && echo "deb https://packages.sury.org/php/ stretch main" | tee /etc/apt/sources.list.d/php.list
RUN apt-get update && apt-get -y install php7.4 php7.4-fpm php7.4-gd php7.4-mysql mysql-client php7.4-curl php7.4-xml php7.4-mbstring php7.4-zip php7.4-bcmath php-redis && apt-get clean

## composer
RUN apt-get -y install curl && apt-get clean && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/bin/composer

## nodejs
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get -y install build-essential nodejs && apt-get clean

USER jenkins