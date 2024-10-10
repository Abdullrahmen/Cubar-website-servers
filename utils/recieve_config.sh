#!/usr/bin/env bash

if [ $# -lt 3 ]
then
  echo "Usage: recieve_config.sh IP USERNAME PATH_TO_SSH_KEY"
else
  sudo scp -o StrictHostKeyChecking=no -i "$3" "$2@$1":/etc/nginx/nginx.conf ../recieved_config/
fi