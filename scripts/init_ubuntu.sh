#!/bin/bash

# this script is only tested on Ubuntu 18.04 (LTS) x64

# install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose
systemctl enable docker
systemctl start docker

# run jenkins-docker-network
mkdir -p jenkins_home
chown -R 1000:1000 jenkins_home/
mkdir -p jenkins
wget https://raw.githubusercontent.com/qubilea-sadinmaki/jenkins-docker-network/main/jenkins/Dockerfile
mv Dockerfile jenkins
wget https://raw.githubusercontent.com/qubilea-sadinmaki/jenkins-docker-network/main/docker-compose.yml
docker-compose up -d

# show endpoint
echo 'Jenkins-Docker-network running'
echo 'You should now be able to access jenkins at: http://'$(curl -s ifconfig.co)':8080'
