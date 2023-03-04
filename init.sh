#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

# Update
sudo apt update

# nginx
sudo apt install nginx -y
sudo ufw allow 'Nginx HTTP'
