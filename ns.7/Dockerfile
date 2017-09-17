FROM ubuntu:17.04
MAINTAINER Seok Joon Lee <seokjoon@gmail.com>
## https://gist.github.com/remarkablemark/aacf14c29b3f01d6900d13137b21db3a

## dpkg BEGIN
RUN apt-get update

## nvm, npm
SHELL ["/bin/bash", "-c"]
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 6.11.3
RUN apt-get -y install curl
### https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

##RUN apt-get install -y npm

RUN node -v
RUN npm -v

## dpkg END
RUN apt-get clean

EXPOSE 80
EXPOSE 443