#!/usr/bin/env bash

if [ $# -lt 4 ]
then
  echo "Usage: send_config.sh PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY"
else
  scp -o StrictHostKeyChecking=no -i "$4" "$1" "$3@$2":~/
  ssh "$3@$2" "sudo mv ~/${1##*/} /etc/nginx/nginx.conf; sudo systemctl reload nginx;"
fi