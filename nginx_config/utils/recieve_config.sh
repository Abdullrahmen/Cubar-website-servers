#!/usr/bin/env bash

if [ $# -lt 1 ]
then
  echo "Usage: recieve_config.sh IP"
else
  scp -o StrictHostKeyChecking=no "ubuntu@$1":/etc/nginx/nginx.conf ../recieved_config/
fi