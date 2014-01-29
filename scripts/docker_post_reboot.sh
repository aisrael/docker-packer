#!/bin/bash

# add the docker gpg key
# curl https://get.docker.io/gpg | apt-key add -
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

# Make sure the /etc/apt/sources.list.d directory exists!
mkdir -p /etc/apt/sources.list.d

# Add the Docker repository to your apt sources list.
sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
[ ! -f /etc/apt/sources.list.d/docker.list ] && exit 100

# Update your sources
apt-get update

# Install. Confirm install.
apt-get install -y lxc-docker
