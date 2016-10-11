FROM debian:8
MAINTAINER Seok Joon Lee <seokjoon@gmail.com>

##certbot
# Mount /etc/letsencrypt
#
# Set noninteractive mode for apt-get 
ENV DEBIAN_FRONTEND noninteractive 
ENV EMAIL=seokjoon@gmail.com DOMAINS="ecfirm.net"
##certbot

RUN apt-get update && apt-get -y install apache2 php5 php5-gd php5-mysql mysql-client php5-gearman libcurl3-gnutls php5-curl wget && apt-get clean

##certbot
RUN cd /usr/local/bin && \
wget https://dl.eff.org/certbot-auto && \
chmod a+x certbot-auto && \
ln -s certbot-auto certbot &&\
certbot -n --os-packages-only

ADD assets/cli.ini /

# Cleanup
RUN apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log
##certbot

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
ADD joomla.conf /etc/apache2/sites-available/joomla.conf
ADD kilmeny.conf /etc/apache2/sites-available/kilmeny.conf
RUN ln -s /etc/apache2/sites-available/joomla.conf /etc/apache2/sites-enabled/joomla.conf
RUN ln -s /etc/apache2/sites-available/kilmeny.conf /etc/apache2/sites-enabled/kilmeny.conf

##certbot
ENTRYPOINT ["/usr/local/bin/certbot"]
CMD ["config_changes", "--no-self-upgrade"]
##certbot
#CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80
EXPOSE 443