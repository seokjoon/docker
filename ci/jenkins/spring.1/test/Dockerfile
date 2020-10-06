FROM ubuntu:20.04
MAINTAINER Seok Joon Lee <seokjoon@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

## jdk
RUN apt-get update && apt-get -y install openjdk-8-jdk && apt-get clean
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
#ENV JAVA_HOME=$(dirname $(dirname $(update-alternatives --list javac)))

## build path
ADD path /path


CMD ["/bin/bash", "-c", "/path/gradlew build && java -jar /path/build/libs/gs-spring-boot-docker-0.1.0.jar"]


EXPOSE 80
EXPOSE 8080
