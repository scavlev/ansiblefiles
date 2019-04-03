#!/bin/sh

set -x

. /etc/os-release

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7BB9C367
if [ "$ID" = "debian" ]; then
  sudo sh -c "echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu cosmic main' > /etc/apt/sources.list.d/ansible.list"
else
  sudo apt-get install software-properties-common -y
  sudo apt-add-repository ppa:ansible/ansible -y
fi
sudo apt-get update -y
sudo apt-get install ansible -y
