FROM jenkins/jenkins:lts
MAINTAINER Seok Joon Lee <seokjoon@gmail.com>

USER root

##
RUN apt-get update && apt-get install -y sudo rsync wget && apt-get clean
RUN printf 'jenkins ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

## php
# RUN apt-get install ca-certificates apt-transport-https && wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - && echo "deb https://packages.sury.org/php/ stretch main" | tee /etc/apt/sources.list.d/php.list
RUN apt -y install lsb-release apt-transport-https ca-certificates && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
RUN apt-get update && apt-get -y install \
    php8.2 php8.2-fpm php8.2-cli  \
    php8.2-mysql default-mysql-client \
    php8.2-gd php8.2-curl php8.2-xml php8.2-mbstring php8.2-zip php8.2-bcmath \
    php-redis \
    php-dev php-pear \
    # composer \
    && apt-get clean

## composer
RUN apt-get -y install curl && apt-get clean && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/bin/composer

## nodejs
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get -y install build-essential nodejs && apt-get clean

##mongoDB
RUN pecl install mongodb
RUN sed -i -e '$aextension="mongodb.so"' /etc/php/8.2/cli/php.ini
RUN sed -i -e '$aextension="mongodb.so"' /etc/php/8.2/fpm/php.ini

USER jenkins
