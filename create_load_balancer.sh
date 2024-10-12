#!/usr/bin/env bash
# Client side
SERVER_IP="18.212.119.44"; 
SERVER_USER="ubuntu"
PRIVATE_KEY_LOC="../Keys/cubar.pem"

# Send the load_balancer_scripts folder to the server to run
sudo utils/transfer_folder.sh ./load_balancer_scripts $SERVER_IP ubuntu $PRIVATE_KEY_LOC;

# Run the command_script.sh in the server
sudo ssh "${SERVER_USER}@${SERVER_IP}" -i $PRIVATE_KEY_LOC "sudo ~/load_balancer_scripts/command_script.sh;"; 
