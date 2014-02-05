#!/bin/bash

# add the docker gpg key
# curl https://get.docker.io/gpg | apt-key add -
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

# Make sure the /etc/apt/sources.list.d directory exists!
mkdir -p /etc/apt/sources.list.d

# Add the Docker repository to your apt sources list.
sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"

# Update your sources
apt-get update

# Install. Confirm install.
apt-get install -y lxc-docker

# Have docker listening to a particular port
sed -i 's/DOCKER_OPTS=$/DOCKER_OPTS="-H tcp:\/\/ -H unix:\/\/"/' /etc/init.d/docker
sed -i 's/DOCKER_OPTS=$/DOCKER_OPTS="-H tcp:\/\/ -H unix:\/\/"/' /etc/init/docker.conf
