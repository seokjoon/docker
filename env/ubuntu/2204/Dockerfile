# FROM ubuntu:jammy-20220101
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# https://stackoverflow.com/questions/71941032/why-i-cannot-run-apt-update-inside-a-fresh-ubuntu22-04
RUN sed -i -e 's/^APT/# APT/' -e 's/^DPkg/# DPkg/' /etc/apt/apt.conf.d/docker-clean

RUN apt-get update && apt-get -y install \
    git \
#    nodejs \
#    python3-pip python3-venv \
#    supervisor \
    net-tools \
    ssh \
    vim \
    && apt-get clean

WORKDIR /etc/ssh
RUN sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/g" sshd_config
RUN sed -i "s/#PasswordAuthentication yes/PasswordAuthentication yes/g" sshd_config

WORKDIR /root
ADD .bash_alises /root/.bash_aliases

EXPOSE 21
EXPOSE 22

# d run -d --name 2204 seokjoon:ubuntu2204 sleep infinity