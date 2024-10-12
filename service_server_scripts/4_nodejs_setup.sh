#!/usr/bin/env bash
sudo apt update; 
sudo apt -y install nodejs; 
sudo apt -y install npm; 
sudo npm install -g pm2; 

pm2 start /data/web_dynamic_nodejs/current/main.js
pm2 save
# last line in: pm2 startup systemd
sudo env PATH=$PATH:/usr/bin /usr/local/lib/node_modules/pm2/bin/pm2 startup systemd -u ubuntu --hp /home/ubuntu
