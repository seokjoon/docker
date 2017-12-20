FROM ubuntu:17.04
MAINTAINER Seok Joon Lee <seokjoon@gmail.com>

## apache2 & php7
RUN apt-get update && apt-get -y install php php7.0 php7.0-gd php7.0-mysql mysql-client php7.0-curl php7.0-mcrypt php7.0-xml apache2 php-gearman php-mbstring php-zip php-imagick && apt-get clean

## composer
RUN apt-get -y install curl && apt-get clean
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer

## CORS
RUN a2enmod headers

## gif: https://github.com/spatie/image-optimizer
RUN apt-get -y install jpegoptim optipng pngquant gifsicle && apt-get clean

## PageSpeed
WORKDIR /tmp
RUN apt-get install -y wget
RUN wget https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-beta_current_amd64.deb
RUN dpkg -i mod-pagespeed-*.deb
#ADD pagespeed.conf /etc/apache2/mods-available/pagespeed.conf
RUN sed -i "s/\# ModPagespeedRewriteLevel PassThrough/ModPagespeedRewriteLevel OptimizeForBandwidth/g" /etc/apache2/mods-available/pagespeed.conf
RUN apt-get -f install && apt-get clean
RUN rm mod-pagespeed-*.deb
#service apache2 restart
#service apache2 reload

##ssl
RUN a2enmod ssl
RUN a2ensite default-ssl
RUN mkdir /etc/apache2/ssl
RUN rm /etc/apache2/sites-available/000-default.conf
ADD 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN rm /etc/apache2/sites-available/default-ssl.conf
ADD default-ssl.conf /etc/apache2/sites-available/default-ssl.conf

## timezone KST
WORKDIR /etc/php/7.0/apache2
RUN sed -i "s/;date.timezone =/date.timezone = Asia\/Seoul/g" php.ini

## upload size
WORKDIR /etc/php/7.0/apache2
RUN sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 10M/g" php.ini
RUN sed -i "s/post_max_size = 8M/post_max_size = 60M/g" php.ini
RUN sed -i "s/max_execution_time = 30/max_execution_time = 300/g" php.ini

## pcntl
WORKDIR /etc/php/7.0/apache2
RUN sed -i "s/disable_functions/;disable_functions/g" php.ini

## mod_rewrite
RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load
WORKDIR /etc/apache2
RUN sed -i "s/AllowOverride None/AllowOverride ALL/g" apache2.conf

## mod_expires
RUN a2enmod expires

## virtual host
ADD wafle.conf /etc/apache2/sites-available/wafle.conf
RUN ln -s /etc/apache2/sites-available/wafle.conf /etc/apache2/sites-enabled/wafle.conf
ADD wafleCoKr.conf /etc/apache2/sites-available/wafleCoKr.conf
RUN ln -s /etc/apache2/sites-available/wafleCoKr.conf /etc/apache2/sites-enabled/wafleCoKr.conf
ADD nso1Wafle.conf /etc/apache2/sites-available/nso1Wafle.conf
RUN ln -s /etc/apache2/sites-available/nso1Wafle.conf /etc/apache2/sites-enabled/nso1Wafle.conf
ADD imgWafle.conf /etc/apache2/sites-available/imgWafle.conf
RUN ln -s /etc/apache2/sites-available/imgWafle.conf /etc/apache2/sites-enabled/imgWafle.conf

## mpm_prefork_module
RUN rm /etc/apache2/mods-available/mpm_prefork.conf
ADD mpm_prefork.conf /etc/apache2/mods-available/mpm_prefork.conf

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80
EXPOSE 443