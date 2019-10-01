#!/bin/bash

xrdb -merge ~/.Xresources

if [ - x /usr/bin/xfce4-power-manager ] ; then
	sleep 1
	xfce4-power-manager &
fi

[ -f ~/.xprofile ] && ~/.xprofile

while true; do
	dwm 2> ~/.dwm.log
done
