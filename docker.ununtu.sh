#!/bin/bash

#author ANN
#date 11/4/2022
#des:installing docker on Ubuntu Bionic 18.04 up!!!

#Uninstalling old version

sudo apt-get remove docker docker-engine docker.io containerd runc

#setting up repos
sudo apt-get update -y
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release 

#Add Docker’s official GPG key:
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#Use the following command to set up the repository:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt-get update -y
  if [ $? -nq 0 ]
then 

  sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update
echo "                 fixed 
"
sleep 4

fi
#To install the latest version, run:
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo docker run hello-world

echo "        docker sucessfully installed   
"