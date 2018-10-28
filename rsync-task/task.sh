#!/bin/bash


if [[ $DEBUG == true ]]; then
  set -ex
else
  set -e
fi

# content of om-instalation sent to remote server

# sed trick to format key properly
echo $SSH_PRIVATE_KEY  | sed 's/-----BEGIN RSA PRIVATE KEY-----//' | sed 's/ -----END RSA PRIVATE KEY-----//' | sed 's/ /\n/g'  | sed '1s/^/-----BEGIN RSA PRIVATE KEY-----/' | sed -e '$a-----END RSA PRIVATE KEY-----' > ../server_key
chmod 600 ../server_key
rsync -e 'ssh -oStrictHostKeyChecking=no -i ../server_key' -qpr om-installation $USER@$SERVER:/home/$USER/backups/
rm ../server_key
