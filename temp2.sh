#!/usr/bin/env bash 

# Client side
SERVER_IP='100.26.166.171'; 
SERVER_USER='ubuntu'; 
PRIVATE_KEY_LOC='../Keys/cubar-first-server.pem'; 

# Send the service_server_scripts folder to the server to run
sudo utils/transfer_folder.sh ./service_server_scripts $SERVER_IP ubuntu $PRIVATE_KEY_LOC;

# Run the command_script.sh in the server
sudo ssh "${SERVER_USER}@${SERVER_IP}" -i $PRIVATE_KEY_LOC "sudo /home/ubuntu/service_server_scripts/command_script.sh;"; 

#Deploy the initial web static
#sudo python3 deploy_web_static.py; 
#Deploy the initial web dynamic
#sudo python3 deploy_web_dynamic.py; 