#!/usr/bin/env bash
# Server side
sudo /home/ubuntu/service_server_scripts/0_install_puppet.sh; 
sudo puppet apply /home/ubuntu/service_server_scripts/1_initial_setup.pp; 
sudo puppet apply /home/ubuntu/service_server_scripts/2_setup_web_static.pp; 
sudo puppet apply /home/ubuntu/service_server_scripts/3_setup_web_dynamic.pp; 
sudo /home/ubuntu/service_server_scripts/4_nodejs_setup.sh; 

sudo cp /home/ubuntu/service_server_scripts/nginx_config/setup_dynamic_static.conf /etc/nginx/nginx.conf; 
sudo systemctl restart nginx; 
