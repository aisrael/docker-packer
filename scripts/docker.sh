#!/bin/bash

# Add the Docker repository key to local keychain
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

# Make sure the /etc/apt/sources.list.d directory exists!
mkdir -p /etc/apt/sources.list.d

# Add the Docker repository to your apt sources list.
sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"

# Update sources
apt-get update

# Install. Confirm install.
apt-get install -y lxc-docker

# inotify-tools is useful to see changes in Docker 'mounted' VOLUMEs
apt-get install -y inotify-tools

# Have docker listening to a particular port
sed -i 's/DOCKER_OPTS=$/DOCKER_OPTS="-H tcp:\/\/0.0.0.0:4243"/' /etc/init.d/docker.io
sed -i 's/DOCKER_OPTS=$/DOCKER_OPTS="-H tcp:\/\/0.0.0.0:4243"/' /etc/init/docker.io.conf

echo "export DOCKER_HOST=localhost:4243" >> ~/.bashrc
