#!/bin/bash

VIRTUALBOX_VERSION=$(VBoxManage --version|sed 's/r.*$//g')
echo "VIRTUALBOX_VERSION: ${VIRTUALBOX_VERSION}"

DOCKER_VERSION=$(docker --version 2>/dev/null|sed -n 's/^Docker version \(.*\),.*/\1/p')
echo "DOCKER_VERSION: ${DOCKER_VERSION}"

sed -e "s/\${VIRTUALBOX_VERSION}/${VIRTUALBOX_VERSION}/g" -e "s/\${DOCKER_VERSION}/${DOCKER_VERSION}/g" < docker_packer.json.template > docker_packer.json
sed -e "s/\${VIRTUALBOX_VERSION}/${VIRTUALBOX_VERSION}/g" -e "s/\${DOCKER_VERSION}/${DOCKER_VERSION}/g" < Vagrantfile.template > Vagrantfile

packer build docker_packer.json
