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

apt-get install -y linux-image-generic-lts-raring linux-headers-generic-lts-raring

reboot

# need sleep, otherwise Packer will attempt to execute the next script
# before the VM has had a chance to reboot
sleep 60
