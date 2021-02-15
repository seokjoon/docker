FROM ubuntu:20.04
MAINTAINER Seok Joon Lee <seokjoon@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

## nginx & php
RUN apt-get update && apt-get -y install php7.4 php7.4-fpm php7.4-gd php7.4-mysql mysql-client php7.4-curl php7.4-xml php-mbstring php-zip php-bcmath php-redis nginx && apt-get clean
RUN rm /etc/nginx/sites-available/default
ADD default /etc/nginx/sites-available/default

## timezone KST
WORKDIR /etc/php/7.4/fpm
RUN sed -i "s/;date.timezone =/date.timezone = Asia\/Seoul/g" php.ini

## nginx: GET url length limit: upstream sent too big header while reading
WORKDIR /etc/nginx
RUN sed -i "/^http {/a fastcgi_buffers 16 16k;" nginx.conf
RUN sed -i "/^fastcgi_buffers 16 16k;/a fastcgi_buffer_size 32k;" nginx.conf

## supervisor
# RUN apt-get update && apt-get install -y supervisor && apt-get clean
# RUN mkdir -p /var/log/supervisor
# ADD supervisord.conf /etc/supervisor/supervisord.conf
# ADD di-queue-work.conf /etc/supervisor/conf.d/di-queue-work.conf


## ms odbc
RUN apt-get update && apt-get install -y curl gnupg
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql17
## to run pecl
## to run compile with phpize the sqlsrv
## to make sqlsrv
RUN apt-get install -y php-pear php7.4-dev unixodbc-dev
RUN pecl install sqlsrv pdo_sqlsrv
RUN printf "; priority=20\nextension=sqlsrv.so\n" > /etc/php/7.4/mods-available/sqlsrv.ini
RUN printf "; priority=30\nextension=pdo_sqlsrv.so\n" > /etc/php/7.4/mods-available/pdo_sqlsrv.ini
RUN phpenmod -v 7.4 sqlsrv pdo_sqlsrv


CMD ["/bin/bash", "-c", "/usr/sbin/service php7.4-fpm start && nginx -g 'daemon off;'"]
# ADD start.sh /start.sh
# RUN chmod +x /start.sh
# CMD ["/start.sh"]


EXPOSE 80
EXPOSE 443
EXPOSE 6001
