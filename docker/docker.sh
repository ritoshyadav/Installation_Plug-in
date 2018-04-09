#!/bin/bash

echo "Update system"
sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce

apt-cache madison docker-ce
$ sudo apt-get install docker-ce


echo "NOTE INSTSLL Latest version from site MACHINE/COMPOSE"
echo "Docker Machine install"
curl -L https://github.com/docker/machine/releases/download/v0.14.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine && \
sudo install /tmp/docker-machine /usr/local/bin/docker-machine

echo "Docker compose"

sudo curl -L https://github.com/docker/compose/releases/download/1.20.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
