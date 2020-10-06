FROM ubuntu:18.04
MAINTAINER Seok Joon Lee <seokjoon@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

## jdk
RUN apt-get update && apt-get -y install openjdk-8-jdk && apt-get clean
#ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV JAVA_HOME=$(dirname $(dirname $(update-alternatives --list javac)))


CMD ["/bin/bash", "-c", "./gradlew build && java -jar build/libs/gs-spring-boot-docker-0.1.0.jar"]


EXPOSE 80
EXPOSE 8080
EXPOSE 8880
