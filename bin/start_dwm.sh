l#!/bin/sh
xset b 0
xrdb -load ~/.Xdefaults

# nitrogen --restore

trayer --transparent true --alpha 0 --edge top --align right --SetDockType true --SetPartialStrut true --expand true --widthtype request --height 26 --tint 0x222222 &

#/usr/lib/gvfs/gvfsd &
#/usr/lib/libgconf2-4/gconfd-2 &

#/usr/bin/gnome-keyring-daemon -d --login &

gnome-settings-daemon &
gnome-keyring-daemon --start &
gnome-screensaver &
parcellite &
gnome-power-manager &
nm-applet &
pcmanfm --daemon-mode &

#$HOME/apps/conky/bin/conky -q -c ~/.conkyrc_dwm | while true; read line; do xsetroot -name "$line            "; done &
#exec $HOME/.dwm/dwm

while true                                                   
do
	xsetroot -name "[`date +'%R - %D'`] [`uptime | sed 's/.*: //'`]"
	sleep 1
done &
while true; do $HOME/.dwm/dwm > /dev/null; done;

