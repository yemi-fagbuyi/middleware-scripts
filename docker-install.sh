#!/bin/bash

#Author:Ann 
#date :10252022
# script to install Docker on centos/7

# user_name=`whoami`

# if [ $user_name != vagrant ];

# then
# echo "Must be run as user vagrant !!!!"
# exit 1
# fi
# echo "Firt we need to update YUM!!!"

sudo yum update -y

sleep 4

echo "Clean up the system"
sleep 4

sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine


echo "Setup the docker repository"
sleep 5
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

echo " install the docker engine"

sleep 4

 sudo yum install docker-ce docker-ce-cli containerd.io -y

 systemctl status docker
systemctl start docker
systemctl enable docker


sudo systemctl status docker

echo "Docker installation sucessful!!!"

sleep 10
