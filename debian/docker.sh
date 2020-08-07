#!/bin/bash
# script to install docker and docker-compose on a fresh Debian install
# still working on this, so right now just basic commands below

# update apt
apt-get update

# install dependencies
apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common lsb-release

# add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

# add Docker repo
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

# update apt again to fetch new docker repo
apt-get update

# install docker et all 
apt-get -y install docker-ce docker-ce-cli containerd.io

# download latest docker-compose binary and move it to /usr/local/bin
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# make binary file executable
chmod +x /usr/local/bin/docker-compose
