#!/bin/bash

# Update your sources
apt-get update

# Install. Confirm install.
apt-get install -y docker.io

# Have docker listening to a particular port
sed -i 's/DOCKER_OPTS=$/DOCKER_OPTS="-H tcp:\/\/0.0.0.0:4243"/' /etc/init.d/docker.io
sed -i 's/DOCKER_OPTS=$/DOCKER_OPTS="-H tcp:\/\/0.0.0.0:4243"/' /etc/init/docker.io.conf

# Install docker client
apt-get install -y docker
