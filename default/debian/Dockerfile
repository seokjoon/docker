FROM debian:8
MAINTAINER Seok Joon Lee <seokjoon@gmail.com>

RUN apt-get update && apt-get -y install apache2 php5 php5-mysql mysql-client && apt-get clean

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80
EXPOSE 443