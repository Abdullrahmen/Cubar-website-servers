sudo apt update; 
sudo apt -y install nodejs; 
sudo apt -y install npm; 
sudo npm install -g pm2; 

pm2 start /home/ubuntu/node_project/hello.js
# last line in: pm2 startup systemd
sudo env PATH=$PATH:/usr/bin /usr/local/lib/node_modules/pm2/bin/pm2 startup systemd -u ubuntu --hp /home/ubuntu
