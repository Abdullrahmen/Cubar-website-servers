#!/usr/bin/env bash
# Transfers a file from a client to another.
# Accepts four arguments:
#+    The path to the file to be transferred.
#+    The IP of the server to transfer the file to.
#+    The username that scp connects with.
#+    The path to the SSH private key that scp uses.

if [ $# -lt 4 ]
then
  echo "Usage: transfer_file.sh PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY"
else
  sudo scp -o StrictHostKeyChecking=no -i "$4" "$1" "$3@$2":~
fi