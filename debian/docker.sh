#!/bin/bash
# script to install docker and docker-compose on a fresh Debian install
# still working on this, so right now just basic commands below

# update apt
apt-get update

# install dependencies
apt-get install apt-transport-https ca-certificates curl gnupg

# add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# add Docker repo
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list

# update apt again to fetch new docker repo
apt-get update

# install docker et all 
apt-get install docker-ce docker-ce-cli containerd.io

# download latest docker-compose binary and move it to /usr/local/bin
curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# make binary file executable
chmod +x /usr/local/bin/docker-compose
