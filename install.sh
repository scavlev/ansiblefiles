#!/bin/sh

sudo apt-get install software-properties-common -y
gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7BB9C367
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update -y
sudo apt-get install ansible -y
