FROM ubuntu:latest
MAINTAINER Seok Joon Lee <seokjoon@gmail.com>

RUN apt-get update && apt-get -y install apache2 php5 php5-gd php5-mysql mysql-client php5-gearman libcurl3-gnutls php5-curl && apt-get clean

##timezone KST
WORKDIR /etc/php5/apache2
RUN sed -i "s/;date.timezone =/date.timezone = Asia\/Seoul/g" php.ini

##pcntl
WORKDIR /etc/php5/apache2
RUN sed -i "s/disable_functions/;disable_functions/g" php.ini
ADD pcntl.so /usr/lib/php5/20131226/pcntl.so
RUN echo "extension=pcntl.so" > /etc/php5/mods-available/pcntl.ini
RUN ln -s /etc/php5/mods-available/pcntl.ini /etc/php5/apache2/conf.d/20-pcntl.ini
##mod_rewrite
RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load
WORKDIR /etc/apache2
RUN sed -i "s/AllowOverride None/AllowOverride ALL/g" apache2.conf

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80
EXPOSE 443