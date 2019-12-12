#! /bin/bash
# It will complete the docker installation and setup

sudo apt-get update

sudo apt-get -y remove unscd

sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update

sudo apt-get -y install docker-ce docker-ce-cli containerd.io

sudo groupadd docker

sudo usermod -aG docker $USER

sudo addgroup --system docker

sudo adduser $USER docker

newgrp docker

# It will complete the Jenkins setup

docker run --rm -d -u root --name jenkins-container \
-p 8080:8080 \
-v ~/jenkins-data:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
-v "$HOME":/home \
jenkinsci/blueocean

