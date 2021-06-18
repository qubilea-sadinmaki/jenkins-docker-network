#!/bin/bash

# this script is only tested on Ubuntu 18.04 (LTS) x64
# login: ssh -i /pathto/keypair.pem ec2-user@ec2-xx-xxx-xxx-xxx.eu-central-1.compute.amazonaws.com
# wget https://raw.githubusercontent.com/qubilea-sadinmaki/jenkins-docker-network/main/scripts/amazon_linux2_naked.sh
# sh amazon_linux2_naked.sh

# install updates & docker
sudo yum update -y
sudo amazon-linux-extras install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user

# install Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
sudo yum install jenkins java-1.8.0-openjdk-devel -y
sudo systemctl daemon-reload
sudo systemctl start jenkins
