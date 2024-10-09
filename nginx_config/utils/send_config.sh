#!/usr/bin/env bash

if [ $# -lt 2 ]
then
  echo "Usage: send_config.sh FILE_PATH_FROM_PREV_FOLDER IP"
else
  scp -o StrictHostKeyChecking=no "../$1" "ubuntu@$2":~/
  ssh "ubuntu@$2" "sudo mv ~/$1 /etc/nginx/nginx.conf; sudo systemctl reload nginx;"
fi