FROM ubuntu:18.04
MAINTAINER Seok Joon Lee <seokjoon@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

## apache2 & php7
RUN apt-get update && apt-get -y install php php7.2 php7.2-gd php7.2-mysql mysql-client php7.2-curl php7.2-xml apache2 php-gearman php-mbstring php-zip php-imagick memcached php-memcached php-pgsql php7.2-pgsql libapache2-mod-php7.2 && apt-get clean

##ssl
RUN a2enmod ssl
RUN a2ensite default-ssl
RUN mkdir /etc/apache2/ssl
RUN rm /etc/apache2/sites-available/000-default.conf
ADD 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN rm /etc/apache2/sites-available/default-ssl.conf
ADD default-ssl.conf /etc/apache2/sites-available/default-ssl.conf

## composer
#RUN apt-get -y install curl && apt-get clean && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/bin/composer

## nodejs
#RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
#RUN apt-get -y install nodejs && apt-get clean

## CORS
RUN a2enmod headers

## PGSQL
RUN phpenmod pdo_pgsql

## timezone KST
WORKDIR /etc/php/7.2/apache2
RUN sed -i "s/;date.timezone =/date.timezone = Asia\/Seoul/g" php.ini

## upload size
WORKDIR /etc/php/7.2/apache2
RUN sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 10M/g" php.ini
RUN sed -i "s/post_max_size = 8M/post_max_size = 60M/g" php.ini
RUN sed -i "s/max_execution_time = 30/max_execution_time = 300/g" php.ini

## pcntl
WORKDIR /etc/php/7.2/apache2
RUN sed -i "s/disable_functions/;disable_functions/g" php.ini

## mod_rewrite
RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load
WORKDIR /etc/apache2
RUN sed -i "s/AllowOverride None/AllowOverride ALL/g" apache2.conf

## debugger
#RUN apt-get -y install php-xdebug && apt-get clean
#RUN echo "xdebug.remote_enable=on" >> /etc/php/7.2/mods-available/xdebug.ini
#RUN echo "xdebug.remote_port=9000" >> /etc/php/7.2/mods-available/xdebug.ini
#RUN echo "xdebug.remote_host=localhost" >> /etc/php/7.2/mods-available/xdebug.ini
#RUN echo "xdebug.remote_autostart=off" >> /etc/php/7.2/mods-available/xdebug.ini
#RUN echo "xdebug.idekey=PHPSTORM" >> /etc/php/7.2/mods-available/xdebug.ini

## phpunit
#RUN apt-get -y install phpunit && apt-get clean

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80
EXPOSE 443
#EXPOSE 9000