# Client side
# Send the entire scripts' folder to the server to run
sudo utils/transfer_folder.sh ./Scripts 100.26.18.252 ubuntu ../Keys/cubar-first-server.pem;

# Run the command script in the server
sudo ssh "ubuntu@100.26.18.252" -i "../Keys/cubar-first-server.pem" "sudo ~/Scripts/command_script.sh;"

#Deploy the initial web static
sudo python3 deploy_web_static.py
