#!/bin/bash


if [[ $DEBUG == true ]]; then
  set -ex
else
  set -e
fi

# content of om-instalation sent to remote server

echo $SSH_PRIVATE_KEY > server_key
rsync -e 'ssh -i server_key' -qpr om-installation $USER@$SERVER:/home/$USER/backups/
rm server_key
