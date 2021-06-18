#!/bin/bash

# this script is only tested on Ubuntu 18.04 (LTS) x64
# login: ssh -i /pathto/keypair.pem ec2-user@ec2-xx-xxx-xxx-xxx.eu-central-1.compute.amazonaws.com
# wget https://raw.githubusercontent.com/qubilea-sadinmaki/jenkins-docker-network/main/scripts/amazon_linux2.sh
# sh amazon_linux2.sh

# install updates & docker
sudo yum update -y
sudo amazon-linux-extras install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user
# install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
# or latest version
# sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# create directories & download files for docker network
mkdir -p jenkins_home
chown -R 1000:1000 jenkins_home/
mkdir -p jenkins
wget https://raw.githubusercontent.com/qubilea-sadinmaki/jenkins-docker-network/main/jenkins/Dockerfile
mv Dockerfile jenkins
wget https://raw.githubusercontent.com/qubilea-sadinmaki/jenkins-docker-network/main/docker-compose.yml

# show endpoint
echo 'Everything ready, just log out and back in, then "docker-compose up -d"'
