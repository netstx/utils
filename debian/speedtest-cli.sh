#!/bin/bash
# script to install speedtest.net cli tool on debian
# still working on this, so right now just basic commands below

# install dependencies
apt-get install gnupg1 apt-transport-https dirmngr

# set key
export INSTALL_KEY=379CE192D401AB61

# add key
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $INSTALL_KEY

# set apt list file
echo "deb https://ookla.bintray.com/debian generic main" | tee /etc/apt/sources.list.d/speedtest.list

# update apt repos and install speedtest package
apt-get update && apt-get -y install speedtest
