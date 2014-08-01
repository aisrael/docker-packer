#!/bin/bash

sudo apt-get -y install gcc gcc-4.7

# Without libdbus virtualbox would not start automatically after compile
sudo apt-get -y install --no-install-recommends libdbus-1-3

# The netboot installs the VirtualBox support (old) so we have to remove it
/etc/init.d/virtualbox-ose-guest-utils stop
rmmod vboxguest
aptitude -y purge virtualbox-ose-guest-x11 virtualbox-ose-guest-dkms virtualbox-ose-guest-utils
aptitude -y install dkms

# Install the VirtualBox guest additions
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
VBOX_ISO=VBoxGuestAdditions_$VBOX_VERSION.iso
mount -o loop $VBOX_ISO /mnt
yes|sh /mnt/VBoxLinuxAdditions.run
# Fix for http://stackoverflow.com/a/22723807/878182
# ln -s /opt/VBoxGuestAdditions-4.3.12/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
umount /mnt

# Cleanup VirtualBox
rm $VBOX_ISO
