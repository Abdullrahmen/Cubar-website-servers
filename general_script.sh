# Client side
# Send the entire scripts' folder to the server to run
sudo utils/transfer_folder.sh ./Scripts 54.237.73.32 ubuntu ../Keys/cubar-first-server.pem;

# Run the command script in the server
sudo ssh "ubuntu@54.237.73.32" -i "../Keys/cubar-first-server.pem" "sudo ~/Scripts/command_script.sh;"

#Deploy the initial web static
sudo python3 deploy_web_static.py