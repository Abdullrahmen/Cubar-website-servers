#!/usr/bin/env bash

if [ $# -lt 2 ]
then
  echo "Usage: send_command.sh FILE_PATH_FROM_PREV_FOLDER IP"
else
  scp -o StrictHostKeyChecking=no "../$1" "ubuntu@$2":~/
  ssh "ubuntu@$2" "sudo ~/$1; sudo rm ~/$1;"
fi