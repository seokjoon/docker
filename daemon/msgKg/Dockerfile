FROM ubuntu:20.04
MAINTAINER Seok Joon Lee <seokjoon@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

## jdk
RUN apt-get update && apt-get -y install openjdk-8-jdk && apt-get clean
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
#ENV JAVA_HOME=$(dirname $(dirname $(update-alternatives --list javac)))

## build path
ADD BmAgent /BmAgent

# RUN mkdir /user1 && mkdir /user1/log && mkdir /user1/log/mcash && mkdir /user1/log/mcash/BmAgent
USER root
WORKDIR /BmAgent
# CMD ["/bin/bash", "-c", "nohup java -classpath ./BmAgent_lib/*:./BmAgent.jar bm.Agent start 1>/dev/null 2>&1 &"]
CMD ["/bin/bash", "-c", "java -classpath ./BmAgent_lib/*:./BmAgent.jar bm.Agent start"]


#!/bin/sh
#JAVA_HOME=/usr/jdk/jdk1.6.0_29/bin/java
#export JAVA_HOME
#nohup $JAVA_HOME -classpath ./BmAgent_lib/*:./BmAgent.jar bm.Agent start 1>/dev/null 2>&1 &

