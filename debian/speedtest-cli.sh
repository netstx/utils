#!/bin/bash
# script to install speedtest.net cli tool
# still working on this, so right now just basic commands below

# install dependencies
apt-get -y install gnupg1 apt-transport-https dirmngr lsb-release

# set key
export INSTALL_KEY=379CE192D401AB61

# set current debian release
export DEB_DISTRO=$(lsb_release -sc)

# add key
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $INSTALL_KEY

# install repository 
echo "deb https://ookla.bintray.com/debian ${DEB_DISTRO} main" | tee /etc/apt/sources.list.d/speedtest.list

# update and install speedtest
apt-get update && apt-get -y install speedtest
