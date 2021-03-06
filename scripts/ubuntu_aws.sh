#!/bin/bash

# this script is only tested on Ubuntu 18.04 (LTS) x64
# login: ssh -i /pathto/keypair.pem ubuntu@ec2-xx-xxx-xxx-xxx.eu-central-1.compute.amazonaws.com
# wget https://raw.githubusercontent.com/qubilea-sadinmaki/jenkins-docker-network/main/scripts/ubuntu_aws.sh
# sh ubuntu_aws.sh

# install updates & docker & docker-compose
sudo apt-get update
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker ubuntu
sudo apt install -y docker-compose

# create directories & download files for docker network
mkdir -p jenkins_home
chown -R 1000:1000 jenkins_home/
mkdir -p jenkins
wget https://raw.githubusercontent.com/qubilea-sadinmaki/jenkins-docker-network/main/jenkins/Dockerfile
mv Dockerfile jenkins
wget https://raw.githubusercontent.com/qubilea-sadinmaki/jenkins-docker-network/main/docker-compose.yml

# show endpoint
echo 'Everything ready, just log out and back in, then "docker-compose up -d"'
# could not get Amazon EC2 plugin configured on jenkins (region dropdown was empty)
