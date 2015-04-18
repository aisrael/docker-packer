#!/bin/bash

# See http://docs.docker.com/installation/ubuntulinux/#installing-docker-on-ubuntu
bash -c 'wget -qO- https://get.docker.com/ | sh'

# inotify-tools is useful to see changes in Docker 'mounted' VOLUMEs
apt-get install -y inotify-tools

# Have docker listening to a particular port
sed -i '/^#DOCKER_OPTS/a DOCKER_OPTS="-H tcp://0.0.0.0:4243"' /etc/default/docker

echo "export DOCKER_HOST=localhost:4243" >> ~/.bashrc
