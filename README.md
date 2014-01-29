docker-packer
=============

A Packer project that builds Ubuntu 12.04 LTS with Docker, primarily for use in Vagrant + Virtualbox, to be able to run the docker client natively on OS X.

Prerequisites (Mac OS X)
----

1. [VirtualBox](https://www.virtualbox.org/)
2. [Vagrant](http://vagrantup.com/)
3. [Homebrew](http://brew.sh/)

Instructions
----

#### Install packer

    brew install packer

#### Build the box

    packer build template.json

#### Launch the box

    vagrant up

#### Install docker

    brew install docker

