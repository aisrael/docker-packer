# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  BOX_NAME = 'ubuntu-14.04-server-amd64-vbox-4.3.10-docker-0.9.1'

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = BOX_NAME

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "#{BOX_NAME}.box"

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  {
    docker: 4243,
    apt_cacher_ng: 3142,
    mysql: 3306,
    redis: 6379,
    memcached: 11211
  }.values.each do |port|
    config.vm.network :forwarded_port, guest: port, host: port
  end

  # config.vm.synced_folder '.', '/vagrant',
  #     owner: 'apt-cacher-ng',
  #     group: 'apt-cacher-ng',
  #     mount_options: ['dmode=755,fmode=755']
end
