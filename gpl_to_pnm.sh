#!/bin/sh
# Converts GIMP palette (.gpl) to .pnm image
# both are simple text files

if [ x"$1" = "x" ]; then
	echo "Need an input file (GIMP palette; *.gpl)"
	exit
fi

# +5 comes from assuming GIMP emits an empty comment line

echo P3
echo 1
tail -n +5 "$1"|wc -l
echo 255

# dump colors
tail -n +5 "$1"

# forgot one color?

