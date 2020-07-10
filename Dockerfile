FROM php:7.3.19-cli
LABEL Maintainer="Luis Lopes <luis@bitok.pt>" \
      Description="Container with PHP 7.3 and Ansible for application deployments based on Ubuntu"

RUN apt-get update

# install composer and "dependencies"
RUN apt-get install -y wget unzip
COPY install-composer.sh /root/install-composer.sh
RUN sh /root/install-composer.sh

# install npm & gulp
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
RUN apt-get install -y nodejs
RUN npm install -g gulp

# oh, we need git and the ssh client too...
RUN apt-get install -y git openssh-client

# install ansible from a package too
RUN apt-get install -y ansible
# clear apt cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# done
