FROM debian:8
MAINTAINER Seok Joon Lee <seokjoon@gmail.com>

RUN apt-get update && apt-get -y install apache2 php5 php5-gd php5-mysql mysql-client php5-gearman libcurl3-gnutls php5-curl && apt-get clean

##ssl
#RUN a2enmod ssl
#RUN a2ensite default-ssl
#RUN mkdir /etc/apache2/ssl
#RUN rm /etc/apache2/sites-available/000-default.conf
#ADD 000-default.conf /etc/apache2/sites-available/000-default.conf
#RUN rm /etc/apache2/sites-available/default-ssl.conf
#ADD default-ssl.conf /etc/apache2/sites-available/default-ssl.conf

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

##virtual host
ADD ns1.conf /etc/apache2/sites-available/ns1.conf
RUN ln -s /etc/apache2/sites-available/ns1.conf /etc/apache2/sites-enabled/ns1.conf
ADD neostation.conf /etc/apache2/sites-available/neostation.conf
RUN ln -s /etc/apache2/sites-available/neostation.conf /etc/apache2/sites-enabled/neostation.conf

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80
EXPOSE 443