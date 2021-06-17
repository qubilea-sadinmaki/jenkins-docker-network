#!/bin/bash

# this script is only tested on Ubuntu 18.04 (LTS) x64
# login: ssh -i /pathto/keypair.pem ubuntu@ec2-xx-xxx-xxx-xxx.eu-central-1.compute.amazonaws.com
# install docker & docker-compose
sudo apt-get update
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
# sudo usermod -aG docker ubuntu
sudo apt install -y docker-compose

# run jenkins-docker-network
sudo mkdir -p jenkins_home
sudo chown -R 1000:1000 jenkins_home/
sudo mkdir -p jenkins
wget https://raw.githubusercontent.com/qubilea-sadinmaki/jenkins-docker-network/main/jenkins/Dockerfile
mv Dockerfile jenkins
wget https://raw.githubusercontent.com/qubilea-sadinmaki/jenkins-docker-network/main/docker-compose.yml
docker-compose up -d

# show endpoint
echo 'Jenkins-Docker-network running'
echo 'You should now be able to access jenkins at: http://'$(curl -s ifconfig.co)':8080'
