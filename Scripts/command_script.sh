# Server side
sudo /home/ubuntu/Scripts/0_install_puppet.sh; 
sudo puppet apply /home/ubuntu/Scripts/1_initial_setup.pp; 
sudo puppet apply /home/ubuntu/Scripts/2_setup_web_static.pp; 
sudo puppet apply /home/ubuntu/Scripts/3_setup_web_dynamic.pp; 
sudo /home/ubuntu/Scripts/4_nodejs_setup.sh; 

sudo cp /home/ubuntu/Scripts/nginx_config/setup_dynamic_static.conf /etc/nginx/nginx.conf; 
sudo systemctl restart nginx; 
