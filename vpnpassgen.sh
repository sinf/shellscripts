#!/bin/sh
# Generate simple passwords for security non-critical stuff

d=/usr/share/dict/british-english 

for user in `egrep '^[a-z]{5,8}$' $d|sort -R|head -n 20`; do
	pass1=`egrep '^[a-z]{4}$' $d|sort -R|head -n 1`
	pass2=`cat /dev/urandom|tr -dc 'a-zA-Z0-9'|head -c 4`
	passw="$pass1$pass2"
	echo "$user * $passw *"
done

