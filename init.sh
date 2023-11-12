#!/bin/sh

export DEBIAN_FRONTEND=noninteractive
export NEEDRESTART_MODE=a

# Update
apt update
apt upgrade -y

# Nginx
apt install nginx -y
ufw allow 'Nginx HTTP'


reboot
