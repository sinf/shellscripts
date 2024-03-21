#!/bin/sh
# Arguments: .ogg files
# Prints how many minutes the total playback is
ogginfo *|grep Playback | awk -F : '{print $2}'|sed 's/\([0-9]\+\)m/+ \1/'|xargs expr 0

