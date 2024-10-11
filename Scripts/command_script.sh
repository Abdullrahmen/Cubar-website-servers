# Server side
sudo mkdir /home/ubuntu/node_project; 
sudo cp /home/ubuntu/Scripts/nodejs_test.js /home/ubuntu/node_project/hello.js; 

sudo /home/ubuntu/Scripts/0_install_puppet.sh; 
sudo puppet apply /home/ubuntu/Scripts/1_initial_setup.pp; 
sudo puppet apply /home/ubuntu/Scripts/2_setup_web_static.pp; 
sudo /home/ubuntu/Scripts/3_nodejs_setup.sh; 

sudo cp /home/ubuntu/Scripts/nginx_config/setup_dynamic_static.conf /etc/nginx/nginx.conf; 
sudo systemctl restart nginx; 