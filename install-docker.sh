#!/bin/sh

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

# Docker
sudo apt remove --yes docker docker-engine docker.io containerd runc || true
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update

sudo apt -y install docker-ce
printf '\nDocker installed successfully\n\n'

sudo usermod -aG docker ${USER}

sudo apt -y install curl
sudo curl -L "https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
