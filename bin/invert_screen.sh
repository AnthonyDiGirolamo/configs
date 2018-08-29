#!/bin/bash
xrandr|grep -q 'eDP1 connected primary .*inverted (normal.*'
if [ $? -eq 0 ]; then
	xrandr -o normal
else
	xrandr -o inverted
fi
