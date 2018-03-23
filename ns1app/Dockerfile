FROM ubuntu:17.10
MAINTAINER Seok Joon Lee <seokjoon@gmail.com>

## nodejs
RUN apt-get update && apt-get -y install curl && apt-get clean
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs && apt-get clean
## yarn
RUN npm install --global yarn
RUN mkdir /var/www

##
RUN echo "127.0.0.1       ns-ha.neo-station.com" >> /etc/hosts

EXPOSE 80
EXPOSE 8080
EXPOSE 8088
EXPOSE 443