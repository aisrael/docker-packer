#!/bin/bash

# enable memory and swap cgroup
perl -p -i -e 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"/g'  /etc/default/grub
/usr/sbin/update-grub

# add docker group and add vagrant to it
sudo groupadd docker
# sudo usermod -a -G docker ubuntu
sudo usermod -a -G docker vagrant

# install curl
apt-get update
apt-get install -y curl

# add the docker gpg key
# curl https://get.docker.io/gpg | apt-key add -
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

apt-get install -y linux-image-generic-lts-raring linux-headers-generic-lts-raring

# Make sure the /etc/apt/sources.list.d directory exists!
[ ! -d /etc/apt/sources.list.d ] && mkdir -p /etc/apt/sources.list.d

# Add the Docker repository to your apt sources list.
echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list

reboot

# need sleep, otherwise Packer will attempt to execute the next script
# before the VM has had a chance to reboot
sleep 60
