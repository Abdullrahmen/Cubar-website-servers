# Server side
cd /home/ubuntu/Scripts; 
sudo ./0_install_puppet.sh; 
sudo puppet apply 1_initial_setup.pp; 
sudo puppet apply 2_setup_web_static.pp; 
sudo cp ./nginx_config/setup_web_static.conf /etc/nginx/nginx.conf; 
sudo systemctl reload nginx; 
