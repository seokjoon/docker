FROM debian:8
MAINTAINER Seok Joon Lee <seokjoon@gmail.com>

RUN apt-get update && apt-get -y install apache2 php5 php5-gd php5-mysql mysql-client && apt-get clean

##timezone KST
WORKDIR /etc/php5/apache2
RUN sed -i "s/;date.timezone =/date.timezone = Asia\/Seoul/g" php.ini

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80
EXPOSE 443