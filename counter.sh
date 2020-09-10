#!/bin/bash
echo Press
echo ... a/b/c/d to increment a counter
echo ... A/B/C/D to decrement a counter
echo ... q to stop
echo
a=0
b=0
c=0
d=0
while true; do
	printf '\r%4d  + %4d  + %4d  + %4d  = %6d    ' $a $b $c $d $((a + b + c + d))
	read -n 1 -s -r k
	case "$k" in
		a)
			a=$((a + 1)) ;;
		A)
			a=$((a - 1)) ;;
		b)
			b=$((b + 1)) ;;
		B)
			b=$((b - 1)) ;;
		c)
			c=$((c + 1)) ;;
		C)
			c=$((c - 1)) ;;
		d)
			d=$((d + 1)) ;;
		D)
			d=$((d - 1)) ;;
		q)
			break ;;
	esac
done
echo

