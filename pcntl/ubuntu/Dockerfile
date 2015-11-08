FROM ubuntu:latest
MAINTAINER Seok Joon Lee <seokjoon@gmail.com>

RUN apt-get update && apt-get -y install apache2 php5 php5-gd php5-mysql mysql-client && apt-get clean

ADD php.ini /etc/php5/apache2/php.ini
ADD pcntl.so /usr/lib/php5/20121212/pcntl.so
RUN echo "extension=pcntl.so" > /etc/php5/mods-available/pcntl.ini
RUN ln -s /etc/php5/mods-available/pcntl.ini /etc/php5/apache2/conf.d/20-pcntl.ini

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80
EXPOSE 443
