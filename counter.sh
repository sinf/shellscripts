#!/bin/bash
echo Press q to stop, any other key to increment the counter
x=0
while true; do
	printf '\r%d' $x
	read -n 1 -s -r k
	if [ "$k" = "q" ]; then break; fi
	x=$((x + 1))
done
echo

