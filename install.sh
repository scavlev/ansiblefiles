#!/bin/sh

sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible-1.9 -y
sudo apt-get update -y
sudo apt-get install ansible -y