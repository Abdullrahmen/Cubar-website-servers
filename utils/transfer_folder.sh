#!/usr/bin/env bash
# Transfers a folder from a client to another.
# Accepts four arguments:
#+    The path to the folder to be transferred.
#+    The IP of the server to transfer the folder to.
#+    The username that scp connects with.
#+    The path to the SSH private key that scp uses.

if [ $# -lt 4 ]
then
  echo "Usage: transfer_folder.sh PATH_TO_FOLDER IP USERNAME PATH_TO_SSH_KEY"
else
  sudo scp -r -o StrictHostKeyChecking=no -i "$4" "$1" "$3@$2":~
fi