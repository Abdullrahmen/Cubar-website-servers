# Client side
# Send the entire scripts' folder to the server to run
sudo ../utils/transfer_folder.sh ../Scripts 44.193.214.147 ubuntu ../../Keys/cubar-first-server.pem;

# Run the command script in the server
sudo ssh "ubuntu@44.193.214.147" -i "../../Keys/cubar-first-server.pem" "sudo ~/Scripts/command_script.sh;"