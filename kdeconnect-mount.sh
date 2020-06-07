#!/bin/sh
# manual method to mount kdeconnect device
set -e
set -x
IP=192.168.1.9999999999999 #<- edit this field
D=$(kdeconnect-cli --id-only -l)
M="$HOME/.config/kdeconnect/$D/kdeconnect_sftp/$D"
mkdir -p "$M"
sshfs -o rw,nosuid,nodev,identityfile="$HOME/.config/kdeconnect/privateKey.pem",port=1740 kdeconnect@$IP:/ "$M"

