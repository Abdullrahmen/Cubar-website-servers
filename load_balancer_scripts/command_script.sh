#!/usr/bin/env bash

# Installs and setup haproxy
sudo apt -y update
sudo apt install -y haproxy
echo "ENABLED=1" | sudo tee /etc/default/haproxy;

sudo cp /home/ubuntu/load_balancer_scripts/http.cfg /etc/haproxy/haproxy.cfg;
sudo service haproxy restart